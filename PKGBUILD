# Maintainer: René Wagner <rwa at clttr dot info>
# Contributor: Juan Simón <play4pro at protonmail dot com>
# Contributor: alium
# Contributor: angelsl
# Contributer: hayao <hayao@fascode.net>

_pkgbase=r8168
pkgname=${_pkgbase}-dkms
pkgver=8.050.02
pkgrel=2
pkgdesc="A kernel module for Realtek 8168 network cards (DKMS version)"
url="https://github.com/mtorromeo/r8168"
license=("GPL")
arch=('i686' 'x86_64')
depends=('glibc' 'dkms')
makedepends=('git')
conflicts=("${pkgname}")
source=("r8168-dkms::git+https://github.com/mtorromeo/r8168.git"
        "dkms.conf"
        "linux518.patch::https://raw.githubusercontent.com/archlinux/svntogit-community/packages/r8168/trunk/linux518.patch")
sha256sums=('SKIP'
            'e33abcbc8fbe3129459ebc60be3b2f8ed55ddc53755f4956d6feb16c61c43250'
            'd8d542770e504775600f686d03412a37cc32489872be7aeb388b5b08d9806096')
install=r8168-dkms.install

prepare() {
     cd "$pkgname"
     patch -Np1 -i ../linux518.patch
}

package() {
    install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    sed -e "s/@PKGNAME@/${_pkgbase}/g" \
        -e "s/@PKGVER@/${pkgver}/g" \
        -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

    cd "${pkgname}"
    cp -dr --no-preserve='ownership' src "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/src"
}
