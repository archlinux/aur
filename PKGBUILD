# Maintainer: Terin Stock <terinjokes@gmail.com>
# Contributor: Johann Klähn <kljohann@gmail.com>
# Contributor: Gergely Imreh <imrehgATgmailDOTcom>
# Contributor: Ilkka Laukkanen <ilkka.s.laukkanen@gmail.com>

pkgname=stgit
pkgver=0.18
pkgrel=1
pkgdesc="Pushing/popping patches to/from a stack on top of Git, similar to Quilt"
url="http://www.procode.org/stgit/"
arch=('any')
license=('GPL')
depends=('python2' 'git')
makedepends=('xmlto' 'asciidoc')
source=("https://github.com/ctmarinas/stgit/archive/v${pkgver}.tar.gz")
sha256sums=('00c83a0a057ee61a300f2291b8926f85521ffd1c92b4cb5152e2be3bf836d3a5')

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
