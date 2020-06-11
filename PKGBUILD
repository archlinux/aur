# Maintainer: networkjanitor <networkjanitor@xyooz.net>
pkgname=evtc-watch-git
_pkgname=evtc-watch
pkgver=r9.816c97b
pkgrel=1
pkgdesc="Guild Wars 2/arcdps evtc log zipper and dps.report uploader with discord bot notification. Build from master branch using the rust toolchain."
arch=("x86_64")
url="https://gitlab.com/networkjanitor/evtc-watch"
license=("GPL")
provides=("${_pkgname}")
conflicts=("${_pkgname}-bin" "${_pkgname}")
makedepends=('cargo' 'git')
depends=("gcc-libs" 'bash' 'zip' 'inotify-tools')
optdepends=('jq' 'curl')
source=(
    "${_pkgname}::git+https://gitlab.com/networkjanitor/evtc-watch.git#branch=master"
)
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
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
    install -Dm 644 "evtc-watch.service" "${pkgdir}/usr/lib/systemd/user/evtc-watch.service"
}

