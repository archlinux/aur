# Maintainer: Michael Schubert <mschu.dev at gmail> github.com/mschubert/PKGBUILDs
pkgname=dunnart-git
pkgver=r237.af43b7c
pkgrel=1
pkgdesc="A constrained-based diagram editor"
arch=('i686' 'x86_64')
url="https://github.com/mjwybrow/dunnart"
license=('GPL')
depends=('qt5-base')
makedepends=('git')
provides=('adaptagrams-git')
conflicts=('adaptagrams-git')
source=($pkgname::git+$url.git
        dunnart.sh)
sha256sums=('SKIP'
            '0f2ad2258f5f993b093eb0da649d28908b468afefaed46bc1997a08ec65df565')

pkgver() {
  cd "$srcdir/$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  qmake -recursive -config release dunnart.pro
  make
}

package() {
  cd "$srcdir/$pkgname"

  for FILE in $(find lib* -name "*.h"); do
    install -Dm644 $FILE "$pkgdir/usr/include/$FILE"
  done

  cd build
  mkdir -p "$pkgdir"/usr/{bin,lib/dunnart/plugins,share/dunnart}

  for FILE in libavoid libcola libdunnartcanvas libogdf libtopology libvpsc; do
    install -m755 $FILE.so.1.0.0 "$pkgdir/usr/lib"
    ln -s /usr/lib/$FILE.so.1.0.0 "$pkgdir/usr/lib/$FILE.so"
    ln -s /usr/lib/$FILE.so.1.0.0 "$pkgdir/usr/lib/$FILE.so.1"
    ln -s /usr/lib/$FILE.so.1.0.0 "$pkgdir/usr/lib/$FILE.so.1.0"
    ln -s /usr/lib/$FILE.so.1.0.0 "$pkgdir/usr/lib/dunnart/$FILE.so.1"
  done

  install -m755 Dunnart "$pkgdir/usr/lib/dunnart"
  install -m755 plugins/* "$pkgdir/usr/lib/dunnart/plugins"
  install -m644 *.png "$pkgdir/usr/share/dunnart"
  install -Dm755 "$srcdir/dunnart.sh" "$pkgdir/usr/bin/dunnart"
}
