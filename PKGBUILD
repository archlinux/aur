# Maintainer: David Oberhollenzer <goliath at infraroot dot at>

pkgname=('squashfs-tools-ng' 'squashfs-tools-ng-doc')
pkgver=1.1.2
pkgrel=2
epoch=
pkgdesc='A new set of tools and libraries for working with SquashFS images'
url='https://infraroot.at/projects/squashfs-tools-ng/index.html'
arch=('x86_64')
license=('GPL3' 'LGPL3')
depends=('lzo' 'lz4' 'xz' 'zstd' 'zlib' 'attr' 'bzip2')
source=(https://infraroot.at/pub/squashfs/${pkgname}-${pkgver}.tar.xz{,.asc}
        https://infraroot.at/pub/squashfs/patches-1.1.2/0001-Fix-printf-format-specifiers-used-for-generating-tar.patch{,.asc}
        https://infraroot.at/pub/squashfs/patches-1.1.2/0002-tar2sqfs-Fix-integer-truncation-issue-when-appending.patch{,.asc}
       )
sha512sums=('3f66cd9034997104e2d3281e271e8ccfbdd6ecaa98313636dcfd5251717e173ceede27b4a94342b011707fc1e96884ec733423f978697c6420915d96c153cf3e'
            'SKIP'
            'b7f0d6c4df285268e489429b446ec234de9d304543843d856a678eb81839a09e55e06f7bde19bb7ee18a10c02d365d1a4f6b91a5ce76e996f978f5fee3e6037a'
            'SKIP'
            'f22430a2b3799c74fa7d27986107ebc8ea403c79e5f64c0a35fbfc2ff520c29cf0ad7764767bb5fae2161797453b908aea0413ad3b42eed861f848fb64e305cc'
            'SKIP'
           )
validpgpkeys=('13063F723C9E584AEACD5B9BBCE5DC3C741A02D1')
groups=()
makedepends=(
    'fakeroot'
    'binutils'
    'autoconf'
    'automake'
    'autogen'
    'libtool'
    'pkgconf'
    'm4'
    'make'
    'gcc'
    'doxygen')
#
checkdepends=()
optdepends=('squashfs-tools')
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
noextract=()

prepare() {
    cd "$pkgname-$pkgver"
    patch --forward --strip=1 --input="${srcdir}/0001-Fix-printf-format-specifiers-used-for-generating-tar.patch"
    patch --forward --strip=1 --input="${srcdir}/0002-tar2sqfs-Fix-integer-truncation-issue-when-appending.patch"
}

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
    make doxygen-doc
}

check() {
    cd "$pkgname-$pkgver"
    make -k check
}

package_squashfs-tools-ng() {
    #depends=('zstd' 'attr' 'zlib' 'xz' 'lzo' 'bzip2' )
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

package_squashfs-tools-ng-doc() {
    arch=('any')
    optdepend=()
    depends=()
    cd "$pkgbase-$pkgver"
    install -d "$pkgdir/usr/share/doc/$pkgbase"
    cp -a doxygen-doc/* "$pkgdir/usr/share/doc/$pkgbase"
}
