# Maintainer: peeweep <peeweep at 0x0 dot ee>

pkgname=clash-dashboard-git
_pkgname=clash-dashboard
pkgver=20191205.6b41cbe
pkgrel=1
pkgdesc="web port of clash"
arch=('any')
url="https://github.com/Dreamacro/clash-dashboard"
license=('MIT')
depends=('nodejs')
makedepends=('npm' 'nodejs' 'git')
optdepends=(
  "nginx: web server"
  "apache: web server"
)
options=(!strip)
install=${_pkgname}.install
conflicts=('clash-dashboard')
source=("${_pkgname}::git+$url.git"
  "${_pkgname}.service")
sha1sums=('SKIP'
          '14481461e8af49e6d5bcfb3e23546f96697ebf17')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git log -1 --format='%cd.%h' --date=short | tr -d -
}

prepare() {
  cd "${srcdir}/${_pkgname}"
  npm install --cache "${srcdir}/npm-cache"
}

build() {
  cd "${srcdir}/${_pkgname}"
  npm run-script build
}

package() {
  install -dm755 "${pkgdir}/usr/share"
  cp -r "${srcdir}/${_pkgname}" "${pkgdir}/usr/share/${_pkgname}"
  find "${pkgdir}/usr/share/${_pkgname}/node_modules" \
    -name "*.a" -exec rm '{}' \; \
    -or -name "*.bat" -exec rm '{}' \; \
    -or -name "*.c" -exec rm '{}' \; \
    -or -name "*.cpp" -exec rm '{}' \; \
    -or -name "*.node" -exec chmod a-x '{}' \; \
    -or -name "benchmark" -prune -exec rm -r '{}' \; \
    -or -name "doc" -prune -exec rm -r '{}' \; \
    -or -name "html" -prune -exec rm -r '{}' \; \
    -or -name "man" -prune -exec rm -r '{}' \; \
    -or -name "scripts" -prune -exec rm -r '{}' \;
  install -Dm644 "${srcdir}/${_pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
  install -Dm644 "${srcdir}/${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
}
