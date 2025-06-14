# Maintainer: Root-Core <aur at root-core dot net>
_pkgname=MiniLPA
pkgname=minilpa
pkgver=1.1.1
pkgrel=2
pkgdesc="Professional LPA UI"
arch=('x86_64')
url="https://github.com/EsimMoe/MiniLPA"
license=('AGPL-3.0')
makedepends=('git' 'powershell' 'java-environment-openjdk')
depends=('java-runtime-openjdk')
provides=("minilpa")
conflicts=("minilpa")
source=(
  $_pkgname-$pkgver.tar.gz::https://github.com/EsimMoe/MiniLPA/archive/refs/tags/v$pkgver.tar.gz
  $pkgname.desktop
  $pkgname.sh
  eum-manifest.json
  ci-manifest.json
)
sha256sums=(
  a56a8342215d25d127bdc17fb3bc2e569eb4b28bb2043ee81407ff59373e4218
  c3f3c4f24581d89af194e6605eb3fdac59612752b94e6841d15aff927d812a13
  89bd22e555dbd9eb8a9fee7cbdfd8f21c05120141cc4edef38d4c65ac4615ed0
  88eb7c2d3a8c4903c761ca8265c5af56960fd5fe5834887d41acd74312f39ec6
  00296c332838d593f9066d8d53d20763aa9c77bc512f3d4e38b5357fd1f6bdad
)

prepare() {
  cd $srcdir/$_pkgname-$pkgver
  cp $srcdir/{eum,ci}-manifest.json src/main/resources/
  mkdir -p build
  echo -n "1749825743526" > build/euicc_info_update_time
}

build() {
  cd $srcdir/$_pkgname-$pkgver
  pwsh scripts/Build.ps1 -NativeExecutable -NativeExecutableType app-image
}

package() {
  install -Dm755 $pkgname.sh $pkgdir/usr/bin/$pkgname
  install -Dm644 $pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop

  cd $srcdir/$_pkgname-$pkgver
  cd build/dist
  bsdtar -xf MiniLPA-Linux-x86_64.zip
  install -Dm755 lib/app/MiniLPA-all.jar $pkgdir/usr/lib/$pkgname/MiniLPA.jar
  install -Dm644 lib/MiniLPA.png $pkgdir/usr/share/icons/hicolor/256x256/apps/$pkgname.png
}
