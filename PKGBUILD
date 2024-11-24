# Maintainer: Talon Wettstein <diablodev@googlegroups.com>

pkgname=lampray-git
pkgver=git
pkgrel=1
pkgdesc='Linux Application Modding Platform. A native Linux mod manager.'
arch=('x86_64')
url='https://github.com/CHollingworth/Lampray'
license=('Unlicense')
depends=('curl' 'p7zip' 'sdl2' 'zenity')
makedepends=('cmake' 'ninja')
provides=('lampray')
conflicts=('lampray')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    # Makes a .desktop file
    touch "$srcdir/$pkgname.desktop"
    echo "[Desktop Entry]" > "$srcdir/$pkgname.desktop"
    echo "Name=Lampray" >> "$srcdir/$pkgname.desktop"
    echo "Comment=Linux Application Modding Platform. A native Linux mod manager." >> "$srcdir/$pkgname.desktop"
    echo "Exec=lampray" >> "$srcdir/$pkgname.desktop"
    echo "Icon=station" >> "$srcdir/$pkgname.desktop"
    echo "Terminal=false" >> "$srcdir/$pkgname.desktop"
    echo "Type=Application" >> "$srcdir/$pkgname.desktop"
    echo "Categories=Game;Itilities;" >> "$srcdir/$pkgname.desktop"
    # Sets up the build env
    cd "$srcdir/$pkgname"
    bash "$srcdir/$pkgname/setup.sh"
}

build() {
  cd "$srcdir/$pkgname"
  cmake -DCMAKE_BUILD_TYPE=Rel -DCMAKE_MAKE_PROGRAM=ninja -G Ninja -S "$srcdir/$pkgname/" -B "$srcdir/$pkgname/Build"
  cd "$srcdir/$pkgname/Build"
  ninja
}

package() {
  install -Dm 644 "$srcdir/$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm 755 "$srcdir/$pkgname/Build/Lampray" "$pkgdir/usr/bin/lampray"

  install -Dm 644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"
}