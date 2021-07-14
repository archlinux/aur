# Maintainer: Tomas Krizek <tomas.krizek@nic.cz>
pkgname=shotgun-git
pkgver=20210714.r0.b979544
pkgrel=1
pkgdesc="High-performance realistic DNS benchmarking tool"
arch=('x86_64')
url="https://gitlab.nic.cz/knot/shotgun"
license=('GPL3')
depends=(
    'dnsjit'
    'python'
    'python-jinja'
    'python-toml'
    'python-matplotlib'
    )
optdepends=(
    'wireshark-cli: needed by some PCAP pre-processing scripts'
)
makedepends=(
    'autoconf'
    'git'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.nic.cz/knot/${pkgname%-git}")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${pkgname%-git}/replay/dnssim"
    ./autogen.sh
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/${pkgname%-git}/replay/dnssim"
    make DESTDIR="${pkgdir}/" install

    cd "${srcdir}/${pkgname%-git}"
    mkdir "${pkgdir}/usr/share/${pkgname%-git}"
    cp -rt "${pkgdir}/usr/share/${pkgname%-git}" configs docs pcap replay tools replay.py
}
