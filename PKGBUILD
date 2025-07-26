# Maintainer: LaFr4nc3 <lafr4nc3 at gmail dot com>
pkgname=px4_drv-dkms-git
_pkgname=px4_drv
pkgver=r534.b4a6f9a
pkgrel=1
pkgdesc="PLEX PX-W3U4/W3PE4/Q3PE4 unofficial Linux driver"
arch=('x86_64' 'aarch64')
url="https://github.com/tsukumijima/px4_drv"
license=('GPL2')
depends=('dkms')
makedepends=('git' 'unzip')
provides=("${_pkgname}" "${_pkgname}-git" "${pkgname%-git}")
conflicts=("${_pkgname}" "${_pkgname}-git" "${pkgname%-git}")
install="${_pkgname}.install"
source=("${_pkgname}"::'git+https://github.com/tsukumijima/px4_drv.git#branch=develop'
        'https://plex-net.co.jp/plex/pxw3u4/pxw3u4_BDA_ver1x64.zip')
md5sums=('SKIP'
         'd519cb8f1221123fc6d301482ba8d498')

pkgver() {
        cd "$srcdir/${_pkgname}"
        ( set -o pipefail
          git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
          printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
        )
}

prepare() {
        cd "$srcdir/${_pkgname}/fwtool"
        make
        ./fwtool "$srcdir/pxw3u4_BDA_ver1x64/PXW3U4.sys" it930x-firmware.bin

        cd "$srcdir/${_pkgname}"
        sed -e "s/^PACKAGE_VERSION\=.*\$/PACKAGE_VERSION\=\"$pkgver\"/" -i dkms.conf
}

package() {
        cd "$srcdir/${_pkgname}/fwtool"
        install -D it930x-firmware.bin "$pkgdir/usr/lib/firmware/it930x-firmware.bin"

        cd "$srcdir/${_pkgname}"
        install -dm 755 "$pkgdir/usr/src/${_pkgname}-$pkgver"
        cp -a ./{dkms,driver,etc,include,dkms.conf} "$pkgdir/usr/src/${_pkgname}-$pkgver/"
}

