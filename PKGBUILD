# Maintainer: core_contingency <ccontingency(at)gmail(dot)com>
# Contributor: ScarecrowDM <diego(dot)busnelli@hotmail(dot)com>
# Contributor: Alex Xu (Hello71) <alex_y_xu@yahoo.ca>
# Contributor: pyamsoft <pyam(dot)soft(at)gmail(dot)com>

_pkgname=libstrangle
_latest_release=0.1.1

pkgname=${_pkgname}-git
pkgdesc="Simple FPS Limiter"
pkgver=0.1.1.r139.038b434
pkgrel=2
url='https://gitlab.com/torkel104/libstrangle'
arch=('x86_64' 'x86_64_v3' 'x86_64_v4')
depends=('lib32-gcc-libs' 'lib32-glibc' 'libglvnd' 'linux-api-headers' 'libx11' 'xorgproto')
makedepends=('git')
provides=('libstrangle')
conflicts=('libstrangle')
license=('GPL3')
# See https://gitlab.com/torkel104/libstrangle/-/merge_requests/29
#     https://gitlab.com/torkel104/libstrangle/-/merge_requests/27
source=("git+https://gitlab.com/Infernio/libstrangle") 
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    printf "%s.r%s.%s" \
		"$_latest_release" \
		"$(git rev-list --count HEAD)" \
		"$(git rev-parse --short HEAD)"
}

prepare() {
    
    echo "Note: "
    echo "  * the '-git' version of the libstrangle package now fetches its sources from a fork of the original repo"
    echo "    (https://gitlab.com/Infernio/libstrangle)"
    echo "  * This is because the original upstream repo https://gitlab.com/torkel104/libstrangle is currently broken"
    echo "    and has not been maintained in the past year"
    echo "  * This is (hopefully) temporary and will be reverted once the original repo merges in the necessary fixes"
    sleep 3s
    
    cd $_pkgname
    sed -i -e '/ldconfig/d' makefile
}

build() {
    cd $_pkgname
    make prefix=/usr
}

package() {
    cd $_pkgname
    make prefix=/usr DESTDIR="$pkgdir" install-common install-32 install-64 install-ld

    # Install the README.md locally
    install -d "$pkgdir/usr/share/doc/$_pkgname"
    install -m644 -t "$pkgdir/usr/share/doc/$_pkgname" README.*
}

#
# makepkg --printsrcinfo > .SRCINFO
#
