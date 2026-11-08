# Maintainer: xmengnet <my@liyp.cc>

pkgname=mygo-music
pkgver=0.1.22
pkgrel=1
pkgdesc='MyGo Music - 原生桌面音乐播放器，播放本地文件与插件内容，不使用 WebView'
arch=('x86_64' 'aarch64')
url='https://mygo-music.egoist.dev'
license=('AGPL-3.0-only')
# The UI is drawn natively on the GPU through GTK 3: linux.webview is
# false in mygo.config.ts, so WebKitGTK and libsoup are never loaded.
# libayatana-appindicator has put the app's icon in the notification area
# on Linux since mygo 0.7; without it the app still starts, but closing
# the window quits instead of hiding.
depends=('gtk3' 'libsecret' 'libayatana-appindicator')
optdepends=(
  'libpulse: PulseAudio 音频输出'
  'alsa-lib: ALSA 音频输出（PulseAudio 不可用时）'
  'gtk-layer-shell: Wayland 下的迷你播放器面板'
)
# mygo-music-bin packages the same app from upstream's release; the two
# install the same files, so only one of them fits at a time.
conflicts=('mygo-music-bin')
# Podcast captions need no package: the app downloads the sherpa-onnx
# libraries and the Qwen3-ASR model into its own data directory when the
# listener asks for captions, and loads them with purego.
# mygo.config.ts is code: mygo build runs it with Bun, or with Node.js 22.6
# and later, which strips the types. Only Node.js is packaged for Arch.
makedepends=('go' 'gcc' 'git' 'nodejs')
options=('!debug')

source=("git+https://github.com/egoist/mygo-music.git#tag=v${pkgver}")
sha256sums=('SKIP')

_srcname=mygo-music

if [[ $CARCH == x86_64 ]]; then
  _goarch=amd64
elif [[ $CARCH == aarch64 ]]; then
  _goarch=arm64
else
  echo "Unsupported architecture: $CARCH" >&2
  exit 1
fi

build() {
  cd "${_srcname}"

  # cgo and external linking, as Arch's Go packages do, for a PIE with
  # full RELRO; mygo build passes MYGO_LDFLAGS through last.
  export CGO_ENABLED=1
  export GOFLAGS="-buildvcs=false -buildmode=pie"
  # The hardening flags Arch builds with, kept free of spaces: mygo build
  # re-quotes the value of -extldflags.
  export MYGO_LDFLAGS="-linkmode=external -extldflags=-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now,-z,pack-relative-relocs"

  # Writes the executable, its desktop entry and icons, and a Debian
  # package carrying the 256 and 512 icons hicolor registers.
  go tool mygo build -platform "linux/${_goarch}" -o "${srcdir}/build"
}

package() {
  cd "${_srcname}"

  local _stage="${srcdir}/build/linux-${_goarch}"
  local _deb="mygo-music_${pkgver}_${_goarch}.deb"

  install -Dm755 "${_stage}/mygo-music" "${pkgdir}/usr/bin/mygo-music"

  install -Dm644 "${_stage}/mygo-music.desktop" \
    "${pkgdir}/usr/share/applications/mygo-music.desktop"

  mkdir -p "${srcdir}/deb"
  bsdtar -xf "${_stage}/${_deb}" -C "${srcdir}/deb" data.tar.gz
  bsdtar -xf "${srcdir}/deb/data.tar.gz" -C "${srcdir}/deb"
  for _size in 256 512; do
    install -Dm644 "${srcdir}/deb/usr/share/icons/hicolor/${_size}x${_size}/apps/mygo-music.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/mygo-music.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
