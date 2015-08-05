# Maintainer: MartiMcFly info@pietma.com

pkgname=('zarafa-webaccess-mdm')
_pkgname=('mdm')
pkgver=2.1
pkgrel=2
pkgdesc=('Mobile Device Management plugin for Zarafa Webaccess')
arch=('any')
url=('https://community.zarafa.com/mod/community_plugins/download.php?release_guid=9498')
source=('mdm2.zip::https://community.zarafa.com/mod/community_plugins/download.php?release_guid=9498'
        'zarafa-webaccess-mdm.ini'
        'mdm_login.patch')
license=('AGPL3')
depends=('zarafa-webaccess'
	 'z-push'
	 'php')
md5sums=('1de30b0292198e25f07c4ea9159901bf'
         'de837fc5ad2e8f2d70df5037f2a0a107'
         '88b10c74bc6e7194c52e282a336e1ac7')

package() {
    cd ${srcdir}/${_pkgname}

    patch -BNp1 -i ${srcdir}/mdm_login.patch

    # create folders
    mkdir -p ${pkgdir}/usr/share/webapps/zarafa-webaccess/plugins/${_pkgname}/
    cp -r * ${pkgdir}/usr/share/webapps/zarafa-webaccess/plugins/${_pkgname}/

    mkdir -p ${pkgdir}/etc/php/conf.d
    cp ${srcdir}/${pkgname}.ini ${pkgdir}/etc/php/conf.d

    # perform settings
    # => replace enable z-push2
    sed -i -e "s/\(zpush-2'] = \)\(.*\)\(;$\)/\1true\3/" ${pkgdir}/usr/share/webapps/zarafa-webaccess/plugins/${_pkgname}/config.php
    # => replace with https://
    sed -i -e "s/\(zpush-url'] = \)\(.*\)\(;$\)/\1\"https\:\/\/localhost\"\3/" ${pkgdir}/usr/share/webapps/zarafa-webaccess/plugins/${_pkgname}/config.php
}
