# Maintainer: Nathan Ollerenshaw <chrome@stupendous.net>

pkgname=smoothpaper
pkgdesc="A wallpaper changer daemon for X11 Window Mangers with smooth transitions between wallpapers."
pkgver=1.1.0
pkgrel=1
url=https://github.com/matjam/smoothpaper
arch=(x86_64)
depends=('libx11' 'libxrandr' 'libxinerama' 'libxcursor' 'libxext')
makedepends=('cmake' 'make' 'base-devel' 'ninja' 'gcc' 'git' 'zip' 'unzip')

source=(https://github.com/matjam/smoothpaper/archive/refs/tags/v${pkgver}.tar.gz)
sha256sums=('fb7bdc5a9d09ff8df3545a924d79cb8afff16eb1ec272eda7afd31e2674bc477')

build() {
export VCPKG_DISABLE_METRICS=1
cd $pkgname-$pkgver

if [ ! -d "vcpkg" ]; then
  git clone https://github.com/microsoft/vcpkg
fi

./vcpkg/bootstrap-vcpkg.sh
mkdir -p build
cd build
cmake .. -DCMAKE_TOOLCHAIN_FILE=vcpkg/scripts/buildsystems/vcpkg.cmake -DCMAKE_MAKE_PROGRAM=make --preset=Release
mkdir -p Release
cd Release
make
}

package() {
mkdir -p $pkgdir/usr/bin
cp $pkgname-$pkgver/build/Release/smoothpaper $pkgdir/usr/bin
mkdir -p $pkgdir/etc/xdg/smoothpaper
cp $pkgname-$pkgver/smoothpaper.toml $pkgdir/etc/xdg/smoothpaper
}
