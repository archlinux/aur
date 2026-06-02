# Maintainer: Petr Špaček <pspacek@isc.org>
pkgname=dnsshotgun-git
pkgver=20240219.r31.f0aec1a
pkgrel=1
pkgdesc="High-performance realistic DNS benchmarking tool"
arch=('x86_64')
url="https://gitlab.nic.cz/knot/shotgun"
license=('GPL3')
depends=(
    'dnsjit'
    'libnghttp2'
    'libngtcp2'
    'libuv'
    'python'
    'python-jinja'
    'python-matplotlib'
    'python-toml'
    )
optdepends=(
    'wireshark-cli: needed by some PCAP pre-processing scripts'
)
makedepends=(
    'cmake'
    'git'
    )
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=("git+https://gitlab.nic.cz/knot/shotgun.git")
sha256sums=('SKIP')

prepare() {
	cd "$srcdir"
	rm -rf "${pkgname%-git}"
	ln -s shotgun "${pkgname%-git}"
	cd "$srcdir/${pkgname%-git}"
}

pkgver() {
    cd "${srcdir}/${pkgname%-git}"
    printf "%s" "$(git describe --tags --long | sed 's/^v//;s/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
    cd "${srcdir}/${pkgname%-git}/replay/dnssim"
    mkdir -p build
    cd build
    cmake -DUSE_SYSTEM_NGTCP2=ON ..
    cmake --build .
}

package() {
    cd "${srcdir}/${pkgname%-git}/replay/dnssim/build"
    make DESTDIR="${pkgdir}/" install

    cd "${srcdir}/${pkgname%-git}"
    mkdir -p "${pkgdir}/usr/share/${pkgname%-git}"
    cp -rt "${pkgdir}/usr/share/${pkgname%-git}" configs docs pcap replay tools replay.py
}
