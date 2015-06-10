# Maintainer: Axilleas Pipinellis <axilleas@archlinux.info>

_pkgname=snf_image_creator
pkgname=snf-image-creator
pkgver=0.8
pkgrel=1
pkgdesc="Command line tool for creating images"
url="http://docs.dev.grnet.gr/snf-image-creator/latest/"
arch=('any')
license=('BSD')
changelog=ChangeLog
depends=('python2' 'rsync' 'libguestfs' 'python2-dialog' 'python2-sendfile'
'python2-progress' 'python2-ansicolors' 'kamaki'  'python2-sh' 'python2-pyparted')
makedepends=('python2-distribute' 'python2-sphinx')
optdepends=('winexe: support for Windows images',
            'hivex: support for Windows images')
source=("https://pypi.python.org/packages/source/s/$_pkgname/$_pkgname-$pkgver.tar.gz")

package() {

  cd "$srcdir/$_pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 ChangeLog "$pkgdir/usr/share/$pkgname/ChangeLog"

  # Build documentation and man page
  cd "$srcdir/$_pkgname-$pkgver/docs"
  sed -i 's/sphinx-build/sphinx-build2/' Makefile
  make html && make man && rm -rf "_build/html/man" && rm -rf  _build/doctrees

  mkdir -p "$pkgdir"/usr/share/{man/man1,docs/"$pkgname"}
  install -Dm644 _build/man/*.1 "$pkgdir/usr/share/man/man1/"
  cp -r _build/html/ "$pkgdir/usr/share/docs/$pkgname/html"

}

md5sums=('2f7d4c2efd1b94a4fbd496ce796658b8')
