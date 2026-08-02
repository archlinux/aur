# Maintainer: skarphet

_pkgname=GTKCssLanguageServer
pkgname=gtkcsslanguageserver-git
_pkgver=0.1.0
_commit=dcbe75012d2d26fbca2729cee014e4860e31fa53
pkgver=0.1.0.r111.gdcbe750
pkgrel=1
pkgdesc="Language server for the GTK CSS flavor"
arch=('x86_64' 'aarch64')
url="https://github.com/JCWasmx86/GTKCssLanguageServer"
license=('GPL-3.0-or-later' 'MIT')
depends=(
  'glib2'
  'glibc'
  'gtk4'
  'json-glib'
  'jsonrpc-glib'
)
makedepends=(
  'git'
  'meson'
  'ninja'
  'vala'
)
provides=('gtkcsslanguageserver')
conflicts=('gtkcsslanguageserver')
source=("${_pkgname}::git+https://github.com/JCWasmx86/GTKCssLanguageServer.git#commit=${_commit}")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "%s.r%s.g%s" "${_pkgver}" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  arch-meson "${_pkgname}" build
  meson compile -C build
}

check() {
  local _test_css="${srcdir}/test_valid.css"
  echo "window { background-color: #ffffff; }" > "${_test_css}"
  "${srcdir}/build/src/gtkcsslanguageserver" "${_test_css}"
  rm -f "${_test_css}"
}

package() {
  meson install -C build --destdir "${pkgdir}"
  install -Dm644 "${_pkgname}/COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
}
