# Maintainer: MartorSkull <livemartor@gmail.com>
_pkggen=komodo
_pkgcat=periphery
pkgname=${_pkggen}-${_pkgcat}
pkgver=2.0.0
pkgrel=3
epoch=0
pkgdesc='Periphery server for the komodo monitor'
arch=("$CARCH")
url='https://komo.do/'
license=('GPL-3.0-only')
depends=('docker' 'openssl' 'glibc' 'libgcc')
makedepends=('cargo' 'git')
conflicts=('komodo-periphery-bin')
backup=("etc/${pkgname}.toml")
options=('!debug')
source=(
    "$_pkggen::git+https://github.com/moghtech/komodo.git#tag=v$pkgver"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('e13b4146fbdc3e4263806f3e9c31efa6100220ed5187078a7253c0677451e60f'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '08aa0be0c76bcfb0ea6e73a08db5d619eb7f3dd76fa1ff74888ed9a13eb36d4d'
            '51976440fb2005c6f05b6fff2b0498d6a37f7b968396db23fd91527af82f699a'
            'a6d0a79175dd67d193e999a391d99c1ed0785e67773f3fd24d07deead4060c31')

build() {
    cd "$srcdir/$_pkggen"
    CFLAGS+=" -ffat-lto-objects" cargo build --release --bin=${_pkgcat}
}

_server_root="/srv/${pkgname}"

package() {
    cd "$srcdir/"
    install -Dm755 ${_pkggen}/target/release/${_pkgcat} "${pkgdir}/usr/bin/${pkgname}"
    install -Dm644 ${pkgname}d.service "${pkgdir}/usr/lib/systemd/system/${pkgname}d.service"
    install -Dm644 ${pkgname}d.sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname}d.conf"
    install -Dm644 ${pkgname}d.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/${pkgname}d.conf"
    install -Dm644 ${_pkgcat}.config.toml "${pkgdir}/etc/${pkgname}.toml"
}
