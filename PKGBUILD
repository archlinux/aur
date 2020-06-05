# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=evtc-watch-git
_pkgname=evtc-watch
pkgver=4405cf0
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log searching tool. Built[sic] from master branch using the rust nightly toolchain."
arch=("x86_64")
url="https://gitlab.com/networkjanitor/evtc-watch"
license=("GPL")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}")
makedepends=('cargo' 'git')
depends=("gcc-libs" 'bash' 'zip')
optdepends=('jq' 'curl')
source=(
    "${_pkgname}::git+https://gitlab.com/networkjanitor/evtc-watch.git#branch=master"
)
sha256sums=('SKIP')

pkgver() {
    cd "${_pkgname}"
    git describe --long --tags --always | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${_pkgname}"
    cargo build --release --locked
}

check() {
    cd "${_pkgname}"
    cargo test --release --locked
}

package() {
    cd "${_pkgname}"
    install -Dm 755 "target/release/evtc-watch-discord-messenger" "${pkgdir}/usr/bin/evtc-watch-discord-messenger"
    install -Dm 755 "evtc-watch" "${pkgdir}/usr/bin/evtc-watch"
    install -Dm 644 "evtc-watch.service" "${pkgdir}/usr/lib/systemd/system/evtc-watch.service"
    install -Dm 644 "config.default" "${pkgdir}/etc/evtc-watch/config"
}

