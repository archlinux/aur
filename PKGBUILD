# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=libumem-git
_srcname=portableumem
pkgver=1.0.r15.g3fc772c
pkgrel=5
pkgdesc='A port of the Solaris libumem memory allocator'
arch=('x86_64')
url='https://github.com/omniti-labs/portableumem/'
license=('custom')
depends=('glibc')
makedepends=('git')
provides=('libumem')
conflicts=('libumem')
source=('git+https://github.com/omniti-labs/portableumem.git'
        'portableumem-various-cleanups.diff')
sha256sums=('SKIP'
            '78688c528903a154edb956e9058e37144a9f2b0e0818b3167d94d3a643ee2ccf')

prepare() {
    cd "$_srcname"
    
    git apply --index "${srcdir}/portableumem-various-cleanups.diff"
    
    ./autogen.sh
}

pkgver() {
    cd "$_srcname"
    
    local _version
    local _revision
    local _shorthash
    
    _version="$(git tag | grep '[[0-9]*\.]*[0-9]*' | sort -r | head -n1)"
    _revision="$(git rev-list "${_version}..HEAD" --count)"
    _shorthash="$(git rev-parse --short HEAD)"
    
    printf '%s.r%s.g%s' "$_version" "$_revision" "$_shorthash"
}

build() {
    cd "$_srcname"
    
    ./configure \
        --prefix='/usr' \
        --enable-shared='yes' \
        --enable-static='no' \
        --with-pic='yes'
        
    make
}

check() {
    cd "$_srcname"
    
    make check
}

package() {
    cd "$_srcname"
    
    make DESTDIR="$pkgdir" install
    
    install -D -m644 COPYRIGHT           -t "${pkgdir}/usr/share/licenses/${pkgname}"
    install -D -m644 OPENSOLARIS.LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"
}
