# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=dxlaprs-lora-git
_pkgname=dxlAPRS
pkgver=1.0.20260906
pkgrel=2
pkgdesc="LoRa receiver (lorarx) from the dxlAPRS toolchain, used by OpenWebRX for LoRa decoding"
arch=('x86_64' 'aarch64')
url="https://github.com/oe5hpm/dxlAPRS"
license=('GPL-2.0-or-later')
depends=('glibc')
provides=('dxlaprs-lora')
conflicts=('dxlaprs-lora')
makedepends=('git' 'make' 'gcc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/${_pkgname}"
    printf "1.0.%s" "$(git log -1 --format=%cd --date=format:%Y%m%d)"
}

build() {
    cd "$srcdir/${_pkgname}/src"
    # only build lorarx: "make all" would pull in aprsmap/waterfall
    # which need libpng/jpeg/X11 and the bundled prebuilt libs
    make lorarx
}

package() {
    cd "$srcdir/${_pkgname}"
    # Makefile writes to ../out-<arch>/, not src/
    install -Dm755 "out-${CARCH}/lorarx" "${pkgdir}/usr/bin/lorarx"
}
