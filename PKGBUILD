# Maintainer: éclairevoyant
# Contributor: Michael Schwaiger <michael at internet-seite dot de>

pkgname=wl-gammactl
pkgver=r1.e238595
pkgrel=1
epoch=1
pkgdesc="Set contrast, brightness and gamma on wlroots-based compositors"
arch=(i686 x86_64)
url="https://github.com/mischw/$pkgname"
license=(MIT)
depends=(gtk3 wlroots)
makedepends=(git meson)
source=("git+$url.git#commit=e2385950d97a3baf1b6e2f064dd419ccec179586"
        "git+https://github.com/swaywm/wlr-protocols.git"
        0001-remove-git-commands-from-build.patch)
b2sums=('SKIP'
        'SKIP'
        '9c344565477ad64881035f2143b39e7c17b1cf7528c8cc8f8e7fb1494655212a776ca37b53edcb0a79c7e6bf376fcd75367a10540076f0c617e4e6aeb25c47ff')

prepare() {
	cd $pkgname
	patch -Np1 -i "$srcdir/0001-remove-git-commands-from-build.patch"

	git submodule init
	git config submodule.wlr-protocols.url "$srcdir/wlr-protocols"
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd $pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson $pkgname build
	meson compile -C build
}

package() {
	install -vDm755 build/$pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 $pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
