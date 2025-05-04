# Maintainer: realroot <user3mila@disroot.org>
# Previously made by Gerrit G. <gerrit at grosskopfgames dot de>

pkgname=unl0kr
pkgver=3.3.0
pkgdesc="On-screen Keyboard for FDE"
pkgrel=1
arch=(x86_64 aarch64)
url="https://gitlab.postmarketos.org/postmarketOS/buffybox"
license=('GPL-3.0-or-later')
depends=(device-mapper cryptsetup libxkbcommon libdrm libinih libinput)
makedepends=(meson scdoc git pkgconf cmake linux-headers)
_commit_lvgl=7f07a129e8d77f4984fff8e623fd5be18ff42e74
source=(https://gitlab.postmarketos.org/postmarketOS/buffybox/-/archive/"$pkgver"/buffybox-"$pkgver".tar.gz
	lvgl-$_commit_lvgl.tar.gz::https://github.com/lvgl/lvgl/archive/$_commit_lvgl.tar.gz
    unl0kr-hooks
    unl0kr-install
)
backup=(etc/unl0kr.conf)
builddir="buffybox-$pkgver"

prepare() {
	cd "$builddir"
	mkdir -p lvgl
	rm -rf lvgl/*
	mv -f "../lvgl-$_commit_lvgl"/* "lvgl"
	# Remove these to enable systemd files
	sed -i '38,59 d' unl0kr/meson.build
	sed -i '27,43 d' buffyboard/meson.build
}

build() {
    cd "$builddir"
	arch-meson build
	meson compile -C build
}

package() {
	cd "$builddir"
    DESTDIR="$pkgdir" meson install --no-rebuild -C build
    find "$pkgdir" -name "*buffyboard*" -exec rm "{}" \;
    install -Dm644 ${srcdir}/unl0kr-hooks ${pkgdir}/usr/lib/initcpio/hooks/unl0kr
    install -Dm644 ${srcdir}/unl0kr-install ${pkgdir}/usr/lib/initcpio/install/unl0kr

	# Make the dark theme default
    sed -i 's/default=breezy-light/default=breezy-dark/' ${pkgdir}/etc/unl0kr.conf
    sed -i 's/alternate=breezy-dark/alternate=breezy-light/' ${pkgdir}/etc/unl0kr.conf

    # Enable all checked modules if you cannot find the right ones for your touchscreen
    #sed -i 's/#\(add_checked_modules\)/\1/g' ${pkgdir}/usr/lib/initcpio/install/unl0kr
}
md5sums=('e95c44b3d0912edee8427d2380620b1a'
         '01a20b014ee7a6d20978ea034d023e0c'
         'bfb3b7489f6ad4eff1a934ee469dc101'
         '77f434f1626524b8853f6241fdf160ab')
