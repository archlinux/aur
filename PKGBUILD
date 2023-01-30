# contributor: fbis251
# former Maintainer: si_kabayan <aaizap4p at gmail dot com>
pkgname=raccoon
pkgver=4.24.0
pkgrel=1
arch=('any')
pkgdesc="Alternative Google Play (with GUI) client to download Android APK files to your computer"
url="https://raccoon.onyxbits.de/"
license=('Apache')
depends=('java-environment')
#makedepends=("gradle")
install=raccoon.install
source=('raccoon.desktop'
        'https://github.com/onyxbits/Raccoon/raw/master/artwork/icon.svg'
        "$pkgname-$pkgver.tar.gz::https://github.com/onyxbits/raccoon4/archive/v$pkgver.tar.gz"
        "raccoon.install")
noextract=('${pkgname}-${pkgver}.jar')
sha512sums=('99ae7ab9aa77f6de0779c9179e16dbccd36362adc710cd5d7289c473b6aff62d39a0e29be63840bc7f614e360d17b51f877ff2bf2fda938da8fa13e3f9248647'
            'f63e94b86f5b111b8833d53767b0f6eada48426e1b0e30df0137bed455c80ec37087f656e2f0cac9386f4d25441686df82c988252120fc335028d2885b8653f6'
            'cabdb0a19b885415271518d1a2416a155dfab892e0a8ce826dce7af19130f5cbefe7b9eea5b38f4c4f9ba946e07a0ceba2dea22dd046a28f2fda85383f71a8f9'
            '0e095c7cb167fd049968ba9e7c5acf51c3454aca884fd3106209d9ba92cd434c22c1398996f58238e98c692d7b0a635c6e6fb60782ba0dcb79cd837fe9ed7bba')

prepare() {
    sed -i "s/targetCompatibility = 1.7//g" "$srcdir/raccoon4-$pkgver"/build.gradle
    sed -i "s/gradleVersion = \"6.8.2\"/gradleVersion = \"7.2\"/g" "$srcdir/raccoon4-$pkgver"/build.gradle
}

build() {
    cd "$srcdir/raccoon4-$pkgver"
    ./gradlew -Pversion=$pkgver fatJar
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
exec java -Dawt.useSystemAAFontSettings=on -Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel -Draccoon.home="$HOME/.Raccoon" -jar /usr/share/java/raccoon/Raccoon-desktop-pkgver.jar "$@"
exit $?
here
    sed -i "s/pkgver/$pkgver/" "$pkgdir/usr/bin/raccoon"
    chmod a+x "$pkgdir/usr/bin/raccoon"
}

