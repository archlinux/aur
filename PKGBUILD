# Maintainer: Wu Zhenyu <wuzy01@qq.com>
# https://aur.archlinux.org/packages/updaurpkg-git
# $ updaurpkg .
_repo=lyokha/g3kb-switch
_source_type=github-releases
_upstreamver='1.2'
_pkgname=$(tr A-Z a-z <<< ${_repo##*/})

pkgname=$_pkgname
pkgver=${_upstreamver##v}
pkgrel=1
pkgdesc="CLI keyboard layout switcher for Gnome Shell"
arch=(x86 x86_64 arm aarch64)
url=https://github.com/$_repo
depends=(glib2)
makedepends=(cmake bash-completion)
license=(bsd)
provides=("$_pkgname")
conflicts=("$_pkgname")
source=("$_pkgname-$pkgver::$url/archive/$_upstreamver.tar.gz")
sha256sums=('b6f6a0a10d27dfcbaff0fd1ae3909ffebdca3ac2e2c5f1a0e4a769637ed57beb')

build() {
	cd "$srcdir/$_pkgname-$pkgver"
	cmake -DCMAKE_BUILD_TYPE=Release -DG3KBSWITCH_WITH_GNOME_SHELL_EXTENSION=ON -DCMAKE_INSTALL_PREFIX=/usr -Bbuild
	cmake --build build
}

package() {
	cd "$srcdir/$_pkgname-$pkgver"
	DESTDIR="$pkgdir" cmake --install build
	install -Dm644 extension/*/ -t "$pkgdir/usr/share/gnome-shell/extensions"
}
