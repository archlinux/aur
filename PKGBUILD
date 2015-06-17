#Maintainer  : Martin Wimpress <code@flexion.org>
#Contributor : Nick Pope
#Contributor : Bryce Nordgren  <bnordgren at gmail dot com>

pkgname=hdf-java
_pkgname=HDFView
pkgver=2.11
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
md5sums=('1cf203b659b54600c8ee735aea32f40e'
         'db0de6079dd881781768d05de29c50e0'
         '19a7c18ec9673860e1a3fb3ee5716ee3'
         '965c57f4c686cc145a7fa05679bc8335'
         'b86542f80203ea9f93f447fa7c20d25a')

prepare() {
    # Make extraction automatic
    sed -i 's/interactive=TRUE/interactive=FALSE/' "${srcdir}/${_pkgname}-${pkgver}/HDFView-${pkgver}.0-Linux.sh"
    sed -i 's/cpack_skip_license=FALSE/cpack_skip_license=TRUE/' "${srcdir}/${_pkgname}-${pkgver}/HDFView-${pkgver}.0-Linux.sh"
}

build() {
    cd "${srcdir}/${_pkgname}-${pkgver}"
    ./HDFView-${pkgver}.0-Linux.sh
}

package() {
    # JARs
    mkdir -p "${pkgdir}/usr/share/java/${pkgname}"
    mv "${srcdir}/${_pkgname}-${pkgver}/HDF_Group/${_pkgname}/${pkgver}.0/lib" "${pkgdir}/usr/share/java/${pkgname}"
    find "${pkgdir}/usr/share/java/${pkgname}" -type 'f' -exec chmod 644 '{}' \;
    find "${pkgdir}/usr/share/java/${pkgname}" -type 'd' -exec chmod 755 '{}' \;

    # Main script
    mkdir -p "${pkgdir}/usr/bin"
    sed -e 's:INSTALLDIR=/HDF_Group/HDFView/2.11.0:INSTALLDIR=/usr/share/java/hdf-java:' "${srcdir}/${_pkgname}-${pkgver}/HDF_Group/${_pkgname}/${pkgver}.0/bin/hdfview.sh" > "${pkgdir}/usr/bin/hdf-java"
    chmod 755 "${pkgdir}/usr/bin/hdf-java"

    # Documentation
    mkdir -p "${pkgdir}/usr/share/${pkgname}"
    mv "${srcdir}/${_pkgname}-${pkgver}/HDF_Group/${_pkgname}/${pkgver}.0/share/UsersGuide" "${pkgdir}/usr/share/${pkgname}/doc"
    find "${pkgdir}/usr/share/${pkgname}/doc" -type 'f' -exec chmod 644 '{}' \;
    find "${pkgdir}/usr/share/${pkgname}/doc" -type 'd' -exec chmod 755 '{}' \;

    # Desktop files, icons, wrappers and license
    install -D -m 755 "${srcdir}/HDFView" "${pkgdir}/usr/bin/HDFView"
    install -D -m 644 "${srcdir}/HDFView.desktop" "${pkgdir}/usr/share/applications/HDFView.desktop"
    install -D -m 644 "${srcdir}/HDFView.ico" "${pkgdir}/usr/share/pixmaps/HDFView.ico"
    install -D -m 644 "${srcdir}/license" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
