# Maintainer: robertfoster
# Contributor: jon wiersma < arch aur at jonw dot org>
# Contributor: abozanich

_name=linux-sgx-driver
pkgname="${_name}-hayao-dkms-git"
pkgver=2.14.r31.90aad0a
pkgrel=1
pkgdesc="Intel® SGX Linux module forked by hayao - dkms"
arch=('i686' 'x86_64')
url="https://01.org/intel-softwareguard-extensions"
license=('GPL2')
depends=('dkms')
optdepends=('linux-headers: Build the module for Arch kernel'
	'linux-lts-headers: Build the module for LTS Arch kernel'
	'linux-zen-headers: Build the module for Zen Arch kernel')
source=("${_name}::git+https://github.com/Hayao0819/${_name}.git" "dkms.conf")
sha256sums=('SKIP' 'SKIP')

pkgver() {
	cd "${_name}"
	printf "%s" "$(git describe --tags | sed 's/sgx_driver_//g' | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

package() {
	cd "$srcdir/$_name" || return 1
	local installDir="${pkgdir}/usr/src/${_name}-${pkgver}"

	install -dm755 "${installDir}"

	cp -ar ./* "${installDir}"

	# Set name and version
	sed -e "s/@PKG@/${_name}/" \
		-e "s/@PKGVER@/${pkgver}/" \
		"$srcdir/dkms.conf" >"$installDir/dkms.conf"

	# Remove .git folder
	rm -rf "${installDir}/.git*"
}
