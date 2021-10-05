# Maintainer: zoe <chp321 at gmail dot com>

pkgname=iscan-for-epson-v500-photo
pkgver=2.30.4
pkgrel=4
pkgname_plugin=iscan-plugin-gt-x770
pkgver_plugin=2.1.3-1
pkgver_iscan_data=1.39.2-1

pkgdesc="All-in-one package from Epson : iscan + iscan-data + plugin for scanner Epson V500 Photo (also called GT-X770) - iscan[community] is out-of-date and buggy"
arch=('x86_64')
url="https://support.epson.net/linux/en/iscan.php?model=gt-x770&version=${pkgver}"
license=('custom:EPSON')
provides=('iscan' 'iscan-data' 'iscan-plugin-epson-v500-photo')
depends=('libjpeg6' 'libpng12')
makedepends=('binutils' 'tar' 'deb2targz')
install=${pkgname}.install
md5sums_install=('be4086b1e50cb7e2a2e5d5c1bb5a8848')

source=("https://download2.ebz.epson.net/iscan/plugin/gt-x770/deb/x64/iscan-gt-x770-bundle-${pkgver}.x64.deb.tar.gz")
md5sums=('2990ce5c70862b28415aa9132083cc6f')

prepare() {
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/plugins
    deb2targz ${pkgname_plugin}_${pkgver_plugin}_amd64.deb
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/core
    deb2targz iscan_${pkgver}-2_amd64.deb
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/data
    deb2targz iscan-data_${pkgver_iscan_data}_all.deb
}

package() {
    install -d ${pkgdir}/usr/share
    install -d ${pkgdir}/usr/lib/{iscan-data,udev/rules.d}
    install -d ${pkgdir}/etc
    install -d ${pkgdir}/var/lib/iscan
    
    install -t ${pkgdir}/usr/lib/udev/rules.d/ ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/60-iscan.rules

    ## iscan-data
    ##############
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/data
    tar -zxvf iscan-data_${pkgver_iscan_data}_all.tar.gz 
    
    install -t ${pkgdir}/usr/lib/iscan-data/   usr/lib/iscan-data/make-policy-file
    cp -R -t ${pkgdir}/usr/share/    usr/share/{doc,iscan-data}
      
    ## iscan
    ##########
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/core/
    tar -zxvf iscan_2.30.4-2_amd64.tar.gz
    
    #cp -R -t ${pkgdir}/etc        etc/sane.d
    cp -R -t ${pkgdir}/           etc
    cp -R -t ${pkgdir}/usr        usr/{bin,lib}  
    install -t ${pkgdir}/usr/bin  usr/sbin/iscan-registry 
    cp -R -t ${pkgdir}/usr/share  usr/share/{applications,doc,locale,man} 
            
    ## Plugin Epson Perfection V500 Photo
    ######################################
    cd ${srcdir}/iscan-gt-x770-bundle-${pkgver}.x64.deb/plugins
    tar -zxvf iscan-plugin-gt-x770_${pkgver_plugin}_amd64.tar.gz
    
    cp -R -t ${pkgdir}/usr        usr/{lib,share}
}
