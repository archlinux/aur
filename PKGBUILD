# Maintainer: Tomasz Zok <tomasz.zok [at] gmail.com>
pkgname=x3dna
_pkgver=2.3
pkgver=${_pkgver}.3_20180906
pkgrel=1
pkgdesc="3DNA is a versatile, integrated software system for the analysis, rebuilding and visualization of three-dimensional nucleic-acid-containing structures. Please see: http://forum.x3dna.org/site-announcements/download-instructions/"
arch=('x86_64')
url="http://forum.x3dna.org/downloads/3dna-download/"
license=('custom')
depends=('ruby')
source=("${pkgname}.md5")
md5sums=('SKIP')

package() {
    archive=${pkgname}-v${_pkgver}-linux-64bit.tar.gz
    if [[ ! -r "../${archive}" ]]; then
        echo "You must download ${archive} on your own from the project webpage"
        echo 'See: http://forum.x3dna.org/site-announcements/download-instructions/'
        return 1
    fi
    if ! md5sum --quiet --check "${pkgname}.md5"; then
        echo 'Invalid checksum!'
        return 1
    fi

    bsdtar xfz ../${archive}
    cd ${pkgname}-v${_pkgver}/

    install -d ${pkgdir}/etc/profile.d/
    install -d ${pkgdir}/opt/${pkgname}-v${_pkgver}/
    install -d ${pkgdir}/usr/bin/

    # fix conflict with hunspell package
    mv bin/analyze bin/analyze-x3dna

    install bin/* ${pkgdir}/usr/bin/
    cp -R config doc examples fiber lib np_recipes perl_scripts src ${pkgdir}/opt/${pkgname}-v${_pkgver}/
    echo "export X3DNA=/opt/${pkgname}-v${_pkgver}" > "$pkgdir/etc/profile.d/x3dna.sh"
}
