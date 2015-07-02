# MAINTAINER WANTED
# Source Available: https://github.com/michaelsproul/rust-nightly-archlinux
pkgname=rust-nightly-bin
pkgver=1.3.0_2015.07.02
pkgrel=1
arch=('i686' 'x86_64')
pkgdesc='Fast, concurrent, safe. The Rust programming language and its package manager, Cargo.'
url='http://www.rust-lang.org/'
provides=('rust' 'cargo')
conflicts=('rust' 'rust-git' 'rust-nightly' 'cargo-nightly-bin')
depends=('shared-mime-info')
license=('MIT' 'Apache')
source=("https://static.rust-lang.org/dist/rust-nightly-${CARCH}-unknown-linux-gnu.tar.gz"
        'rust-nightly.conf')
sha256sums=('SKIP' 'SKIP')
install=rust.install
options=(staticlibs !strip)

package() {
    local INSTALL_DIR=/usr/local
    local MAN_DIR=/usr/local/man

    # Rust, Cargo and Documentation.
    cd rust-nightly-${CARCH}-unknown-linux-gnu
    ./install.sh --prefix=${pkgdir}${INSTALL_DIR} --mandir=${pkgdir}${MAN_DIR}

    # FIXME: Establish .rs MIME type association.
    # mkdir -p "${pkgdir}/usr/share/mime/packages"
    # install -m 644 "${srcdir}/rust.xml" "${pkgdir}/usr/share/mime/packages/rust.xml"

    # Dynamic linker configuration (no LD_LIBRARY_PATH required).
    mkdir -p "${pkgdir}/etc/ld.so.conf.d"
    install -m 644 "${srcdir}/rust-nightly.conf" "${pkgdir}/etc/ld.so.conf.d/rust-nightly.conf"

    # Remove manifest file referencing $pkgdir.
    rm -f "${pkgdir}/usr/local/lib/rustlib/manifest-rustc"
}
