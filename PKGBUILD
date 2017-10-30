# Maintainer: Aaron Griffin <aaron@archlinux.org>
# Contributor: David Moore <davidm@sjsoft.com>

pkgname=slib
pkgver=3b5
pkgrel=2
pkgdesc="A library providing functions for Scheme implementations"
arch=('any')
url="http://people.csail.mit.edu/jaffer/SLIB.html"
license=('custom')
depends=('guile1.8' 'sh')
options=('emptydirs')
install=slib.install
source=("http://groups.csail.mit.edu/mac/ftpdir/scm/$pkgname-$pkgver.zip")
md5sums=('b3181fa98bbb4153a4fc984c3e71a86b')

prepare() {
  cd ${pkgname}
  sed -r -i "s,/usr/(local/)?lib/slib,/usr/share/slib,g" *.init
}

package() {
  cd ${pkgname}
  install -m755 -d "${pkgdir}"/usr/{bin,share/{guile/site,slib}}
  install -m644 *.scm *.init *.xyz *.txt *.dat *.ps "${pkgdir}/usr/share/slib/"
  install -D -m644 slib.info "${pkgdir}/usr/share/info/slib.info"
  install -D -m644 slib.1 "${pkgdir}/usr/share/man/man1/slib.1"
  install -D -m644 COPYING "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"

  cat << _EOF > "${pkgdir}/usr/bin/slib"
#!/bin/sh
SCHEME_LIBRARY_PATH=/usr/share/slib/
export SCHEME_LIBRARY_PATH
VERSION=${pkgver}
S48_VICINITY="/usr/share/scheme48/"
export S48_VICINITY
_EOF

  cat slib.sh >> "${pkgdir}/usr/bin/slib"
  chmod 755 "${pkgdir}/usr/bin/slib"

  ln -s /usr/share/slib "${pkgdir}/usr/share/guile/site/"
}
