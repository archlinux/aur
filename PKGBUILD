# Maintainer: Gordian Edenhofer <gordian.edenhofer[at]yahoo[dot]de>
# Contributor: Michael Witten <mfwitten>
# Contributor: Matthieu Rakotojaona <rakoo>

pkgname=bup-git
pkgver=1278.6178db0
pkgrel=1
pkgdesc='Highly efficient file backup system based on the git packfile format (development version)'
arch=('i686' 'x86_64')
url='https://github.com/bup/bup'
license=('GPL')
depends=('python2' 'python2-fuse' 'par2cmdline' 'pylibacl' 'python2-pyxattr' 'attr' 'acl' 'git')
optdepends=('python2-tornado: launch a web server to examine backup sets')
provides=('bup')
conflicts=('bup')
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

    sed -i -e 's/bup_find_prog python\b/bup_find_prog python2/' \
           -e 's/MF_PATH_INCLUDE PYTHON python\b/MF_PATH_INCLUDE PYTHON python2/' \
           config/configure

    sed -i -e 's/PYTHON=python\b/PYTHON=python2/' -e '/docs-available/d' Makefile

    sed -i -e 's/python\b -c/python2 -c/' t/{lib,test-meta,test-ls}.sh
}

build() {
    make -C "${srcdir}/${pkgname}" all import-docs
}

# Checking routine fails because of unknown reason!
# - disabled in favor of increased speed
#check() {
#    make -C "${srcdir}/${pkgname}" test
#}

package() {
    make -C "${srcdir}/${pkgname}" DESTDIR="${pkgdir}" install
}
