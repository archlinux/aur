# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Matthieu Rakotojaona <rakoo>

pkgname=bup-git
epoch=1
pkgver=0.33.r1.g75b4ad2f
pkgrel=1
pkgdesc='Efficient file backup system based on the git packfile format'
arch=('i686' 'x86_64' 'aarch64')
url='https://bup.github.io/'
license=('GPL')
depends=('python-fuse' 'par2cmdline' 'python-pyxattr' 'acl' 'readline' 'attr' 'git')
optdepends=('python-tornado: launch a web server to examine backup sets'
	'readline: FTP access'
	'par2cmdline: error correction'
	'python-pytest-xdist: parallel tests')
makedepends=('pandoc')
checkdepends=('rsync' 'python-pytest')
provides=("bup=${pkgver}")
conflicts=("bup")
source=("${pkgname}"::"git+https://github.com/bup/bup.git")
sha512sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	( set -o pipefail
	git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' \
	|| printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

prepare() {
	cd "${srcdir}/${pkgname}"

	# Configure the program to use python3 everywhere
	PYTHON=/usr/bin/python3 ./configure
}

build() {
	make -C "${srcdir}/${pkgname}"
}

check() {
	make -C "${srcdir}/${pkgname}" test
}

package() {
	make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
