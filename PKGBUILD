# Maintainer: sfs sfslinux@gmail.com

pkgname=wl-gammactl-gettext
_pkgname=wl-gammactl
pkgver=r1.07fc9fe
pkgrel=2
epoch=1
pkgdesc="Set contrast, brightness and gamma on wlroots-based compositors"
arch=(i686 x86_64)
url="https://github.com/mischw/$_pkgname"
license=(MIT)
depends=('gtk3' )
makedepends=(git meson  wlroots)
#source=("git+$url.git#commit=e2385950d97a3baf1b6e2f064dd419ccec179586"
source=("git+$url.git"
        "git+https://github.com/swaywm/wlr-protocols.git"
        0001-remove-git-commands-from-build.patch
        i18n.patch
        wlroot.patch
        ru.po
        wl-gammactl.pot
        wl-gammactl.desktop
        )
b2sums=('SKIP'
        'SKIP'
        '9c344565477ad64881035f2143b39e7c17b1cf7528c8cc8f8e7fb1494655212a776ca37b53edcb0a79c7e6bf376fcd75367a10540076f0c617e4e6aeb25c47ff'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        'SKIP'
        )

prepare() {
	cd $_pkgname
	patch -Np1 -i "$srcdir/0001-remove-git-commands-from-build.patch"
	patch -Np1 -i "$srcdir/i18n.patch"
        patch -Np1 -i "$srcdir/wlroot.patch"

	git submodule init
	git config submodule.wlr-protocols.url "$srcdir/wlr-protocols"
	git -c protocol.file.allow=always submodule update
}

pkgver() {
	cd $_pkgname
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	arch-meson $_pkgname build
	meson compile -C build
}

package() {
	install -vDm755 build/$_pkgname -t "$pkgdir/usr/bin/"
	install -vDm644 $_pkgname/LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname/"
	install -vDm644 $srcdir/wl-gammactl.desktop -t "$pkgdir/usr/share/applications/"
	mkdir -p "$pkgdir/usr/share/locale/ru/LC_MESSAGES" &&
		msgfmt "$srcdir/ru.po" -o "$pkgdir/usr/share/locale/ru/LC_MESSAGES/wl-gammactl.mo"
}
