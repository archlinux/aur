# Maintainer: Daniel Bermond < yahoo-com: danielbermond >

# This is an improved package for flite version 1 (flite1).
#
# flite version 1 is an old software from 2009. Since there, many issues
# have been discovered, including the security issue CVE-2014-0027. There
# are patches out there that addresses many of the discovered issues,
# and also adds some fixes and enhancements.
#
# Another notable issue that is also worth to be mentioned is a linking
# problem. This linking issue was exposed by upstream ffmpeg git commit
# 6dfcbd8. Without the propper patch, ffmpeg versions 3.5 and later will
# not compile, failing to detect libflite.

_srcname=flite
pkgname=flite1-patched
pkgver=1.4
pkgrel=3
pkgdesc='A lighweight speech synthesis engine (version 1, patched with fixes and improvements)'
arch=('x86_64')
url='http://www.speech.cs.cmu.edu/flite/'
license=('custom')
makedepends=('texlive-core' 'texinfo' 'ed')
provides=("flite=${pkgver}")
conflicts=('flite')
source=("http://www.festvox.org/flite/packed/${_srcname}-${pkgver}/${_srcname}-${pkgver}-release.tar.bz2"
        'flite-1.4-audio-interface.patch'
        'flite-1.4-fix-parallel-builds.patch'
        'flite-1.4-ldflags.patch'
        'flite-1.4-respect-destdir.patch'
        'flite-1.4-tempfile-CVE-2014-0027.patch'
        'flite.texi.patch'
        'texi2html_to_texi2any_migration.patch'
        'no_rpath.patch')
sha256sums=('45c662160aeca6560589f78daf42ab62c6111dd4d244afc28118c4e6f553cd0c'
            '405320984e098c3d788b7751935b2774972ee7970dbe0fef0718ce1e5cc725c9'
            'bfd51888ea533bb9ee74cadb68b2e507cb715ab5043aa679b7f42ab52336a7a1'
            'ff43e11241c9aea26483865c672c20421d12c688ae8b59b39471bafb52c1463e'
            '093538c3a7cd2b9b9edd1f0956a34c4261c3ccdd4feb55e8ecedc338562495f3'
            '597f1516060917faab008819e3ceb5bb487f5b3948e97eef1020dc10b62c6edf'
            'd38fa5dfd4fef71970d904622ec106b9ac18ece002c671b14bc1ce9b342b56b6'
            '1b51d528e3927b80159c6f6c2155fc022f807db7a0cf19c50e9a5e5831086efb'
            '462b9ecdb3e4992cb2fc026b6483ec83d883ece530a3fa0794a00e4f6fbfbb1a')

prepare() {
    cd "${_srcname}-${pkgver}-release"
    
    patch -Np1 -i "${srcdir}/flite-1.4-tempfile-CVE-2014-0027.patch"
    patch -Np1 -i "${srcdir}/flite-1.4-fix-parallel-builds.patch"
    patch -Np1 -i "${srcdir}/flite-1.4-respect-destdir.patch"
    patch -Np1 -i "${srcdir}/flite-1.4-ldflags.patch"
    patch -N   -i "${srcdir}/flite-1.4-audio-interface.patch"
    patch -Np1 -i "${srcdir}/flite.texi.patch"
    patch -Np1 -i "${srcdir}/texi2html_to_texi2any_migration.patch"
    patch -Np1 -i "${srcdir}/no_rpath.patch"
    
    # rename the conflicting variable 'BUILDDIR' to allow building with AUR helpers
    sed -i 's/BUILDDIR/_FLITE1_BUILDPATH/g' config/common_make_rules
}

build() {
    cd "${_srcname}-${pkgver}-release"
    
    ./configure \
        --prefix='/usr' \
        --enable-shared \
        --disable-static \
        --with-vox='cmu_us_kal16'
        
    make
    
    printf '%s\n' '  -> Building documentation...'
    cd   doc
    make doc
}

package() {
    cd "${_srcname}-${pkgver}-release"
    
    make DESTDIR="$pkgdir" install
    
    # documentation
    mkdir -p "${pkgdir}/usr/share/doc/${pkgname}/html"
    cd doc
    install -D -m644 flite.pdf "${pkgdir}/usr/share/doc/${pkgname}/flite.pdf"
    cd html
    install    -m644 *.html    "${pkgdir}/usr/share/doc/${pkgname}/html"
    
    # license
    cd "${srcdir}/${_srcname}-${pkgver}-release"
    install -D -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
