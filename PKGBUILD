#Maintainer  : Martin Wimpress <code@flexion.org>
#Contributor : Nick Pope
#Contributor : Bryce Nordgren  <bnordgren at gmail dot com>
 
pkgname=hdf-java
_pkgname=HDFView
pkgver=2.13.0
pkgrel=1
pkgdesc="Java interface to HDF 4 and 5; plus the HDFView application"
arch=('i686' 'x86_64')
url="http://www.hdfgroup.org/hdf-java-html/"
license=('custom')
depends=('java-runtime')
optdepends=('hdf4: to work with hdf4 files',
            'hdf5: to work with hdf5 files')
options=(!strip)
#source=("http://www.hdfgroup.org/ftp/HDF5/releases/HDF-JAVA/${pkgname}-${pkgver}/bin/${pkgname}-${pkgver}-linux.tar.gz"
source=("http://www.hdfgroup.org/ftp/HDF5/hdf-java/current/bin/${_pkgname}-${pkgver}-centos6-x64.tar.gz"
        license
        HDFView
        HDFView.desktop
        HDFView.ico)
md5sums=('8ad9c8eca89221078a58f70a999ae0b4'
         'db0de6079dd881781768d05de29c50e0'
         '19a7c18ec9673860e1a3fb3ee5716ee3'
         '965c57f4c686cc145a7fa05679bc8335'
         'b86542f80203ea9f93f447fa7c20d25a')
 
prepare() {
    # Make extraction automatic
    sed -i 's/interactive=TRUE/interactive=FALSE/' "${srcdir}/HDFView-${pkgver}-Linux.sh"
    sed -i 's/cpack_skip_license=FALSE/cpack_skip_license=TRUE/' "${srcdir}/HDFView-${pkgver}-Linux.sh"
}
 
build() {
    cd "${srcdir}"
    mv ./HDFView ./HDFView-moved-temporarily
    ./HDFView-${pkgver}-Linux.sh
    mv ./HDFView ./${_pkgname}-${pkgver}
    mv ./HDFView-moved-temporarily ./HDFView
}
 
package() {
    # JARs
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/${pkgver}/lib" "${pkgdir}/usr/share/java/${pkgname}"
    find "${pkgdir}/usr/share/java/${pkgname}" -type 'f' -exec chmod 644 '{}' \;
    find "${pkgdir}/usr/share/java/${pkgname}" -type 'd' -exec chmod 755 '{}' \;
 
    # Main script
    mkdir -p "${pkgdir}/usr/bin"
    sed "s:JAVABIN=${srcdir}/HDFView/${pkgver}/jre/bin:JAVABIN=/usr/bin:" "${srcdir}/${_pkgname}-${pkgver}/${pkgver}/hdfview.sh" > "${pkgdir}/usr/bin/hdf-java"
    sed -i "s:INSTALLDIR=${srcdir}/HDFView/${pkgver}:INSTALLDIR=/usr/share/java/hdf-java:" "${pkgdir}/usr/bin/hdf-java"
    chmod 755 "${pkgdir}/usr/bin/hdf-java"
 
    # Documentation
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    cp -r "${srcdir}/${_pkgname}-${pkgver}/${pkgver}/share/doc" "${pkgdir}/usr/share/${pkgname}/doc"
    find "${pkgdir}/usr/share/${pkgname}/doc" -type 'f' -exec chmod 644 '{}' \;
    find "${pkgdir}/usr/share/${pkgname}/doc" -type 'd' -exec chmod 755 '{}' \;
 
    # Desktop files, icons, wrappers and license
    install -D -m 755 "${srcdir}/HDFView" "${pkgdir}/usr/bin/HDFView"
    install -D -m 644 "${srcdir}/HDFView.desktop" "${pkgdir}/usr/share/applications/HDFView.desktop"
    install -D -m 644 "${srcdir}/HDFView.ico" "${pkgdir}/usr/share/pixmaps/HDFView.ico"
    install -D -m 644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
