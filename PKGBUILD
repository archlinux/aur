# Maintainer: Torben <git at letorbi dot com>
# Contributor: lesto <mombelli.mauro at gmail dot com>
# Contributor: Antonio Rojas <arojas at archlinux dot org>
# Contributor: Alexander F. Rødseth <xyproto at archlinux dot org>

pkgname=processing-jdk8
pkgver=3.5.4
pkgrel=4
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions (always uses Oracle JDK 8)'
url='https://www.processing.org/'
license=(GPL LGPL)
provides=(processing)
conflicts=(processing processing-bin)
depends=('jdk8' 'libgl')
makedepends=('ant' 'gendesk' 'unzip')
options=(!strip)
# The Processing version scheme for the 3.5.x series uses a special magical
# version number above 0266 in addition to the ordinary version number.
source=("https://github.com/processing/processing/archive/processing-0$((266+${pkgver##3.5.}))-$pkgver.tar.gz"
        'https://download.processing.org/reference.zip'
        always_use_java-8-jdk.patch
        derive_jdk_from_path.patch
        disable_update_check.patch
        no_downloads.patch)
sha256sums=('99a5d3cfccd106e79fe82cafa66b72b15c19e5747eac77e40dd0a82b032c2925'
            '1417308bf43bec2a8d178b84043a3e8a498fa164f3bf7d7668ba17cf96de1282'
            '8255ba154118884e51e3b9b7174814f7de8fcf7c380ce6f8666192adb6f2483c'
            'fcd5c5ea558ceadde3f840522a5c1cb11e26569aec651e8154194cca39026611'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            '52bdda3ce6368df469172889c53091f7284806e2a1524b012e236736de98f646')

prepare() {
  # Create .desktop file
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

  # Disable update check in default preferences
  patch $pkgname/build/shared/lib/defaults.txt < disable_update_check.patch

  # Derive JDK location from java binary found in PATH
  patch $pkgname/build/linux/processing < derive_jdk_from_path.patch

  # Always use Oracle's JDK to run processing
  patch $pkgname/build/linux/processing < always_use_java-8-jdk.patch
}

build() {
  cd "$pkgname/build"

  PATH="/usr/lib/jvm/java-8-jdk/bin/:$PATH" ant build
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

  # Ensure that processing uses the Java version selected by PATH
  rmdir "$pkgdir/usr/share/processing/java"
  mkdir -p "$pkgdir/usr/share/processing/java/bin/"
  echo -e '#!/bin/sh\n`which java` "$@"' > "$pkgdir/usr/share/processing/java/bin/java"
  chmod a+x "$pkgdir/usr/share/processing/java/bin/java"
}
