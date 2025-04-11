# Maintainer: Kemel Zaidan <kemelzaidan at gmail dot com>
pkgname=rp-bookshelf
pkgver=r137.53102fb
pkgrel=1
pkgdesc="Browser for Raspberry Pi Press publications in PDF format"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/raspberrypi-ui/bookshelf"
license=('BSD-3-Clause')
depends=('glib2' 'gtk3>=3.24' 'libx11' 'curl' 'gdk-pixbuf2' 
		'hicolor-icon-theme' 'glibc')
makedepends=('git' 'sed' 'coreutils' 'meson')
provides=("rp-bookshelf")
conflicts=("rp-bookshelf-git")
source=('git+https://github.com/raspberrypi-ui/bookshelf.git#commit=53102fb6f4b0324cc89635f0ef58966c6b847a74')
sha256sums=('SKIP')

pkgver() {
    cd "bookshelf"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    case "$CARCH" in 
        "arm6h") #ARM 32 bits
            lib_path="/usr/lib/arm-linux-gnueabihf"
            ;;
        "armv7h") #ARM 32 bits
            lib_path="/usr/lib/arm-linux-gnueabihf"
            ;;
        "aarch64") #ARM 64 bits
            lib_path="/usr/lib/aarch-gnu-linux"
            ;;
        *) # Intel 32 or 64 bits
            lib_path="/usr/lib/"
            ;;
    esac

	cd "bookshelf"
    # meson setup builddir --prefix=/usr --libdir=${lib_path}
	arch-meson builddir \
        -Dc_args='-fPIE -fcf-protection=full -D_FORTIFY_SOURCE=3' \
        -Dc_link_args='-pie -Wl,-z,relro,-z,now -fcf-protection=full'
}

build() {
	cd "bookshelf"
    meson compile -C builddir
}

package() {
	cd "bookshelf"
	meson install -C builddir --destdir "$pkgdir/"
	mkdir -p "${pkgdir}/usr/share/licenses/${pkgname}/"
	touch "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	sed -n '2,25p' src/rp_bookshelf.c > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

