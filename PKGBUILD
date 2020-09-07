# Maintainer: Gustavo Castro < gustawho [ at ] gmail [ dot ] com > 

pkgname=library-git
pkgver=r23.d18e375
pkgrel=2
pkgdesc="Document viewer and  collection manager"
arch=('x86_64')
groups=('maui-apps')
url="https://invent.kde.org/maui/shelf"
license=('GPL3')
depends=('kio' 'mauikit-git' 'ki18n' 'poppler-qt5')
makedepends=('git' 'extra-cmake-modules')
provides=('library' 'shelf')
conflicts=('library' 'shelf')
source=("git+$url.git" 'org.kde.library.desktop')
sha256sums=('SKIP'
            '83fcaeba8bdffd1e616e2fd105da872b4d32a6f6f48d698156116b566faeab46')

pkgver() {
  cd shelf
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
  cd shelf
  mkdir build

  sed -i '/ StoreList /s/^/\/\//' src/main.qml
}

build() {
  cd shelf/build
  qmake .. 
  make
}
 
package() {
  cd shelf/build
  install -d "$pkgdir/usr/share/icons/hicolor/scalable/apps"
  install -d "$pkgdir/usr/share/applications"
  install -d "$pkgdir/usr/bin"
  install -Dm644 ../src/assets/library.svg "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
  install -Dm644 "$srcdir/org.kde.library.desktop" "$pkgdir/usr/share/applications/"
  install -Dm755 library "$pkgdir/usr/bin/"
}
