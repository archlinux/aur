# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=fdns
pkgver=0.9.72
pkgrel=4
pkgdesc="Firejail DNS-over-HTTPS proxy server"
arch=(x86_64)
url="https://github.com/netblue30/fdns"
license=(GPL-3.0-only)
backup=(
    etc/fdns/hosts
    etc/fdns/list.adblocker
    etc/fdns/list.coinblocker
    etc/fdns/list.fp-trackers
    etc/fdns/list.phishing
    etc/fdns/list.tld-blacklist
    etc/fdns/list.trackers
    etc/fdns/resolver.seccomp
    etc/fdns/servers
)
depends=(
    libseccomp
    openssl
)
optdepends=('apparmor: support for apparmor profiles'
    'bash-completion: bash completion'
    'firejail: seamless integration support'
    'systemd: run fdns as a systemd service')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
_sd_fdns="${url}/raw/39711eac58e60ae2d02052223aabbf22b5379906/etc/${pkgname}.service"
source=("${url}/releases/download/v${pkgver}plus/${pkgname}-${pkgver}.tar.xz"{,.asc}
    "${pkgname}.hardened.service::${_sd_fdns}")
sha256sums=('fd8950aec6a73d92131967f2b21589b52f779d19d7a9398e1f0040164f456e68'
            'SKIP'
            'e7f1f0d58b3333c5fa10740886967a6acc674c28d2bcfe77356254c1dd6ffc62')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # use hardened systemd service
    rm -f "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    install -Dm644 "${srcdir}/${_pkgname}.hardened.service" \
        "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    # license
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
