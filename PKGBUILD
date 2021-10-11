# Maintainer: Torben <git at letorbi dot com>

pkgname=processing4-git
pkgver=4.0b2.r23.g272801f95
pkgrel=1
arch=(x86_64)
pkgdesc='Programming environment for creating images, animations and interactions'
url='https://github.com/processing/processing4'
license=(GPL LGPL)
provides=('processing' 'processing4')
depends=('libgl')
makedepends=('java-environment=17' 'ant' 'gendesk' 'unzip')
options=(!strip)
source=('https://download.processing.org/reference.zip'
        disable_update_check.patch)
sha256sums=('fabe7420a714f450a6b1430f13fc46f14ba52db57af360365c6a7fd96d0b642f'
            '35c4538e6e57c0ea296c6cea590cabeb2b0772f9a431838df270dcc581321e30')

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
  gendesk -f -n --pkgname=processing --pkgdesc="$pkgdesc" --name="Processing"

  # Copy reference.zip to the java directory
  mkdir -p $pkgname/java
  cp reference.zip $pkgname/java/

  # Disable update check in default preferences
  patch $pkgname/build/shared/lib/defaults.txt < disable_update_check.patch
}

build() {
  cd "$pkgname/build"

  PATH="/usr/lib/jvm/java-17-openjdk/bin/:$PATH" ant build
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
}
