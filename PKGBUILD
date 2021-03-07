# Maintainer: Helle Vaanzinn <glitsj16 at riseup dot net >

pkgname=fdns
pkgver=0.9.64.2
pkgrel=5
pkgdesc="Firejail DNS-over-HTTPS proxy server"
arch=(x86_64)
license=(GPL2)
url="https://github.com/netblue30/fdns"
depends=('libseccomp' 'openssl')
optdepends=('apparmor: support for apparmor profiles'
    'bash-completion: bash completion'
    'firejail: seamless integration support'
    'systemd: run fdns as a systemd service')
validpgpkeys=('F951164995F5C4006A73411E2CCB36ADFC5849A7')
source=("https://github.com/netblue30/fdns/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz"{,.asc}
    "resolver.seccomp.patch::https://github.com/netblue30/fdns/commit/52c1298293b66004fa4895619927b6abc6c6405d.patch")
sha256sums=('1ecfb371748df2654f1ce9d14dde3f2f9266a50a9dbcff51122fb941ccc07236'
            'SKIP'
            '02a714c400476adb5eb6cbb5c9898bee0590b7950ac8cf91aa1e4f367e17fc04')

prepare() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    patch -Np1 < ../resolver.seccomp.patch # Update for kernel 5.11
}

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make DESTDIR="$pkgdir" install

    # license
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/COPYING" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    rm -f "${pkgdir}/usr/share/doc/${pkgname}/COPYING"
}
