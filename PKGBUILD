# Maintainer: Amish <contact at via dot aur>
# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: Michal Krenek <mikos@sg1.cz>
# Contributor: redden0t8 -- contact via Arch Linux forums or AUR

pkgname=pam_abl
pkgver=1.0
pkgrel=1
pkgdesc="Automated blacklisting on repeated failed authentication attempts"
arch=('i686' 'x86_64')
url='https://github.com/amishmm/pam_abl'
license=('GPL')
depends=(db kyotocabinet pam)
makedepends=(asciidoc cmake)
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/amishmm/${pkgname}/archive/v${pkgver}.tar.gz"
        'pam_abl.conf'
        'pam_abl.tmpfiles')
sha512sums=('7d7083de5af5112d0300be1ee9699d3290f6e984a20ed30bf4f5d63cd6c0cc1b06c6546fe45004a507d703224e5a774cc727b619ba939a8daa26de75bb61e7e9'
            '5b5c5b8796a852de9c7bcd4c58aea091b43c292038e0913aedf2827f4cb43c35069e9b0c48150a422610b266115633b70d670007e234c0d457f06fa49c95e32f'
            '581b86314b221a19db18cac5f85189d6d6446641c065be6543e926aaf09829902b84fb782a791ffbe74bcf90feaf438bb5a693a2405453988820e5598d285a1b')
backup=('etc/security/pam_abl.conf')
install=pam_abl.install

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    cmake -B build -S . -DCMAKE_BUILD_TYPE=None -DCMAKE_INSTALL_PREFIX=/usr
    make -C build
    cd doc
    sh generate.sh
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"
    make -C build DESTDIR="${pkgdir}" install
    install -Dm644 ../pam_abl.conf "${pkgdir}"/etc/security/pam_abl.conf
    install -Dm644 doc/pam_abl.1 "${pkgdir}"/usr/share/man/man1/pam_abl.1
    install -Dm644 doc/pam_abl.8 "${pkgdir}"/usr/share/man/man8/pam_abl.8
    install -Dm644 doc/pam_abl.conf.5 "${pkgdir}"/usr/share/man/man5/pam_abl.conf.5
    install -Dm644 ../pam_abl.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/pam_abl.conf
}
