# Maintainer: yuzujr <15568103056@163.com>

pkgname=ani2xcursor
pkgver=1.3.0
pkgrel=1
pkgdesc="Convert Windows animated cursor themes to Linux Xcursor format"
arch=('x86_64')
url="https://github.com/yuzujr/ani2xcursor"
license=('MIT')

depends=('glibc')
makedepends=(
  'xmake'
  'gcc'
  'pkgconf'
)

source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('047990ee14dedcd251f88e19f2a247ed6b06c28ddc16491e495c1fd953e897f1')

_xmake_env() {
  export XMAKE_GLOBALDIR="$srcdir/.xmake-global"
  export XMAKE_PKG_CACHEDIR="$srcdir/.xmake-cache"
  export XMAKE_PKG_INSTALLDIR="$srcdir/.xmake-packages"
}

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _xmake_env

  local _map="-ffile-prefix-map=${srcdir}=/usr/src/debug/${pkgname}-${pkgver} \
              -fmacro-prefix-map=${srcdir}=/usr/src/debug/${pkgname}-${pkgver}"

  xmake f -m release -y \
    --cflags="${CFLAGS} ${_map}" \
    --cxxflags="${CXXFLAGS} ${_map}" \
    --ldflags="${LDFLAGS}"

  xmake require -y spdlog
  xmake require -y stb
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  _xmake_env

  xmake -y
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "build/linux/x86_64/release/ani2xcursor" "${pkgdir}/usr/bin/ani2xcursor"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
