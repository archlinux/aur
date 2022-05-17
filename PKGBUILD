pkgname=raccoon-bin
pkgver=4.20.0
pkgrel=1
arch=('any')
pkgdesc="Alternative Google Play (with GUI) client to download Android APK files to your computer, binary version"
url="http://raccoon.onyxbits.de"
license=('Apache')
depends=('java-environment')
provides=('raccoon')
source=('raccoon.desktop'
        'https://github.com/onyxbits/Raccoon/raw/master/artwork/icon.svg'
        "https://raccoon.onyxbits.de/apk-downloader/raccoon-${pkgver}.jar")
noextract=('${pkgname}-${pkgver}.jar')
sha512sums=('99ae7ab9aa77f6de0779c9179e16dbccd36362adc710cd5d7289c473b6aff62d39a0e29be63840bc7f614e360d17b51f877ff2bf2fda938da8fa13e3f9248647'
            'f63e94b86f5b111b8833d53767b0f6eada48426e1b0e30df0137bed455c80ec37087f656e2f0cac9386f4d25441686df82c988252120fc335028d2885b8653f6'
            '854cc266188d394eec68280315fd847e2c93030836abbd93c1677631b9eb3d1000403cf6f9cbafec072af29a2a9ae51823327b4c892295600f15b48dfa7b262b')

package() {
  # install files to java shared dir
  mkdir -p "$pkgdir/usr/share/java/${pkgname/-bin}"
  install -Dm644 raccoon-$pkgver.jar "$pkgdir/usr/share/java/${pkgname/-bin}"

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
