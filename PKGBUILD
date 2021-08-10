# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4
pkgver=4.0b1
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
depends=('libgl')
makedepends=('ant' 'jdk11-openjdk' 'gendesk' 'unzip')
options=(!strip)
source=("https://github.com/processing/processing4/archive/processing-$((1275+${pkgver##4.0b}))-$pkgver.tar.gz"
        'https://download.processing.org/reference.zip'
        change_cmd_name.patch
        disable_update_check.patch)
sha256sums=('b1e2fcefd7ab419ad888017c8dc8fd062fcf9c614ccdc69f3ae5e6f79fc58989'
            'fabe7420a714f450a6b1430f13fc46f14ba52db57af360365c6a7fd96d0b642f'
            '7f821db61160248b65df19b018dc3b2ba7cc995564dd389bb83b3ce8e5097119'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30')

prepare() {
  # Create .desktop file
  gendesk -f -n --pkgname=processing4 --pkgdesc="$pkgdesc" --name="Processing 4"

  # Symbolic link for not having to repeat the revision number
  ln -sf "processing4-processing-"*"-$pkgver" $pkgname

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

  ant build
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
