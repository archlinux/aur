# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4-git
pkgver=r1.16863c8
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
provides=('processing4')
conflicts=('processing4')
depends=('libgl')
makedepends=('ant' 'jdk11-openjdk' 'gendesk' 'unzip')
options=(!strip)
source=('https://download.processing.org/reference.zip'
        change_cmd_name.patch
        disable_update_check.patch)
sha256sums=('fabe7420a714f450a6b1430f13fc46f14ba52db57af360365c6a7fd96d0b642f'
            '7f821db61160248b65df19b018dc3b2ba7cc995564dd389bb83b3ce8e5097119'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  # The size of a full clone is more than 1GB, so we just make a shallow clone
  rm -rf $pkgname
  git clone --depth 1 https://github.com/processing/processing4.git $pkgname

  # Create .desktop file
  gendesk -f -n --pkgname=processing4 --pkgdesc="$pkgdesc" --name="Processing 4"

  # Copy reference.zip to the java directory
  mkdir -p $pkgname/java
  cp reference.zip $pkgname/java/

  # Create missing directories
  mkdir -p $pkgname/build/linux/work/java

  # Disable update check in default preferences
  patch $pkgname/build/shared/lib/defaults.txt < disable_update_check.patch

  # Change command name to 'processing4'
  patch $pkgname/build/linux/processing < change_cmd_name.patch
}

build() {
  cd "$pkgname/build"

  PATH="/usr/lib/jvm/java-11-openjdk/bin/:$PATH" ant build
}

package() {
  cd "$pkgname"

  install -d "$pkgdir/usr/"{bin/,share/processing4/}
  cp -r build/linux/work/* "$pkgdir/usr/share/processing4/"

  # Desktop shortcut
  install -Dm644 "build/shared/lib/icons/pde-256.png" \
    "$pkgdir/usr/share/pixmaps/processing4.png"
  install -Dm644 "$srcdir/processing4.desktop" \
    "$pkgdir/usr/share/applications/processing4.desktop"

  # Symbolic links in /usr/bin
  ln -s "/usr/share/processing4/processing" "$pkgdir/usr/bin/processing4"
  ln -s "/usr/share/processing4/processing-java" "$pkgdir/usr/bin/processing4-java"
}
