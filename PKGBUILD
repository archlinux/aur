# Maintainer: my@liyp.cc

pkgname=mygo-cloudmusic
pkgver=0.1.13
pkgrel=1
pkgdesc='MyGo 云音乐 - 第三方网易云音乐原生客户端'
arch=('x86_64' 'aarch64')
url='https://music.egoist.dev'
license=('AGPL-3.0-only')
depends=('gtk3' 'libsecret')
optdepends=(
  'libpulse: PulseAudio 音频输出'
  'alsa-lib: ALSA 音频输出（PulseAudio 不可用时）'
  'libayatana-appindicator: 系统托盘图标'
  'gtk-layer-shell: 刘海播放器'
)
makedepends=('go' 'gcc' 'git')
options=('!debug')

source=("git+https://github.com/egoist/mygo-cloudmusic.git#tag=v${pkgver}")
sha256sums=('SKIP')

_srcname=mygo-cloudmusic

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
  local _deb="mygo-cloudmusic_${pkgver}_${_goarch}.deb"

  install -Dm755 "${_stage}/mygo-cloudmusic" "${pkgdir}/usr/bin/mygo-cloudmusic"

  install -Dm644 "${_stage}/mygo-cloudmusic.desktop" \
    "${pkgdir}/usr/share/applications/mygo-cloudmusic.desktop"

  mkdir -p "${srcdir}/deb"
  bsdtar -xf "${_stage}/${_deb}" -C "${srcdir}/deb" data.tar.gz
  bsdtar -xf "${srcdir}/deb/data.tar.gz" -C "${srcdir}/deb"
  for _size in 256 512; do
    install -Dm644 "${srcdir}/deb/usr/share/icons/hicolor/${_size}x${_size}/apps/mygo-cloudmusic.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/mygo-cloudmusic.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
