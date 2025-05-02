# Maintainer: MartorSkull <livemartor@gmail.com>
_pkgname=komodo
_pkgcat=periphery
pkgname=${_pkgname}-${_pkgcat}
pkgver=1.17.4
pkgrel=1
epoch=0
pkgdesc='Periphery server for the komodo monitor'
arch=('x86_64')
url='https://komo.do/'
license=('GPL')
depends=('docker' 'openssl' 'rust')
makedepends=('cargo' 'clang' 'perl' 'cmake' 'nasm' 'pkgconf' 'git')
source=(
    "$_pkgname::git+https://github.com/moghtech/komodo.git#tag=v$pkgver"
    'komodo-peripheryd.service'
    'komodo-peripheryd.sysusers'
    'komodo-peripheryd.tmpfiles'
    'periphery.config.toml'
)
sha256sums=('2100525f74db2027854707babefd117e09ba4d9de4bb2411037221399f328a86'
            'b03c59288a25abdb3e84a58c30bb4996ef3b046b7aa60133a7ebe3fdea81475a'
            '3ce390159db98a55ca519eb62f2d89ceb7050e9256c931f38b457f1c4a43f651'
            'f4b549451a3d22de81dd8ed933c290777581ef92f2276160e91092739c867aee'
            'ac8939c55deb01929c36377f17f49cfbde5dfa7ef2a16d827078b19a72cde027')

build() {
    cd "$srcdir/$_pkgname"
    cargo build --release --bin=${_pkgcat}
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
