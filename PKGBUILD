# Maintainer: javsanpar <javsanpar@riseup.net>
pkgname=abaddon-git
_pkgname=abaddon
pkgver=0.r351.6467ddd
pkgrel=1
pkgdesc='An alternative Discord client made with C++/gtkmm'
url='https://github.com/uowuo/abaddon'
source=("git+https://github.com/uowuo/abaddon")
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'cmake' 'make' 'gcc' 'nlohmann-json' 'pkgconf')
depends=('gtkmm3')
conflicts=('abaddon')
provides=('abaddon')
sha256sums=(SKIP)

prepare () {
  cd "$_pkgname"

  git submodule init
  git submodule update
}

build () {
  cmake -B build -S "$_pkgname"
  make -C build
}

package() {
  install -Dm755 build/abaddon "$pkgdir"/opt/abaddon/abaddon

  install -Dm644 "$_pkgname"/css/* -t "$pkgdir"/opt/abaddon/css
  install -Dm644 "$_pkgname"/res/* -t "$pkgdir"/opt/abaddon/res

  install -Dm666 /dev/null "$pkgdir"/opt/abaddon/abaddon.ini

  install -Dm755 /dev/null "$pkgdir"/usr/bin/abaddon
  cat - > "$pkgdir"/usr/bin/abaddon <<EOF
#!/bin/sh
cd /opt/abaddon
./abaddon $@
EOF
}

pkgver() {
  cd "$_pkgname"
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}
