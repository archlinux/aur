# Maintainer: xiretza <xiretza+aur@xiretza.xyz>
# Contributor: Yunhui Fu <yhfudev@gmail.com>

_pkgname=libmirisdr
pkgname=$_pkgname-git
epoch=1
pkgver=r5.59ba372
pkgrel=1
pkgdesc="Software for the Mirics MSi2500 + MSi001 SDR platform."
arch=('i686' 'x86_64' 'arm')
url="https://gitea.osmocom.org/sdr/$_pkgname"
license=('GPL2')
depends=(
    'libusb'
)
makedepends=(
    'git'
    'cmake'
)
#optdepends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")

source=("git+$url")
md5sums=('SKIP')

pkgver() {
    cd "$srcdir/$_pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cmake -B build -S "$_pkgname" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
}

package() {
    make -C build DESTDIR="$pkgdir" install

    install -Dm644 "$_pkgname/mirisdr.rules" "${pkgdir}/etc/udev/rules.d/99-mirisdr.rules"
}

# vim:set ts=4 et:
