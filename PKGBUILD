# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4-git
pkgver=r1.3cd8898
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
conflicts=(processing processing-bin processing-jdk8)
depends=('jdk11-openjdk' 'java11-openjfx' 'jogl' 'libgl')
makedepends=('ant' 'gendesk' 'unzip')
options=(!strip)
source=('https://download.processing.org/reference.zip'
        always_use_java-11-openjdk.patch
        derive_jdk_from_path.patch
        disable_update_check.patch
        no_downloads.patch
        use_system_libraries.patch)
sha256sums=('2014fdb12f979f79c624acc514c14ce318f07cb2cc15a63e1b4febaff733f2a5'
            '66e87536b740194954670c482d698fc3183995bf48f580078511d50d1a3f0323'
            'fcd5c5ea558ceadde3f840522a5c1cb11e26569aec651e8154194cca39026611'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30'
            'a07184b87d3d2ccd35525a0721df787973f92487bae367a0668abd3f64134263'
            'db6d31c42c13f41b2fde531018927d994c4ae13a04848c4afb0762620b0f0903')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # The size of a full clone is more than 1GB, so we just make a shallow clone
  git clone --depth 1 https://github.com/processing/processing4.git $pkgname

  # Create .desktop file
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc"

  # Copy reference.zip to the java directory
  mkdir -p $pkgname/java
  cp reference.zip $pkgname/java/

  # Create missing directories
  mkdir -p $pkgname/build/linux/work/java

  # Don't download any files during Ant's build process
  patch $pkgname/build/build.xml < no_downloads.patch
  patch $pkgname/core/build.xml < use_system_libraries.patch

  # Disable update check in default preferences
  patch $pkgname/build/shared/lib/defaults.txt < disable_update_check.patch

  # Derive JDK location from java binary found in PATH
  patch $pkgname/build/linux/processing < derive_jdk_from_path.patch

  # Always use OpenJDK 11 to run processing
  patch $pkgname/build/linux/processing < always_use_java-11-openjdk.patch
}

build() {
  cd "$pkgname/build"

  PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" ant build
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
