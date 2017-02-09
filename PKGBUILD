# contributor: fbis251
# former Maintainer: si_kabayan <aaizap4p at gmail dot com>
pkgname=raccoon
pkgver=4.0.1
pkgrel=2
arch=('any')
pkgdesc="Alternative Google Play (with GUI) client to download Android APK files to your computer"
url="http://www.onyxbits.de/raccoon"
license=('Apache')
depends=('java-environment')
makedepends=("gradle")
install=raccoon.install
source=('raccoon.desktop'
        'https://github.com/onyxbits/Raccoon/raw/master/artwork/icon.svg'
        "$pkgname-$pkgver.tar.gz::https://github.com/onyxbits/raccoon4/archive/v$pkgver.tar.gz"
        "raccoon.install"
        "build-on-linux.patch")
noextract=('${pkgname}-${pkgver}.jar')
sha512sums=('99ae7ab9aa77f6de0779c9179e16dbccd36362adc710cd5d7289c473b6aff62d39a0e29be63840bc7f614e360d17b51f877ff2bf2fda938da8fa13e3f9248647'
            'f63e94b86f5b111b8833d53767b0f6eada48426e1b0e30df0137bed455c80ec37087f656e2f0cac9386f4d25441686df82c988252120fc335028d2885b8653f6'
            'b77689885a119d0c317f820f28865a7ece1b96e44467e16f2f0b13add93d030fdc08e461c182e7e3d35a4c3978e5197bc40b0efb9899f0176c0de50b1675009d'
            '0e095c7cb167fd049968ba9e7c5acf51c3454aca884fd3106209d9ba92cd434c22c1398996f58238e98c692d7b0a635c6e6fb60782ba0dcb79cd837fe9ed7bba'
            '20128abc55e1a38a77247fd1452c94fe7c77ffadbbf541198957bbe1238097f8e9c51cb74292fee1f47da588370e3dd19f8f33cab482288ce23c52d5db9304e8')

prepare() {
    cd "$srcdir/raccoon4-$pkgver"
    patch build.gradle ../build-on-linux.patch
}

build() {
    cd "$srcdir/raccoon4-$pkgver"
    gradle -Pversion=$pkgver fatJar
}

package() {
  # install files to java shared dir
  mkdir -p "$pkgdir/usr/share/java/$pkgname"
  install -Dm644 raccoon4-$pkgver/build/libs/Raccoon-desktop-$pkgver.jar "$pkgdir/usr/share/java/$pkgname"

  # install icon and desktop database entry
  install -Dm644 icon.svg "$pkgdir/usr/share/pixmaps/raccoon.svg"
  install -Dm644 raccoon.desktop  "$pkgdir/usr/share/applications/raccoon.desktop"

  # starter
  mkdir -p "$pkgdir/usr/bin"
  cat > "$pkgdir/usr/bin/raccoon" << \here
#!/bin/sh
exec java -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Draccoon.home="$HOME/.Raccoon" -jar /usr/share/java/raccoon/raccoon-pkgver.jar "$@"
exit $?
here
    sed -i "s/pkgver/$pkgver/" "$pkgdir/usr/bin/raccoon"
    chmod a+x "$pkgdir/usr/bin/raccoon"
}

