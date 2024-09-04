# Maintainer: realroot <scorpion2185@protonmail.com>
# Previously made by Gerrit G. <gerrit at grosskopfgames dot de>

pkgname=unl0kr
pkgver=3.2.0
pkgdesc="On-screen Keyboard for FDE"
pkgrel=1
arch=(x86_64 aarch64)
url="https://gitlab.com/postmarketOS/buffybox"
license=('GPL-3.0-or-later')
depends=(device-mapper cryptsetup libxkbcommon libdrm libinih libinput)
makedepends=(meson scdoc git pkgconf cmake linux-headers)
_commit_lvgl=ceadda8a468b7d5fa6ba973bd82cf610166278d8
source=(https://gitlab.com/postmarketOS/buffybox/-/archive/${pkgver}/${pkgname}-${pkgver}.tar.gz
	lvgl-$_commit_lvgl.tar.gz::https://github.com/lvgl/lvgl/archive/$_commit_lvgl.tar.gz
    unl0kr-hooks
    unl0kr-install
)
backup=(etc/unl0kr.conf)

prepare() {
	cd buffybox*/unl0kr
	mv "$srcdir/lvgl-$_commit_lvgl"/* ../lvgl
}

build() {
    cd buffybox*/unl0kr
	arch-meson build
	meson compile -C build
}

package() {
	cd buffybox*/unl0kr
    DESTDIR="$pkgdir" meson install --no-rebuild -C build
    install -Dm644 ${srcdir}/unl0kr-hooks ${pkgdir}/usr/lib/initcpio/hooks/unl0kr
    install -Dm644 ${srcdir}/unl0kr-install ${pkgdir}/usr/lib/initcpio/install/unl0kr

	# Make the dark theme default
    sed -i 's/default=breezy-light/default=breezy-dark/' ${pkgdir}/etc/unl0kr.conf
    sed -i 's/alternate=breezy-dark/alternate=breezy-light/' ${pkgdir}/etc/unl0kr.conf

    # Enable all checked modules if you cannot find the right ones for your touchscreen
    #sed -i 's/#add_checked_modules/add_checked_modules/' ${pkgdir}/usr/lib/initcpio/hooks/unl0kr
}
md5sums=('068bde08ef30bda43154a8ec6c43aea5'
         'c895eaee573f41ed2d8f406ce789a31b'
         'bfb3b7489f6ad4eff1a934ee469dc101'
         '77f434f1626524b8853f6241fdf160ab')
