# Maintainer: Artem Vorotnikov <artem@vorotnikov.me>

pkgname=angelscript-2.22.1
pkgver=2.22.1
pkgrel=3
pkgdesc="An extremely flexible cross-platform scripting library. - Specific version for Rigs of Rods"
arch=('i686' 'x86_64')
url="http://angelcode.com/angelscript/"
license=('custom:ZLIB')
depends=('gcc-libs')
conflicts=("angelscript")
source=("http://angelcode.com/angelscript/sdk/files/angelscript_2.22.1.zip"
        LICENSE)
sha512sums=('92a2b990044b128c1f34a2033b7e46108d771408f5c7208c4327b2784cd0aa3f3a11f58d97b1419fdca233217305a94835e59e52c05c959d57bff524d372b824'
            'b9e7197d47b55b28f9fea4dafb51d221af46a6d794a783c3875778e9b2f748396bbdaa93d3c1ca0ef2391fa797e85cfd7e27ac5178ec4578c1e7999c0e58b366')

build() {
  cd "$srcdir/sdk/angelscript/projects/gnuc"

  sed -i -e "/^LOCAL/s:=.*:= ${pkgdir}/usr:" \
    -e '/\sCXXFLAGS/s:-g::' \
    -e '/^install/s/:.*/:/' \
    -e 's/ln -s/ln -fs/' \
    makefile

  make
  make SHARED=1 VERSION=$pkgver
}

package() {
  cd "$srcdir/sdk/angelscript/projects/gnuc"

  install -d "$pkgdir"/usr/{lib,include} \
             "$pkgdir"/usr/share/{licenses,doc}/$pkgname \
             "$pkgdir"/usr/share/$pkgname \
             "$pkgdir"/usr/share/doc/$pkgname/{articles,manual}

  make install
  make install SHARED=1 VERSION=$pkgver

  chmod 644 "$pkgdir"/usr/include/*

  msg "Installing add-ons..."
  cd "$srcdir/sdk"
  cp -rf add_on "$pkgdir/usr/share/$pkgname/"

  msg "Installing documentation and license..."
  cd "$srcdir/sdk/docs"
  install -m644 articles/* "$pkgdir/usr/share/doc/$pkgname/articles"
  install -m644 manual/* "$pkgdir/usr/share/doc/$pkgname/manual"
  install -m644 index.html "$pkgdir/usr/share/doc/$pkgname"
  install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname"
}
