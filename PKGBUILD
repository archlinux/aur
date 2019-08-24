# Maintainer: Alex Gentilucci <alexander.gentilucci@gmail.com>
pkgname=ft2-clone
pkgver=b166
pkgrel=1
pkgdesc="A portable Fasttracker II clone written in C"
arch=('x86_64')
url="https://16-bits.org/ft2.php"
license=("BSD")
makedepends=("gcc" "libicns" "unzip")
depends=("alsa-lib" "sdl2")
source=("https://16-bits.org/ft2.php" "ft2-clone.desktop")
md5sums=("SKIP" "SKIP")

pkgver() {
  grep -oP "(?<=ft2clone-)([a-z]+[0-9]+)(?=-code\.zip)" ft2.php | head -n 1
}

prepare() {
  name=$(grep -oE "ft2clone-[a-z]+[0-9]+-code\.zip" ft2.php | head -n 1)
  curl -O "https://16-bits.org/$name"
  unzip $name
}

build() {
  cd "$pkgname-code"
  icns2png -x "release/macos/ft2-osx.app/Contents/Resources/ft2-osx.icns"
  chmod +x "make-linux.sh"
  ./make-linux.sh
}

package() {
  install -D -m 755 "$pkgname-code/release/other/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "$pkgname-code/src/LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "ft2-clone.desktop" "$pkgdir/usr/share/applications/ft2-clone.desktop"
  install -Dm644 "$pkgname-code/ft2-osx_256x256x32.png" "$pkgdir/usr/share/pixmaps/ft2-clone.png"
}
