# Maintainer: SlyFabi <admin@slyfabi.de>
_basename=wsysmon
pkgname=wsysmon-git
pkgdesc="A windows task manager clone for Linux."
pkgver=r9.c2b3622
pkgrel=1
url='https://github.com/SlyFabi/WSysMon'
arch=(x86_64 aarch64)
license=(MIT)
depends=(gtkmm3 libx11)
makedepends=(git cmake)
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
source=($_basename::git+$url
WSysMon.desktop)
sha256sums=('SKIP'
'9afa07c20a4d46fdc672130687350af54cdeb051033eef1487382ce1bd04f18e')

pkgver() {
  cd "$_basename"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
    cmake -B build -S "$_basename" \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build --config Release
}

package() {
    install -Dm755 "$srcdir/build/WSysMon" "$pkgdir/usr/bin/WSysMon"
    install -Dm644 "$srcdir/$_basename/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "WSysMon.desktop" "$pkgdir/usr/share/applications/WSysMon.desktop"
}
