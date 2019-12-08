# Maintainer: Torge Matthies <openglfreak at googlemail dot com>

_pkgname=libfyaml
pkgname=libfyaml-git
pkgver=v0.3.r59.gc09ea10
pkgrel=1
pkgdesc='A fancy 1.2 YAML and JSON parser/writer.'
arch=(x86_64)
url='https://github.com/pantoniou/libfyaml'
license=('MIT')
makedepends=(git python python-virtualenv python-pip)
#makedepends=(git)
checkdepends=(libyaml check)
provides=(libfyaml "libfyaml=${pkgver}")
conflicts=(libfyaml)
source=('git+https://github.com/pantoniou/libfyaml.git'
        'git+https://github.com/nst/JSONTestSuite.git'
        'git+https://github.com/yaml/yaml-test-suite.git')
sha512sums=(SKIP
            SKIP
            SKIP)

prepare() {
    cd "${srcdir}/${_pkgname}"

    mv "${srcdir}/JSONTestSuite" test/json-test-suite-data
    mv "${srcdir}/yaml-test-suite" test/test-suite-data
}

pkgver() {
    cd "${srcdir}/${_pkgname}"

    git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${_pkgname}"

    ./bootstrap.sh
    ./configure --prefix=/usr
    make

    # This does not work currently:
    #(
    #    . scripts/create-virtual-env
    #    make doc-html
    #)
}

# Checks are broken somehow...
_check() {
    cd "${srcdir}/${_pkgname}"

    make check
}

package() {
    cd "${srcdir}/${_pkgname}"

    make DESTDIR="${pkgdir}/" install
    #cp -r --no-preserve=all doc/_build/html "${pkgdir}/usr/share/doc/${_pkgname}"
}
