# Maintainer: Michael Stegeman <mstegeman@mozilla.com>
pkgname=pagekite
pkgver=1.0.1.200424
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
  "https://pagekite.net/pk/src/${pkgname}-${pkgver}.tar.gz"
)
sha256sums=(
  '693def32aded61845cc0fec4d727c3fb4473d1864f2488a4a2e49224b006f398'
)

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
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
