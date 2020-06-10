# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgname=pagekite
pkgver=1.5.2.200603
pkgrel=1
pkgdesc='Python implementation of the PageKite remote front-end protocols.'
arch=('any')
url='https://pagekite.net/wiki/OpenSource/'
license=('AGPL3')
depends=('python2' 'python2-six' 'python2-socksipychain')
makedepends=('python2-setuptools')
provides=('pagekite')
conflicts=('python2-pagekite')
options=(!emptydirs zipman)
source=(
  "${pkgname}-${pkgver}.tar.gz::https://github.com/pagekite/PyPagekite/archive/v${pkgver}.tar.gz"
)
sha256sums=(
  'ffe5d52f609458e2bbc7e7740688604991a66838b39aa4ba5af7656ee65759c2'
)

build() {
  cd "${srcdir}/PyPagekite-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/PyPagekite-${pkgver}"
  python2 setup.py install --root="$pkgdir" --optimize=1

  # Config files
  for configfile in etc/pagekite.d/*
  do
    install -Dm644 "${configfile}" "${pkgdir}/etc/pagekite.d/$(basename "${configfile}")"
  done

  # Man pages
  for manpage in doc/*.1
  do
    install -Dm644 "${manpage}" "${pkgdir}/usr/share/man/man1/$(basename "${manpage}")"
  done

  # logrotate
  install -Dm644 etc/logrotate.d/pagekite.debian "${pkgdir}/etc/logrotate.d/pagekite"
}

# vim:set ts=2 sw=2 et ft=sh:
