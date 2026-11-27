# Maintainer: Brandon Pollack <brandonpollack23 at gmail dot com>

pkgname=icl-bin
_pkgname=icl
pkgver=1.26.0
_debrel=1
pkgrel=1
pkgdesc="Interactive Common Lisp: an enhanced REPL with editing, completion, browser UI and notebooks (prebuilt)"
arch=('x86_64')
url="https://github.com/atgreen/icl"
license=('MIT')
depends=('glibc' 'zstd')
optdepends=(
  'sbcl: default Lisp implementation (required for profiling and coverage)'
  'ccl: alternative Lisp implementation'
  'ecl: alternative Lisp implementation'
  'clisp: alternative Lisp implementation'
  'abcl: alternative Lisp implementation'
  'roswell: use a Roswell-managed Lisp environment'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
# SBCL executables embed their core image; stripping breaks them.
options=('!strip' '!debug')
source=("${_pkgname}-${pkgver}-${_debrel}_amd64.deb::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}-${_debrel}_amd64.deb")
noextract=("${_pkgname}-${pkgver}-${_debrel}_amd64.deb")
sha256sums=('8f41c8cd4840b502de2ac45db4173be6e0ba8bca4296cf29961cc1a35fa84379')

prepare() {
  mkdir -p deb
  bsdtar -xOf "${_pkgname}-${pkgver}-${_debrel}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C deb
}

package() {
  cp -a deb/. "${pkgdir}/"

  # Debian puts the license under /usr/share/doc; Arch expects it in /usr/share/licenses.
  install -Dm644 "${pkgdir}/usr/share/doc/${_pkgname}/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # Debian-specific changelog is not useful here.
  rm -f "${pkgdir}/usr/share/doc/${_pkgname}/changelog.Debian.gz"
}
