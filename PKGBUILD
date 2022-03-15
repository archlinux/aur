# Contributor: Johannes Weiner <hannes@saeurebad.de>
# Contributor: Daniel Leidisch <spam@leidisch.net>
# Contributor: Stefan Husmann <stefan-husmann@t-online.de>
_base=slime
pkgname=${_base}-git
pkgver=2.24.r17.g8cb09801
pkgrel=1
pkgdesc="The Superior Lisp Interaction Mode for Emacs - from git"
arch=(any)
url="https://${_base}.common-lisp.dev"
license=(GPL)
depends=(emacs awk)
makedepends=(git texinfo texlive-core)
optdepends=('awk: for recreating the documentation'
  'texlive-core: for recreating the documentation')
provides=(${_base})
conflicts=(${_base})
install=${_base}.install
source=(git+https://github.com/${_base}/${_base})
sha512sums=('SKIP')

pkgver() {
  cd ${_base}
  echo $(git describe --tags | sed 's|-|.r|' | tr - . | cut -c2-)
}
build() {
  cd ${_base}
  make
}

package() {
  cd ${_base}
  install -d "${pkgdir}"/usr/share/emacs/site-lisp/${_base}
  cp -r * "${pkgdir}"/usr/share/emacs/site-lisp/${_base}

  install -d "${pkgdir}"/usr/share/common-lisp/systems
  ln -s /usr/share/emacs/site-lisp/${_base}/swank.asd \
    "${pkgdir}"/usr/share/common-lisp/systems/

  install -D -m644 README.md \
    "${pkgdir}"/usr/share/licenses/${pkgname}/public_domain.txt
  cd doc
  make infodir="${pkgdir}"/usr/share/info install
  rm "${pkgdir}"/usr/share/info/dir
  install -Dm644 ${_base}-refcard.pdf \
    "${pkgdir}"/usr/share/doc/${_base}/${_base}-refcard.pdf
}
