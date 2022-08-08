# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail.com>
pkgname=fanctl
pkgver=0.6.4
pkgrel=1
pkgdesc="replacement for fancontrol with more fine-grained control interface in its config file"
arch=('i686' 'x86_64')
url="https://gitlab.com/mcoffin/fanctl"
license=('GPL3')
depends=('gcc-libs' 'lm_sensors')
makedepends=('cargo')
provides=("${pkgname}-git")
conflicts=("${pkgname}-git")
source=("${pkgname}::git+https://git.sr.ht/~mcoffin/fanctl#tag=v${pkgver}"
        'fanctl.service')
sha512sums=('SKIP'
            '577ab00c5cca64cc26dd882d9c6da05f3455cdaa7121ec041e53d5d046c65b8aeb29fd5aa59f0ea1a40ac9d3b9670df9854165ec8fee1ed1644e2c023d7caf00')

build() {
    cd "${srcdir}/${pkgname}"
    CARGO_INCREMENTAL=0 \
	    cargo build --release --locked
}

check() {
    cd "${srcdir}/${pkgname}"
    CARGO_INCREMENTAL=0 \
	    cargo test --release --locked
}

package() {
    cd "${srcdir}/${pkgname}"
    CARGO_INCREMENTAL=0 cargo install --path . --root "${pkgdir}/usr" --bins --locked
    install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" ./COPYING
    install -D -m 644 fanctl.yml "${pkgdir}/usr/share/fanctl.example.yml"
    install -D -m 644 -t "${pkgdir}/usr/lib/systemd/system" "${srcdir}/fanctl.service"
    rm -f "${pkgdir}/usr/.crates.toml"
    rm -f "${pkgdir}/usr/.crates2.json"
}
