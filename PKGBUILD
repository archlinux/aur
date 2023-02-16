# Maintainer: Luis Aranguren <pizzaman@hotmail.com>
# Contributor: Nicola Squartini <tensor5@gmail.com>

pkgname=core-lightning-git
pkgver=23.02rc3.r12598.e315f3072
pkgrel=1
pkgdesc='A lightweight, highly customizable and standard compliant implementation of the Lightning Network protocol.'
arch=('i686' 'x86_64')
url='https://github.com/ElementsProject/lightning'
license=('custom')
depends=('gmp' 'libsodium' 'sqlite')
makedepends=('clang' 'git' 'python-pytest' 'python-mako' 'mrkd')
source=('git+https://github.com/ElementsProject/lightning.git'
        'git+https://github.com/zserge/jsmn.git'
        'git+https://github.com/ianlancetaylor/libbacktrace.git'
        'git+https://github.com/jedisct1/libsodium.git'
        'git+https://github.com/ElementsProject/libwally-core.git')
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
    cd lightning
    _tag=$(git tag --list --sort=taggerdate | tail -n1 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    printf $_tag;
    printf ".r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd lightning
    sed -e 's/ -Werror//' -i configure
}

build() {
    cd lightning

    env CC=clang \
        COPTFLAGS="${CFLAGS}" \
        PYTEST=pytest ./configure --prefix=/usr
    make LDFLAGS="${LDFLAGS}" libexecdir=/usr/lib
}

package() {
    cd lightning

    make DESTDIR="${pkgdir}" libexecdir=/usr/lib install
    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
}
