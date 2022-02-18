# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4
pkgver=4.0b6
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
provides=('processing' 'processing4')
conflicts=('processing')
depends=('java-environment-openjdk=17')
makedepends=('ant' 'gendesk' 'rsync' 'unzip')
options=(!strip)
source=("https://github.com/processing/processing4/archive/processing-$((1275+${pkgver##4.0b}))-$pkgver.tar.gz"
        disable_update_check.patch
        get_reference_via_https.patch
        no_ffmpeg_download.patch
        no_jdk_download.patch)
sha256sums=('76f4a9d13f8deb4f820095e3ae20237af42fbc9c6a08b8a5ecb5f370c8731f10'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            '970cab09bb2d22f9a72415d626ab77714b31b2727c51e4d8992eeee4f7f3645d'
            'b0742db84e6a6b148b56df6d4d1e8a3266461fe0f514f703301a310e99f1d126'
            '5c3314d6a63955fa472aa87c6c99a9675eed3db9c589b784593c9f14432ef201')

prepare() {
  # Symbolic link for not having to repeat the revision number
  ln -sf "$pkgname-processing-$((1275+${pkgver##4.0b}))-$pkgver" $pkgname

  # Create .desktop file
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc" --name="Processing" --exec="processing %f" --mimetypes="text/x-processing"

  # Don't download JDK and JFX files during Ant's build process
  patch $pkgname/build/build.xml < no_jdk_download.patch
  patch $pkgname/build/shared/tools/MovieMaker/build.xml < no_ffmpeg_download.patch

  # Ensure that reference.zip is downloaded via HTTPS
  patch -p0 < get_reference_via_https.patch

  # Disable update check in default preferences
  patch $pkgname/build/shared/lib/defaults.txt < disable_update_check.patch
}

build() {
  cd "$pkgname/build"

  JAVA_HOME="/usr/lib/jvm/java-17-openjdk" ant build
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/"{bin/,share/processing/}
  cp -r build/linux/work/* "$pkgdir/usr/share/processing/"

  # MIME type, icon and desktop shortcut
  install -Dm644 "build/linux/processing-pde.xml" \
    "$pkgdir/usr/share/mime/packages/processing-pde.xml"
  install -Dm644 "build/shared/lib/icons/pde-256.png" \
    "$pkgdir/usr/share/pixmaps/processing.png"
  install -Dm644 "$srcdir/processing.desktop" \
    "$pkgdir/usr/share/applications/processing.desktop"

  # Symbolic links in /usr/bin
  ln -s "/usr/share/processing/processing" "$pkgdir/usr/bin/processing"
  ln -s "/usr/share/processing/processing-java" "$pkgdir/usr/bin/processing-java"

  # Link processing's internal java-command to the system's one
  mkdir -p "$pkgdir/usr/share/processing/java/bin/"
  ln -s /usr/lib/jvm/java-17-openjdk/bin/java "$pkgdir/usr/share/processing/java/bin/java"

  # Link processing's internal ffmpeg-command to the system's one
  ln -s /usr/bin/ffmpeg "$pkgdir/usr/share/processing/tools/MovieMaker/tool/"
}
