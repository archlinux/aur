# Maintainer: Alexandre Bouvier <contact@amb.tf>
# shellcheck shell=bash disable=SC2034,SC2164
_pkgname=retroarch-joypad-autoconfig
pkgname=$_pkgname-git
pkgver=r1724.fce9c6d
pkgrel=1
pkgdesc="RetroArch joypad autoconfig files"
arch=('any')
url="https://github.com/libretro/retroarch-joypad-autoconfig"
license=('MIT')
groups=('libretro')
makedepends=('git')
optdepends=('retroarch')
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname::git+$url.git")
md5sums=('SKIP')

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd $_pkgname
	mv COPYING README.md retropad_layout.png verify_duplicate_profiles.rb ..
	rm -rf dinput qnx xinput
}

package() {
	cd $_pkgname
	# shellcheck disable=SC2154
	make DESTDIR="$pkgdir" install && find "$pkgdir"/usr/share/libretro/autoconfig -type f -exec chmod 644 {} +
	install -Dm644 -t "$pkgdir"/usr/share/doc/$_pkgname ../{README.md,retropad_layout.png}
	install -Dm644 -t "$pkgdir"/usr/share/licenses/$_pkgname ../COPYING
}
