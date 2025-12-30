# Maintainer: Ash <xash at riseup d0t net>
_pkgname=zxtune
pkgname=zxtune123-git
pkgver=r6167.3e08ae32b
pkgrel=1
pkgdesc="Chiptune player, CLI version"
arch=('i686' 'x86_64')
url="https://github.com/vitamin-caig/zxtune"
license=('LGPL-3.0')
depends=('boost-libs' 'zlib')
makedepends=('git' 'boost' 'make' 'patch')
provides=("zxtune123")
conflicts=("zxtune123")
source=("git+https://github.com/vitamin-caig/zxtune.git"
        "c23-stdbool-compat.patch"
        "xmp-mixer-funcptr-fix.patch")
sha256sums=('SKIP'
            'd76e098f01a2afac1077fe9cdfb1bc57c76a32aa40964851795e7062aa820eaf'
            'ad33e916887004e54e2a50ee7d484c4b759221f231b93c561cf02704200734bc')

pkgver() {
    cd "${srcdir}/${_pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${_pkgname}"

    # fixes the custom 3rd-party stdbool.h for C23+, where "bool" is a keyword
    patch -Np1 -i "${srcdir}/c23-stdbool-compat.patch"

    # fixes non-prototype function pointers (void (*)()) to match mixer prototypes
    patch -Np1 -i "${srcdir}/xmp-mixer-funcptr-fix.patch"
}

build() {
    cd "${srcdir}/${_pkgname}"
    make system.zlib=1 platform=linux release=1 -C apps/zxtune123
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}" platform=linux release=1 -C apps/zxtune123 install_linux

    install -Dm644 LICENSE.md "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
