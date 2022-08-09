# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4-git
pkgver=4.0.1.r0.g58ff6a3c
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
source=(disable_update_check.patch
        no_ffmpeg_download.patch
        no_jdk_download.patch)
sha256sums=('35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            'b0742db84e6a6b148b56df6d4d1e8a3266461fe0f514f703301a310e99f1d126'
            'f8bde916aa0c3c816ba6cc8c22d180001109982f1640f3bff140a57e5100fc64')

pkgver() {
  cd "$srcdir/$pkgname"

  git describe --long | sed 's/^processing-[^-]\+-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  # The size of a full clone is more than 1GB, so we just make a shallow clone
  # Fetching 1000 commits is hopefully enough to find the latest version tag
  rm -rf $pkgname
  git clone --depth 1000 https://github.com/processing/processing4.git $pkgname

  # Create .desktop file
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc" --name="Processing" --exec="processing %f" --mimetypes="text/x-processing"

  # Don't download packages that can be provided via dependencies
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
