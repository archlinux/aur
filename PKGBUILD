# Maintainer: Sam Burgos <santiago.burgos1089@gmail.com>
# Contributor: Kyle Laker <kyle@laker.email>

pkgname=warpinator
pkgver=1.0.3
pkgrel=1
pkgdesc="Allows simple local network file sharing"
arch=("x86_64")
url="http://packages.linuxmint.com/pool/main/w/${pkgname}"
license=("GPL")
depends=(
    gtk3
    python-cryptography
    python-gobject
    python-grpcio
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
optdepends=('gufw: Configure firewall rules')
conflicts=(
    lm-warp
    warpinator-git
)
source=("${pkgname}_${pkgver}.tar.xz::${url}/${pkgname}_${pkgver}.tar.xz")
sha256sums=('5476a625e88fa5a6be73d0ba07d0a22a4b6737d029499d5c6787f8f1fc894720')

prepare() {
	cd "$srcdir/warp"

	# Fix hard-coded libexec dir
	sed -i 's/libexec/lib/g' \
		"bin/warpinator" \
		install-scripts/meson_generate_and_install_protobuf_files.py
}

build() {
    arch-meson warp build
    ninja -C build
}

package() {
    DESTDIR="$pkgdir" ninja -C build install
}
