# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: redtide <redtid3 -at- gmail -dot- com>

_name=ConvertWithMoss
pkgname=${_name,,}
pkgver=16.0.0
pkgrel=1
pkgdesc='A tool for converting multi-samples from one format to another'
url='https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html'
arch=(aarch64 x86_64)
license=(LGPL-3.0-only)
depends=('java-runtime>=16' sh)
makedepends=(maven jdk-openjdk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz"
        'convertwithmoss-javafx-version.patch'
        'convertwithmoss.sh')
sha256sums=('ac5dad06e309b4b136bdd89cd0bb99bf54f052114a74b24ef6d6fa245a6e24d5'
            '56b98e20ea95de4705be0696935c23dffb2f30c496c7532b37eaf9bfb5b10df0'
            '119c190f92a96c3556b770d504ada91fc89d522e837bf490dd3c6b4577d7ca3d')

prepare() {
  cd $_name-$pkgver
  if [[ "$CARCH" = "aarch64" ]]; then
    # Change version of javafx dependency to preview version 26-ea+17 for aarch64 support
    patch -p1 -N -r - -i "$srcdir"/convertwithmoss-javafx-version.patch
  fi
}

build() {
  cd $_name-$pkgver
  mvn -Dproject.build.outputTimestamp=$SOURCE_DATE_EPOCH clean install
}

package() {
  install -vDm 755 $pkgname.sh "$pkgdir"/usr/bin/$pkgname
  cd $_name-$pkgver
  install -vDm 644 target/lib/*.jar -t "$pkgdir"/usr/share/java/$pkgname
  ln -sf $pkgname-$pkgver.jar "$pkgdir"/usr/share/java/$pkgname/$pkgname.jar
  install -vDm 644 linux/de.mossgrabers.$_name.desktop \
    -t "$pkgdir"/usr/share/applications
  install -vDm 644 linux/de.mossgrabers.$_name.appdata.xml \
    -t "$pkgdir"/usr/share/metainfo
  install -vDm 644 icons/$pkgname.png -t "$pkgdir"/usr/share/pixmaps
  install -vDm 644 documentation/*.{csv,md,ods} -t "$pkgdir"/usr/share/doc/$pkgname
}
