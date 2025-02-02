# Maintainer: OSAMC <https://github.com/osam-cologne/archlinux-proaudio>
# Contributor: Christopher Arndt <osam -at- chrisarndt -dot- de>
# Contributor: redtide <redtid3 -at- gmail -dot- com>

_name=ConvertWithMoss
pkgname=${_name,,}
pkgver=12.1.0
pkgrel=1
pkgdesc='A tool for converting multi-samples from one format to another'
url='https://mossgrabers.de/Software/ConvertWithMoss/ConvertWithMoss.html'
arch=(aarch64 x86_64)
license=(LGPL-3.0-only)
depends=('java-runtime>=16' sh)
makedepends=(maven)
source=("$pkgname-$pkgver.tar.gz::https://github.com/git-moss/ConvertWithMoss/archive/refs/tags/$pkgver.tar.gz"
        convertwithmoss.sh)
sha256sums=('9f3ea785a678bd3f6a9d798b65ffb57fb89ca66ee7f5eeb56f80f5d522e7295f'
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
  install -vDm 644 README*.md CHANGELOG.md -t "$pkgdir"/usr/share/doc/$pkgname
}
