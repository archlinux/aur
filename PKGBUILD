# Maintainer: xmengnet <my@liyp.cc>

pkgname=finallyshell-git
pkgver=0.4.1.preview.5.r2.g4ecd207
pkgrel=1
pkgdesc='A source-available SSH client with a FinalShell-like layout, written in Go'
arch=('x86_64' 'aarch64')
url='https://github.com/TooonyChen/finallyshell'

license=('PolyForm-Noncommercial-1.0.0')

depends=('gtk3' 'libsecret' 'libayatana-appindicator')
makedepends=('go' 'gcc' 'git')
provides=('finallyshell')
conflicts=('finallyshell')
options=('!debug')

source=('finallyshell::git+https://github.com/TooonyChen/finallyshell.git#branch=main')
sha256sums=('SKIP')

_srcname=finallyshell

if [[ $CARCH == x86_64 ]]; then
  _goarch=amd64
elif [[ $CARCH == aarch64 ]]; then
  _goarch=arm64
else
  echo "Unsupported architecture: $CARCH" >&2
  exit 1
fi

pkgver() {
  cd "${srcdir}/${_srcname}"
  git describe --long --tags --abbrev=7 --match 'v*' |
    sed 's/^v//; s/\([^-]*-g\)/r\1/; s/-/./g'
}

build() {
  cd "${srcdir}/${_srcname}"

  # mygo build 把 mygo.json 里的版本写进程序，git 才知道真正的版本。
  sed -i "s/\"version\": \"[^\"]*\"/\"version\": \"${pkgver}\"/" mygo.json


  export CGO_ENABLED=1
  export GOFLAGS="-buildvcs=false -buildmode=pie"
  export MYGO_LDFLAGS="-linkmode=external -extldflags=-Wl,-O1,--sort-common,--as-needed,-z,relro,-z,now,-z,pack-relative-relocs"

  go tool mygo build -platform "linux/${_goarch}" -o "${srcdir}/build"
}

package() {
  cd "${srcdir}/${_srcname}"

  local _stage="${srcdir}/build/linux-${_goarch}"


  install -d "${pkgdir}/usr/lib/finallyshell"
  install -m755 "${_stage}/finallyshell" "${pkgdir}/usr/lib/finallyshell/"
  install -m644 "${_stage}/libghostty-vt.so" "${pkgdir}/usr/lib/finallyshell/"
  install -m644 "${_stage}/icon.png" "${pkgdir}/usr/lib/finallyshell/"

  install -d "${pkgdir}/usr/bin"
  ln -s ../lib/finallyshell/finallyshell "${pkgdir}/usr/bin/finallyshell"

  install -Dm644 "${_stage}/finallyshell.desktop" \
    "${pkgdir}/usr/share/applications/finallyshell.desktop"

  for _size in 256 512; do
    install -Dm644 "${_stage}/finallyshell-${_size}x${_size}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${_size}x${_size}/apps/finallyshell.png"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
