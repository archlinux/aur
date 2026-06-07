# Maintainer: allddd <me (at) allddd (dot) onl>

pkgname=mkinitcpio-extras
pkgver=4
pkgrel=1
pkgdesc='Collection of mkinitcpio hooks for busybox based initramfs'
arch=(
    'aarch64'
    'armv7h'
    'i686'
    'riscv64'
    'x86_64'
)
url='https://gitlab.com/allddd/mkinitcpio-extras'
license=('GPL-2.0-only')
depends=('mkinitcpio')
makedepends=('linux-api-headers')
optdepends=(
    'dropbear: required for dropbear'
    'tinyssh: required for tinyssh'
)
provides=(
    'mkinitcpio-dropbear'
    'mkinitcpio-netconf'
    'mkinitcpio-nfs-utils'
    'mkinitcpio-tinyssh'
)
conflicts=(
    'mkinitcpio-dropbear'
    'mkinitcpio-netconf'
    'mkinitcpio-nfs-utils'
    'mkinitcpio-tinyssh'
)
options=('!debug')
source=("${url}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz")
sha256sums=('18eabdd47162bcb7f5df9660e80afa76efa00e88813793c646f42c7410ba6cf2')

prepare() {
    cd "${srcdir}/${pkgname}-v${pkgver}/lib/klibc"
    mkdir -p ./linux/include/
    ln -s /usr/include/{asm,asm-generic,linux} ./linux/include/
}

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}/lib/klibc"
    make
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    for _name in ipconfig nfsmount; do
        install -Dm755 "./lib/klibc/usr/kinit/${_name}/static/${_name}" -t "${pkgdir}/usr/lib/initcpio/"
    done
    for _name in */; do
        _name=${_name%/}
        _hook="./${_name}/${_name}_hook"
        _install="./${_name}/${_name}_install"
        [[ -f "${_hook}" && -f "${_install}" ]] || continue
        install -Dm644 "${_hook}" "${pkgdir}/usr/lib/initcpio/hooks/${_name}"
        install -Dm644 "${_install}" "${pkgdir}/usr/lib/initcpio/install/${_name}"
    done
}

# vim: ts=4 sw=4 et:
