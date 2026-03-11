# Maintainer: Avi Tretiak <avi@babi.uy>
# Based on the komodo-periphery AUR package by MartorSkull
_pkgname=komodo
_pkgcat=periphery
pkgname=${_pkgname}-${_pkgcat}-git
pkgver=2.0.0.dev.123.r8.gca021a3
pkgrel=1
pkgdesc='Periphery server for the komodo monitor (2.0.0 dev branch)'
arch=('x86_64')
url='https://komo.do/'
license=('GPL-3.0-or-later')
depends=('docker' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git')
provides=("${_pkgname}-${_pkgcat}=${pkgver}")
conflicts=('komodo-periphery' 'komodo-periphery-bin')
backup=('etc/komodo-periphery.toml')
source=(
    "$_pkgname::git+https://github.com/moghtech/komodo.git#branch=2.0.0"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('SKIP'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '08aa0be0c76bcfb0ea6e73a08db5d619eb7f3dd76fa1ff74888ed9a13eb36d4d'
            'f4b549451a3d22de81dd8ed933c290777581ef92f2276160e91092739c867aee'
            'baae0d9e1c5d1cbf6594ff538c1a2daaacd6a1da7eca0f7996102a3c0e1ef11e')

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags --abbrev=7 --match 'v2*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$srcdir/$_pkgname"
    CFLAGS+=" -ffat-lto-objects"
    RUSTFLAGS+=" --remap-path-prefix=$srcdir=/build" \
    cargo build --release --bin=${_pkgcat}
}

_server_root="/srv/${_pkgname}-${_pkgcat}"

package() {
    cd "$srcdir/"
    install -Dm755 ${_pkgname}/target/release/${_pkgcat} "${pkgdir}/usr/bin/${_pkgname}-${_pkgcat}"
    install -Dm644 ${_pkgname}-${_pkgcat}d.service "${pkgdir}/usr/lib/systemd/system/${_pkgname}-${_pkgcat}d.service"
    install -Dm644 ${_pkgname}-${_pkgcat}d.sysusers "${pkgdir}/usr/lib/sysusers.d/${_pkgname}-${_pkgcat}d.conf"
    install -Dm644 ${_pkgname}-${_pkgcat}d.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${_pkgname}-${_pkgcat}d.conf"
    install -Dm644 ${_pkgcat}.config.toml "${pkgdir}/etc/${_pkgname}-${_pkgcat}.toml"

    install -dm755 "${pkgdir}${_server_root}/ssl"
    chmod g+ws "${pkgdir}${_server_root}"
}
