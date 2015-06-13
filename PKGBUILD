# Maintainer: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=0.17.1
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="http://www.procode.org/stgit/"
arch=('any')
license=('GPL')
depends=('python2' 'git')
makedepends=('xmlto' 'asciidoc')
source=("http://download.gna.org/stgit/stgit-${pkgver}.tar.gz")
md5sums=('12e10e73276fa865098a23f032effd9b')

build() {
  cd "$srcdir"/$pkgname-$pkgver
  sed -ri 's/(^#!.*)python$/\1python2/g' stg stg-build
  msg "Building documentation..."
  make doc
}

package() {
  cd "$srcdir"/$pkgname-$pkgver
  python2 setup.py install --root="$pkgdir" --prefix=/usr
  chmod 644 "$pkgdir"/usr/share/stgit/{completion/stgit-completion.bash,contrib/stgbashprompt.sh}
  for manpage in ./Documentation/*.1; do
    install -D -m644 $manpage "$pkgdir"/usr/share/man/man1/$(basename $manpage)
  done
}
