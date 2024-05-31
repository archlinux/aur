# Maintainer: ap4ss3rby <ap4ss3rby (at) gmail (dot) org>
pkgname=rtl8192eu-dkms
_pkgname="${pkgname%-*}"
pkgver=5.6.4.r302.g2fddecc
_pkgver="${pkgver%.g*}"
pkgrel=1
pkgdesc="Driver for Realtek 8192eu chipset (DKMS)"
arch=(x86_64)
url="https://github.com/Mange/rtl8192eu-linux-driver"
license=('GPL')
depends=('dkms')
makedepends=('git')
provides=($_pkgname)
conflicts=($_pkgname)
install=$pkgname.install
_commit=2fddec         # (Merge pull request #337 from etzngr/fix-build-for-kernel-6.8)
source=("$_pkgname::git+${url}.git#commit=$_commit"
        $pkgname.conf)
sha256sums=('SKIP'
            'dc6a9bfc6a796461da2219accc7a6ae755ea13253737630e1538f3d98aa7aff5')

# Extract version from a string like:
#   #define DRIVERVERSION	"v5.6.4_35685.20191108_COEX20171113-0047"
pkgver() {
    cd $_pkgname
    v=$(grep 'DRIVERVERSION' include/rtw_version.h | sed 's|^.*\s"v||;s|_.*||')
    printf "$v.r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
    local _dest="$pkgdir/usr/src/$_pkgname-$pkgver"

    # Copy source files (install dkms.conf first to assure existence and to create dir)
    install -Dm644 "$_pkgname/dkms.conf" "$_dest/dkms.conf"
    cp -a $_pkgname/* "$_dest/"

    # Set name and version in dkms.conf, and remove deprecated REMAKE_INITRD
    sed -e "s/^PACKAGE_NOME=.*/PACKAGE_NOME=\"$_pkgname\"/" \
        -e "s/^PACKAGE_VERSION=.*/PACKAGE_VERSION=\"$_pkgver\"/" \
        -e '/^REMAKE_INITRD=.*/d' \
        -i "$_dest/dkms.conf"

    # Install blacklist file
    install -Dm644 $pkgname.conf "$pkgdir/usr/lib/modprobe.d/$pkgname.conf"
}
