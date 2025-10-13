# Maintainer: MartorSkull <livemartor@gmail.com>
_pkgname=komodo
_pkgcat=periphery
pkgname=${_pkgname}-${_pkgcat}
pkgver=1.19.5
pkgrel=2
epoch=0
pkgdesc='Periphery server for the komodo monitor'
arch=('x86_64')
url='https://komo.do/'
license=('GPL-1.0-or-later')
depends=('docker' 'glibc' 'gcc-libs')
makedepends=('cargo' 'git')
conflicts=('komodo-periphery-bin')
backup=('etc/komodo-periphery.toml')
source=(
    "$_pkgname::git+https://github.com/moghtech/komodo.git#tag=v$pkgver"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('f4c62e61220f2ed8618543f9973594a79be1f8a197910cde60d2c5ddeea6671a'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '08aa0be0c76bcfb0ea6e73a08db5d619eb7f3dd76fa1ff74888ed9a13eb36d4d'
            'f4b549451a3d22de81dd8ed933c290777581ef92f2276160e91092739c867aee'
            'baae0d9e1c5d1cbf6594ff538c1a2daaacd6a1da7eca0f7996102a3c0e1ef11e')

build() {
    cd "$srcdir/$_pkgname"
    CFLAGS+=" -ffat-lto-objects" cargo build --release --bin=${_pkgcat}
}

_server_root="/srv/${pkgname}"

package() {
    cd "$srcdir/"
    install -Dm755 ${_pkgname}/target/release/${_pkgcat} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ${pkgname}d.service "${pkgdir}/usr/lib/systemd/system/${pkgname}d.service"
    install -Dm644 ${pkgname}d.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}d.conf"
    install -Dm644 ${pkgname}d.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}d.conf"
    install -Dm644 ${_pkgcat}.config.toml "${pkgdir}/etc/${pkgname}.toml"

    mkdir -p "${pkgdir}${_server_root}/ssl"
    chmod g+ws "${pkgdir}${_server_root}"
}
