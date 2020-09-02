# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=fanctl
pkgver=0.4.0
pkgrel=1
pkgdesc="fanctl is a replacement for fancontrol from lm_sensors meant to have a more fine-grained control interface in its config file"
arch=('i686' 'x86_64')
url="https://gitlab.com/mcoffin/fanctl"
license=('GPL3')
depends=('gcc-libs' 'lm_sensors')
makedepends=('cargo')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}.tar.gz::https://gitlab.com/mcoffin/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
        'fanctl.service')
sha512sums=('e6041c3528a48599fcdde4e598a71a95f256027d6867d8b1f06febe87c199442c08a5422e377a8aff373cf0fb7dc0d71680f3308ebb7ee8346ddefeaf2ec798e'
            'fa44e3a5a208db9b941f04936e3a1bad02348f9659afabfd3ec2b71579bf1d3f76a8171e706c697a505255831aaaf5095dba61f03704d194cc47f4c10370879c')

build() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    cargo build --release
}

package() {
    cd "${srcdir}/${pkgname}-v${pkgver}"
    cargo install --path . --root "${pkgdir}/usr" --bins
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./COPYING
    install -D -m 644 fanctl.yml "${pkgdir}/usr/share/fanctl.example.yml"
    install -D -m 644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/fanctl.service"
    rm -f "${pkgdir}/usr/.crates.toml"
    rm -f "${pkgdir}/usr/.crates2.json"
}
