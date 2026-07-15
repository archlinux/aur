# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=yggdrasil-ng-bin
pkgver=0.3.0
pkgrel=1
_debrel=1
pkgdesc="End-to-end encrypted IPv6 mesh networking daemon, a from-scratch Rust rewrite of Yggdrasil (prebuilt static binary)"
arch=('x86_64' 'aarch64' 'armv7h')
url="https://github.com/Revertron/Yggdrasil-ng"
license=('MPL-2.0')
provides=('yggdrasil-ng')
conflicts=('yggdrasil-ng' 'yggdrasil')
options=('!debug')

_relurl="${url}/releases/download/v${pkgver}"
source_x86_64=("${pkgname}-${pkgver}-x86_64.deb::${_relurl}/yggdrasil-ng_${pkgver}-${_debrel}_amd64.deb")
source_aarch64=("${pkgname}-${pkgver}-aarch64.deb::${_relurl}/yggdrasil-ng_${pkgver}-${_debrel}_arm64.deb")
source_armv7h=("${pkgname}-${pkgver}-armv7h.deb::${_relurl}/yggdrasil-ng_${pkgver}-${_debrel}_armhf.deb")
noextract=("${pkgname}-${pkgver}-x86_64.deb"
           "${pkgname}-${pkgver}-aarch64.deb"
           "${pkgname}-${pkgver}-armv7h.deb")
sha256sums_x86_64=('7d7fe0a8fcca3d7f62a5401a853c1f812f7e94bce949f430ca650f4b68023a13')
sha256sums_aarch64=('de3a73a131671dc4568378ee070f28b011b4e8db848c46361a39c9997d7d5708')
sha256sums_armv7h=('e5679c89d48157c64f3fb54bb4640bcd4648350f43e935afc1512b6932546f0b')

latestver() {
    gh api --paginate repos/Revertron/Yggdrasil-ng/releases --jq \
        '.[] | select(.prerelease == false and .draft == false) | .tag_name' |
        sed -nE 's/^v?([0-9]+(\.[0-9]+)*)$/\1/p' | sort -V | tail -1
}

package() {
    cd "${srcdir}"
    # .deb is an ar archive wrapping data.tar.xz; unwrap both layers.
    bsdtar -xf "${pkgname}-${pkgver}-${CARCH}.deb"
    bsdtar -xpf data.tar.*

    install -Dm755 usr/bin/yggdrasil "${pkgdir}/usr/bin/yggdrasil"
    install -Dm644 usr/lib/sysusers.d/yggdrasil.conf "${pkgdir}/usr/lib/sysusers.d/yggdrasil.conf"
    # Upstream ships the unit at the Debian path /lib/systemd; relocate to the Arch path.
    install -Dm644 lib/systemd/system/yggdrasil.service "${pkgdir}/usr/lib/systemd/system/yggdrasil.service"
}
