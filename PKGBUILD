# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4
pkgver=4.0b3
pkgrel=3
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
provides=('processing' 'processing4')
conflicts=('processing')
depends=( 'jdk-openjdk' 'java-openjfx')
makedepends=('ant' 'gendesk' 'rsync' 'unzip')
options=(!strip)
source=("https://github.com/processing/processing4/archive/processing-$((1275+${pkgver##4.0b}))-$pkgver.tar.gz"
        disable_update_check.patch
        get_reference_via_https.patch
        fix_theme_engine.patch
        no_ffmpeg_download.patch
        no_jdk_download.patch
        no_jfx_download.patch
        use_system_jdk.patch
        use_system_libraries.patch)
sha256sums=('1f328895ca20b7b077f10faaac8d342f985c3ae80133b2384324c02ffbd185da'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            '1d549cf94d033e572050f85a59c6ba526aee2bce6b4c96e8b55764136e6c21b5'
            '24b8a3e18b6e3a0de9422e4dbde46cceb91385f7ad6bdc89ec0a9614e082c977'
            'b0742db84e6a6b148b56df6d4d1e8a3266461fe0f514f703301a310e99f1d126'
            'c390900419ac9ad188700075a09b658f672d2f3471c8ced0be4f3008ee375d5f'
            'dc733c1cb5a41cb06ef0f9ea01d701fd9ac7713b5817b4fe79d7076a505a7c44'
            'd2877ad894f76594675534026ee91581f6357a3892afe2fd0efcf86de746c7cb'
            '15119264b6ae7b154f033261ba93535c2d1b5e2b9d849f3999dd7881cc9e49cb')

prepare() {
  # Symbolic link for not having to repeat the revision number
  ln -sf "$pkgname-processing-$((1275+${pkgver##4.0b}))-$pkgver" $pkgname

  # Create .desktop file
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc" --name="Processing" --exec="processing %f" --mimetypes="text/x-processing"

  # Don't download JDK and JFX files during Ant's build process
  patch $pkgname/build/build.xml < no_jdk_download.patch
  patch $pkgname/java/libraries/javafx/build.xml < no_jfx_download.patch
  patch $pkgname/build/shared/tools/MovieMaker/build.xml < no_ffmpeg_download.patch

  # Ensure that reference.zip is downloaded via HTTPS
  patch -p0 < get_reference_via_https.patch

  # Use system libraries during build process
  patch $pkgname/core/build.xml < use_system_libraries.patch
  patch $pkgname/build/shared/tools/ThemeEngine/build.xml < fix_theme_engine.patch

  # Use system JDK to start processing
  patch $pkgname/build/linux/processing < use_system_jdk.patch

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
