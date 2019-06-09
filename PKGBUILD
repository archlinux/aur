# Maintainer: Daniel Bermond < gmail-com: danielbermond >

pkgname=hm-svn
pkgver=16.20.r4998
pkgrel=1
pkgdesc='HEVC Test Model - the reference software for HEVC (svn version)'
arch=('x86_64')
url='https://hevc.hhi.fraunhofer.de/'
license=('BSD')
depends=('gcc-libs')
makedepends=('subversion' 'nasm')
provides=('hm')
conflicts=('hm')
source=('hm'::'svn+https://hevc.hhi.fraunhofer.de/svn/svn_HEVCSoftware/branches/HM-dev/'
        '0001-hm-svn-fix-build-with-gcc8.patch'
        '0002-hm-svn-use-arch-flags.patch')
sha256sums=('SKIP'
            '1fc52f8507902c7ee315bb7fbe42914dd4b0b49251d237b2e024e6e776ba02c3'
            'da19d17edfb2acac3feaedaf8169d84da3b6675de4c70b32d9a3d3144b9fc59f')

prepare() {
    cd hm
    
    # fix build with gcc8 (do not treat warnings as errors)
    patch -Np1 -i "${srcdir}/0001-hm-svn-fix-build-with-gcc8.patch"
    
    # use Arch build flags (add full relro and other improvements)
    patch -Np1 -i "${srcdir}/0002-hm-svn-use-arch-flags.patch"
}

pkgver() {
    cd hm
    
    local _version
    local _revision
    
    _version="$(awk '/NV_VERSION/ { gsub("\"", ""); print $3 }' source/Lib/TLibCommon/CommonDef.h)"
    _revision="$(svnversion | tr -d 'A-z')"
    
    printf '%s.r%s' "$_version" "$_revision"
}

build() {
    cd hm/build/linux
    
    # may randomly fail with multiple jobs
    make -j1 -f makefile release{,_highbitdepth}
}

package() {
    cd hm
    
    install -D -m755 bin/*     -t "${pkgdir}/usr/bin"
    install -D -m644 README    -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 doc/*.pdf -t "${pkgdir}/usr/share/doc/${pkgname}"
    install -D -m644 COPYING      "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
