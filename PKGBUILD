# Maintainer: Alexander F. Rødseth <xyproto@archlinux.org>

pkgname=processing-jdk8
pkgver=3.5.4
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://www.processing.org/'
license=(GPL LGPL)
provides=(processing)
conflicts=(processing processing-bin)
# Can upgrade to OpenJDK 10 once java-openjfx has been upgraded to support it
depends=('jdk8' 'libgl')
makedepends=('apache-ant' 'gendesk' 'unzip')
options=(!strip)
# The Processing version scheme for the 3.5.x series uses a special magical
# version number above 0266 in addition to the ordinary version number.
# https is not available for reference.zip.
source=("https://github.com/processing/processing/archive/processing-0$((266+${pkgver##3.5.}))-$pkgver.tar.gz"
        'https://download.processing.org/reference.zip'
        no_downloads.patch)
sha256sums=('99a5d3cfccd106e79fe82cafa66b72b15c19e5747eac77e40dd0a82b032c2925'
            '2014fdb12f979f79c624acc514c14ce318f07cb2cc15a63e1b4febaff733f2a5'
            'e3490e4276d1bd33a00d8accad3d72500519477f8aca44703045d92faa342cf6')

prepare() {
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc"

  # Symbolic link for not having to repeat the revision number
  ln -sf "processing-processing-"*"-$pkgver" $pkgname

  # Copy reference.zip to the java directory
  mkdir -p $pkgname/java
  cp "$srcdir/reference.zip" $pkgname/java/

  # Create missing directories
  mkdir -p $pkgname/build/linux/work/java

  # Don't download any files during Ant's build process
  patch $pkgname/build/build.xml < no_downloads.patch
}

build() {
  cd "$pkgname/build"

  ant build
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/"{bin/,share/processing/}
  cp -r build/linux/work/* "$pkgdir/usr/share/processing/"

  # Desktop shortcut
  install -Dm644 "build/shared/lib/icons/pde-256.png" \
    "$pkgdir/usr/share/pixmaps/processing.png"
  install -Dm644 "$srcdir/processing.desktop" \
    "$pkgdir/usr/share/applications/processing.desktop"

  # Symbolic links in /usr/bin
  ln -s "/usr/share/processing/processing" "$pkgdir/usr/bin/processing"
  ln -s "/usr/share/processing/processing-java" "$pkgdir/usr/bin/processing-java"

  # Use /usr/lib/jvm/default-runtime
  rmdir "$pkgdir/usr/share/processing/java"

  # Processing does not work with OpenJDK 10 or 11, use OpenJDK 8
  #ln -s /usr/lib/jvm/default-runtime/ "$pkgdir/usr/share/processing/java"
  ln -s /usr/lib/jvm/java-8-jdk/ "$pkgdir/usr/share/processing/java"
}

# vim: ts=2 sw=2 et
