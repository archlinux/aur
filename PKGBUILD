# Maintainer: Daniel Bermond <dbermond@archlinux.org>
# Maintainer: Eli Schwartz <eschwartz@archlinux.org>

pkgname=pax-git
pkgver=20201030.r14.g9e000f5
pkgrel=1
pkgdesc='Portable Archive Interchange - the POSIX standard archive tool for cpio and tar formats (git version)'
arch=('x86_64')
url='https://mbsd.evolvis.org/pax.htm'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git')
provides=('pax')
conflicts=('pax')
source=('git+https://github.com/MirBSD/mircpio.git')
sha256sums=('SKIP')

prepare() {
    mkdir -p build
}

pkgver() {
    local _version
    local _revision
    local _shorthash
    _version="$(git -C mircpio tag --list --sort='-v:refname' 'paxmirabilis-*' | sed -n 's/^paxmirabilis-//;1p')"
    _revision="$(git -C mircpio rev-list --count "paxmirabilis-${_version}..HEAD")"
    _shorthash="$(git -C mircpio rev-parse --short HEAD)"
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd build
    sh ../mircpio/Build.sh -r -tpax
    
    # license
    sed -n '5,36p' ../mircpio/pax.h > LICENSE # create file
    sed -i '1,32s/^.\{,3\}//' LICENSE # erase C comments
}

package(){
    # executables
    install -D -m755 build/pax -t "${pkgdir}/usr/bin"
    ln -s pax "${pkgdir}/usr/bin/paxcpio"
    ln -s pax "${pkgdir}/usr/bin/paxtar"
    
    # man pages
    install -D -m644 build/mans/*.1 -t "${pkgdir}/usr/share/man/man1"
    
    # license
    install -D -m644 build/LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
