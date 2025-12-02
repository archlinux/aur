# Maintainer: OfficialKris <37947442+OfficialKris@users.noreply.github.com>

pkgname=go-boot
_pkgname="go-boot-1.1"
pkgver=v1.1
pkgrel=1
pkgdesc="The bare metal Go UEFI boot manager"
arch=(x86_64)
url="https://github.com/usbarmory/go-boot"
license=(BSD-3-Clause)
groups=()
depends=()
makedepends=('git' 'make' 'go')
provides=('go-boot')
source=(
    "https://github.com/usbarmory/tamago-go/archive/refs/tags/tamago-go1.25.4.tar.gz"
    "https://github.com/usbarmory/go-boot/archive/refs/tags/v1.1.tar.gz"
)
sha256sums=(
    '4f90155cd7c450c3087620df954d779633b0d08de1caca5cdeddcd83de328044'
    'c659b09b15f365d21e4d708fd9cbeb89f12d176f8298a71118ae0d9d49af4434'
)

build() {
    cd "${srcdir}/tamago-go-tamago-go1.25.4/src"

    ./make.bash
    cd ../bin
    export TAMAGO=`pwd`/go

    cd "${srcdir}/${_pkgname}"

    make efi IMAGE_BASE=10000000 CONSOLE=text DEFAULT_EFI_ENTRY=\\EFI\\Linux\\arch-linux.efi
}

package() {
    cd "${srcdir}/${_pkgname}"

    # install x86 efi file
    install -vDm644 "go-boot.efi" "$pkgdir/usr/share/go-boot/go-boot.efi"

    # install license file
    install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
