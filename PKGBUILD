# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: redtide <redtid3 -at- gmail -dot- com>

_name=ConvertWithMoss
pkgname=${_name,,}
pkgver=13.1.0
pkgrel=1
pkgdesc='A tool for converting multi-samples from one format to another'
url='https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html'
arch=(aarch64 x86_64)
license=(LGPL-3.0-only)
depends=('java-runtime>=16' sh)
makedepends=(maven jdk-openjdk)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz"
        convertwithmoss.sh)
sha256sums=('56f0cc358279fe3d6badfa124f48364f68476d1690eb718d2b97432c70635aad'
            '119c190f92a96c3556b770d504ada91fc89d522e837bf490dd3c6b4577d7ca3d')

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
