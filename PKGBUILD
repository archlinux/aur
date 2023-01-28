# Maintainer: yuioto <yuiotochan@outlook.com>

pkgname=wiliwili-git
_pkg=wiliwili
pkgver=v0.6.0.r10.g07548e2
pkgrel=1
pkgdesc='A 3rd party bilibili client'
url="https://github.com/xfangfang/wiliwili"
license=('GPL3')
arch=('x86_64')
provides=("$_pkg")
conflicts=("$_pkg" "$_pkg-bin")
depends=('mpv')
makedepends=('git' 'cmake' 'gcc')

# options("name")

source=("${_pkg}::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkg"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

prepare() {
	cd "$_pkg"
	git submodule update --init --recursive
}

build() {

	# If you want to use Debug mode, deleate -DCMAKE_BUILD_TYPE=Release
	# It look like this:
	# cmake -B build -S "$_pkg" DCMAKE_INSTALL_PREFIX=/usr/ -DPLATFORM_DESKTOP=ON -DINSTALL=ON

	cmake -B build -S "$_pkg" DCMAKE_INSTALL_PREFIX=/usr/ -DPLATFORM_DESKTOP=ON -DINSTALL=ON -DCMAKE_BUILD_TYPE=Release
	pwd
	make -C build wiliwili -j$(nproc)
}

#check() {
#}

package() {
	install -Dm755 build/"$_pkg" -t "$pkgdir/usr/bin/"
	install -Dm755 "$_pkg/scripts/linux/cn.xfangfang.wiliwili.desktop" -t "$pkgdir/usr/share/applications/"
	install -Dm644 "build/resources/icon/cn.xfangfang.wiliwili.png" -t "$pkgdir/usr/share/icons/hicolor/scalable/apps/"
	cp -dr --no-preserve=ownership "build/resources/" "$pkgdir/usr/share/$_pkg/"
}
