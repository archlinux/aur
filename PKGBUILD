# Maintainer: Achilleas Pipinellis <axilleas@archlinux.info>

pkgname=kamaki
pkgver=0.13
pkgrel=3
pkgdesc="A command-line tool for managing clouds"
arch=(any)
url="http://code.grnet.gr/projects/kamaki"
license=('BSD')
changelog=Changelog
depends=('python2-objpool' 'python2-progress' 'python2-dateutil' 'astakosclient')
makedepends=('python2-distribute' 'python2-sphinx')
optdepends=('python2-ansicolors: for color support')
source=("https://pypi.python.org/packages/source/k/$pkgname/$pkgname-$pkgver.tar.gz"
        ca_certificates.patch )

prepare() {
  # Patch ca-certificates
  # https://github.com/grnet/kamaki/commit/7e55787ac56a3169f36001ca837537eef4af42f1
  cd "$srcdir/$pkgname-$pkgver/$pkgname"
  patch -Np2 -i ../../ca_certificates.patch
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  python2 setup.py install --root="$pkgdir" -O1
  install -Dm644 COPYRIGHT "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 Changelog "$pkgdir/usr/share/$pkgname/ChangeLog"

  # Build documentation and man page
  cd "$srcdir/$pkgname-$pkgver/docs"
  sed -i 's/sphinx-build/sphinx-build2/' Makefile
  make html && make man && rm -rf "_build/html/man" && rm -rf  _build/doctrees

  mkdir -p "$pkgdir"/usr/share/{man/man1,docs/"$pkgname"}
  install -Dm644 _build/man/*.1 "$pkgdir/usr/share/man/man1/"
  cp -r _build/html/ "$pkgdir/usr/share/docs/$pkgname/html"
}

md5sums=('ad3d9a2e9398534b70012809b97fd6c5'
         '34afd4f5b468a23fcf6a99bf947b8f71')
