# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Kyle Laker <kyle@laker.email>

pkgname=warpinator
pkgver=1.1.1
_pkgver=ulyssa
pkgrel=1
pkgdesc="Allows simple local network file sharing"
arch=("x86_64")
url="http://packages.linuxmint.com/pool/backport/w/${pkgname}"
license=("GPL")
depends=(
    gtk3
    python-cryptography
    python-gobject
    python-grpcio
    python-packaging
    python-protobuf
    python-pynacl
    python-setproctitle
    python-xapp
    python-zeroconf
    xapps
)
makedepends=(
    gobject-introspection
    meson
    polkit
    python-grpcio-tools
)
optdepends=('ufw: Configure firewall rules')
conflicts=(
    lm-warp
    warpinator-git
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}+${_pkgver}.tar.xz")
sha256sums=('1598955eadf8ee8b1bf2c30ab1370e5a2713535c72805bdf1f6ebc4c6c4ecfd8')

prepare() {
	cd "$srcdir/warpinator"

	# Fix hard-coded libexec dir
	sed -i 's/libexec/lib/g' \
		bin/warpinator.in \
		install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
    arch-meson warpinator build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
