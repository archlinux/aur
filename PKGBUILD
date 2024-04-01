# Maintainer: Nick Pilipenko <nick <at> k-2 <dot> tech>


pkgname=gdx-liftoff
pkgver=1.12.1.7
pkgrel=1
#epoch=1
pkgdesc="LibGDX project setup"
arch=('any')
url="https://libgdx.com"
license=('APACHE')
depends=('java-environment')

source=("$pkgname-$pkgver.tar.gz::https://github.com/libgdx/gdx-liftoff/archive/refs/tags/v$pkgver.tar.gz"
        "gdx-liftoff"
        "gdx-liftoff.desktop"
)

sha256sums=('01307db8b4e36c3ba131eeeef7a4a0f37d7eb06b3902b5ab1502ceb62a4d353b'
            'b646f91c9504b229c8a59bbb05a7fc410e5284f1e4cdbbf6fcb258eea8056a8b'
            '3756dc0f908f8616d00cd077891a5e8c1b1f72e575227bcfc72db38e2e57c1b6')

jsrc=$pkgname-$pkgver

build() {
  cd $jsrc
  echo "Run build script in directory: `pwd`"
  bash ./gradlew build
  # Build script produce jar with doubling version in file name, rename
  mv $srcdir/$jsrc/build/libs/$pkgname-$pkgver-$pkgver.jar $srcdir/$jsrc/build/libs/$pkgname.jar
}

package() {
  jtarget=$srcdir/$jsrc/build/libs/$pkgname.jar
  cd $srcdir
  chmod +x gdx-liftoff
  mkdir -p $pkgdir/usr/{share/java/$pkgname/,bin,share/pixmaps,share/applications}
  install -Dm644 $jtarget $pkgdir/usr/share/java/$pkgname/
  install -Dm644 $srcdir/$jsrc/raw/vectors/gdx-liftoff.svg $pkgdir/usr/share/pixmaps/gdx-liftoff.svg
  install -Dm644 gdx-liftoff.desktop $pkgdir/usr/share/applications/
  install -Dm755 gdx-liftoff $pkgdir/usr/bin
}
