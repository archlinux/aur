# Maintainer: javsanpar <javsanpar@riseup.net>
pkgname=abaddon
pkgver=0.1.2
pkgrel=1
pkgdesc='An alternative Discord client made with C++/gtkmm'
url='https://github.com/uowuo/abaddon'
source=("git+https://github.com/uowuo/abaddon#tag=v$pkgver")
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'cmake' 'nlohmann-json')
depends=('gtkmm3')
conflicts=('abaddon')
provides=('abaddon')
sha256sums=('SKIP')

prepare () {
  cd "$pkgname"

  git submodule init
  git submodule update
}

build () {
  cmake -B build -S "$pkgname"
  make -C build
}

package() {
  install -Dm755 build/abaddon "$pkgdir"/opt/abaddon/abaddon

  install -Dm644 "$pkgname"/res/css/* -t "$pkgdir"/opt/abaddon/css
  install -Dm644 "$pkgname"/res/res/* -t "$pkgdir"/opt/abaddon/res
  install -d "$pkgdir"/opt/abaddon/fonts
  cp -r "$pkgname"/res/fonts/* "$pkgdir"/opt/abaddon/fonts/

  install -Dm666 /dev/null "$pkgdir"/opt/abaddon/abaddon.ini

  install -Dm755 /dev/null "$pkgdir"/usr/bin/abaddon
  cat - > "$pkgdir"/usr/bin/abaddon <<EOF
#!/bin/sh
cd /opt/abaddon
./abaddon $@
EOF
}
