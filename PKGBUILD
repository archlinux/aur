# Maintainer: Adrien Prost-Boucle <adrien.prost-boucle@laposte.net>
# Maintainer: xiretza <xiretza+aur@xiretza.xyz>

pkgname=ghdl-mcode-git
pkgver=4.0.0dev.r8602.g97df73f72
pkgrel=1
arch=('x86_64' 'i686' 'pentium4')
pkgdesc='VHDL simulator - mcode back-end'
url='https://github.com/ghdl/ghdl'
license=('GPL2')

provides=("ghdl=$pkgver" "ghdl-git=$pkgver")
conflicts=('ghdl' 'ghdl-gcc-git' 'ghdl-llvm-git')
makedepends=('git')
depends=('gcc-ada')
checkdepends=(
	'python-pytest' 'python-pyvhdlmodel>=0.12'
	'python-pytooling' 'python-pyattributes'
)
optdepends=(
	'python-pyghdl: python bindings and utilities'
)

source=(
	"ghdl::git+https://github.com/ghdl/ghdl.git"
)
sha256sums=('SKIP')

pkgver() {
	cd "${srcdir}/ghdl"

	# GHDL version (extracted from configure)
	local _distver=`sed -n -e 's/^ghdl_version=.*"\(.*\)".*/\1/p' configure | tr -d '-'`

	# Date of the last git commit
	#local _gitver=`git log -n 1 --date=short | sed -n -e 's/.*Date:\s*\([0-9-]*\).*/\1/p' | tr -d -`
	# Revision number
	local _gitrev=`git rev-list --count HEAD`
	# Short hash of latest commit
	local _githash=`git rev-parse --short HEAD`

	#echo $_distver.git$_gitver;
	echo $_distver.r$_gitrev.g$_githash;
}

build() {
	cd "${srcdir}/ghdl"

	export ADA_FLAGS="$CFLAGS -fno-strict-aliasing"
	ADA_FLAGS="${ADA_FLAGS//-Wformat}"
	ADA_FLAGS="${ADA_FLAGS//-Werror=format-security}"

	./configure \
		--prefix=/usr/ \
		--enable-libghdl \
		--enable-synth

	make

}

check() {
	cd "${srcdir}/ghdl"

	make install.vpi.local

	make test
}

package() {
	cd "${srcdir}/ghdl"

	make DESTDIR="${pkgdir}" install

	# In case it does not exist, create symlink libghdl.so
	local _gso=`ls "${pkgdir}/usr/lib/" | grep -e '^libghdl-.*\.so$' | head -n 1`
	if [[ -n "$_gso" ]] ; then
		ln -s "$_gso" "${pkgdir}/usr/lib/libghdl.so"
	fi

	# GTKWave has always installed binary ghwdump, now ghdl does it too
	# While awaiting for the two projects to agree, don't install ghwdump from here
	rm -f "${pkgdir}/usr/bin/ghwdump"
}
