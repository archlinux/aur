# Maintainer: lesto <lestofante88@gmail.com>
# Maintainer: Torben <git@letorbi.com>
# Contributor: F. Rødseth <xyproto@archlinux.org>


pkgname=processing
pkgver=4.3
_build=1293
pkgrel=4
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://www.processing.org/'
license=(GPL LGPL)
depends=('java-environment-openjdk=17' ffmpeg bash glibc mesa libdrm libx11 libxi libxrandr libxrender libxcursor libxxf86vm zlib)
optdepends=('processing-examples: Examples for Processing')
makedepends=(ant gendesk rsync unzip)
options=(!strip)
source=("https://github.com/processing/processing4/archive/processing-$_build-$pkgver.tar.gz"
        disable_update_check.patch
        no_ffmpeg_download.patch
        no_jdk_download.patch)
sha256sums=('8d9f305bb204375a2c76d336b5e368c44ef77d297aaf80b8165f424cdef323a0'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            'b0742db84e6a6b148b56df6d4d1e8a3266461fe0f514f703301a310e99f1d126'
            'f8bde916aa0c3c816ba6cc8c22d180001109982f1640f3bff140a57e5100fc64')

prepare() {
  # Check if OpenJDK 17 executable is actually installed
  if ! [ -f "/usr/lib/jvm/java-17-openjdk/bin/java" ]; then
    echo "Error: OpenJDK 17 executable '/usr/lib/jvm/java-17-openjdk/bin/java' is missing."
    sh -c "exit 1"
  fi
  # Check if FFmpeg executable is actually installed
  if ! [ -f "/usr/bin/ffmpeg" ]; then
    echo "Error: FFmpeg executable '/usr/bin/ffmpeg' is missing."
    sh -c "exit 1"
  fi

  # Symbolic link for not having to repeat the revision number
  ln -sf "${pkgname}4-processing-$_build-$pkgver" $pkgname

  # Create .desktop file
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc" --name="Processing" --exec="processing %f" --mimetypes="text/x-processing"

  # Don't download JDK and JFX files during Ant's build process
  patch $pkgname/build/build.xml < no_jdk_download.patch
  patch $pkgname/build/shared/tools/MovieMaker/build.xml < no_ffmpeg_download.patch

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
  install -Dm644 "build/shared/lib/icons/app-512.png" \
    "$pkgdir/usr/share/pixmaps/processing.png"
  install -Dm644 "$srcdir/processing.desktop" \
    "$pkgdir/usr/share/applications/processing.desktop"

  # Symbolic links in /usr/bin
  ln -s "/usr/share/processing/processing" "$pkgdir/usr/bin/processing"
  ln -s "/usr/share/processing/processing-java" "$pkgdir/usr/bin/processing-java"

  # Link processing's internal java-command to the system's one
  mkdir -p "$pkgdir/usr/share/processing/java/bin/"
  ln -s "/usr/lib/jvm/java-17-openjdk/bin/java" "$pkgdir/usr/share/processing/java/bin/java"

  # Link processing's internal ffmpeg-command to the system's one
  ln -s "/usr/bin/ffmpeg" "$pkgdir/usr/share/processing/tools/MovieMaker/tool/"
}
