# Maintainer: Gordian Edenhofer <gordian.edenhofer@gmail.com>
# Contributor: Michael Witten <mfwitten>
# Contributor: Matthieu Rakotojaona <rakoo>

pkgname=bup-git
pkgver=1364.cad3c11
pkgrel=2
pkgdesc='Efficient file backup system based on the git packfile format'
arch=('i686' 'x86_64')
url='https://bup.github.io/'
license=('GPL')
depends=('python2-fuse' 'par2cmdline' 'pylibacl' 'python2-pyxattr' 'acl' 'attr' 'git')
optdepends=('python2-tornado: launch a web server to examine backup sets')
makedepends=('pandoc')
#checkdepends=('rsync')
provides=("bup=${pkgver}")
conflicts=("bup")
source=("${pkgname}"::"git+https://github.com/bup/bup.git")
md5sums=('SKIP')

pkgver() {
	cd "${srcdir}/${pkgname}"
	echo $(git rev-list --count HEAD).$(git rev-parse --short HEAD)
}

prepare() {
	cd "${srcdir}/${pkgname}"

	# Fixing numerous false invocations since python2 is needed
	find . -type f -exec sed -i -e '1s/env python\b/env python2/' {} +
	sed -i -e 's/find_prog python\b/find_prog python2/' \
		-e 's/MF_PATH_INCLUDE PYTHON python\b/MF_PATH_INCLUDE PYTHON python2/' \
		config/configure
	sed -i -e 's/PYTHON=python\b/PYTHON=python2/' -e '/docs-available/d' Makefile
	sed -i -e 's/python\b -c/python2 -c/' t/{lib,test-meta,test-ls}.sh

	# Make test suite happy
	#git config --global user.email "bob@zombo.com"
}

build() {
	make -C "${srcdir}/${pkgname}"
}

# Disabled in favor of increased speed
#check() {
#	make -C "${srcdir}/${pkgname}" test -j1
#}

package() {
	make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" PREFIX="/usr" install
}
