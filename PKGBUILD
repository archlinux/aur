# Maintainer: Yakov Till <yakov.till@gmail.com>
pkgname=yggdrasil-ng-bin
pkgver=0.2.0
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
sha256sums_x86_64=('2e5cffdcc48cba8d462f0985ed5ec497b6816dddb23e9b5d6391a028e9234226')
sha256sums_aarch64=('f6b9ab6e9e79a749d6ea9b12d16f071814685ce6867836549f8d9360981c14bc')
sha256sums_armv7h=('4a1b48524eb037bbcd99b88b95b5eb5a4cc09e2125e421cb18c0d27f9b0b3542')

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
