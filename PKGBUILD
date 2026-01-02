# Maintainer: Torleif Skår <torleif.skaar AT gmail DOT com>
_pkgname=netgen
pkgname=${_pkgname}-lvs
pkgver=1.5.314
pkgrel=1
pkgdesc="Layout Vs Schematic (LVS) for comparing SPICE or Verilog netlists"
arch=('x86_64')
url="http://opencircuitdesign.com/netgen/index.html"
_url="https://github.com/RTimothyEdwards/netgen"
license=('GPL-1.0-or-later')
depends=(
	"tcl"
	"tk"
	"python"
	"glibc"
	"bash"
)
makedepends=(
	"git"
	"make"
)
provides=('netgen-lvs')
conflicts=("${pkgname}-git")
source=("${_pkgname}::git+${_url}#tag=${pkgver}")
b2sums=('d2042860a149a010de5949b90532d032922104d235c2bb61fc2f0a8845c627a37c18bb70e6cdf43a4c5fe6677fb917bb512755214753544ac0b233b01d0aee97')

build() {
	local custom_cflags=(
		-Wno-unused-result				# Remove warnings
		-Wno-old-style-definition       # Remove warnings
		-Wno-incompatible-pointer-types # Remove warnings
		-std=c17						# Implicit declarations are in use; need < C24
		-D_DEFAULT_SOURCE				# for 'strcasecmp' and 'isascii'
	)
	CFLAGS+=" ${custom_cflags[*]}"

	cd "${_pkgname}"
	./configure \
		--prefix=/usr
	make
}

package() {
	cd "${_pkgname}"
	make DESTDIR="$pkgdir/" install
}
