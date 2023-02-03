# Maintainer: VVL <me@ivvl.ru>
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Zachary Riedlshah <git@zacharyrs.me>
# Contributor: Jonas Heinrich <onny@project-insanity.org>

pkgname=onlyoffice-documentserver-bin
pkgver=7.3.0
pkgrel=1
pkgdesc="Online office suite comprising viewers and editors for texts, spreadsheets and presentations"
arch=('x86_64')
url="https://github.com/ONLYOFFICE/DocumentServer"
depends=('rabbitmq' 'postgresql' 'nginx')
conflicts=('onlyoffice-documentserver')
license=('AGPL')
source=("https://github.com/ONLYOFFICE/DocumentServer/releases/download/v${pkgver}/onlyoffice-documentserver.x86_64.rpm"
        "onlyoffice-fileconverter.service"
        "onlyoffice-docservice.service"
        "onlyoffice-documentserver.hook"
        "onlyoffice-documentserver.sysusers"
        "onlyoffice-documentserver.tmpfiles")
sha512sums=('fb0bf93105401c7de12a1b47ffda4c0678bbb40968325940f3cf2f3f065554f0f4611867f0c8ddf1d55ea732fa31c9ebde6aa20ce5e6def29492d4aee9c35631'
            '848074ce03328915d251db45a5475f6a2dff3b15f53b3b1dfbd702a9dc184d53aea78da1310db9c60d85a35062ce9986f37843c000f269dcaf8d624ed29e0a60'
            '3df1f5339b394eef1b27317f5d0e7786d2cb8dbbd13cddb22047567c3703f384d95f092fc34ce3031aeb895f013d7c0686ce968e1fae7f1f24473c1a6615f7ad'
            '707da287c3db6907fcdbf91cfe2ef057c77033713a1b4299a89a684b37fe3c74644e2c0b1fcec2afcd81c6511bb02ac3221d56c8caadb5d0c711d1842f78e780'
            'c7c23c5a7014e3251dfd86312d1d1e5c2d88f26ddc5aa967285202fd3ebf62c0a10c009b1cc5ad1b78e13fa0bc2eda515616d8af02325db434c0b2113c5b1ecb'
            'e1b8395ab7ef219860aebe9e7709a60cbaea1c28a8378aac3f54ce37b39944a7fd82b7efa8d59977f0891743cdface149b9f95f4b25c1c5322cb327c50d485ed')
backup=('etc/webapps/onlyoffice/documentserver/production-linux.json'
		'etc/webapps/onlyoffice/documentserver/default.json')
install="onlyoffice-documentserver.install"
options=('!strip')

prepare() {
  sed -i 's|/var/www/onlyoffice|/usr/share/webapps/onlyoffice|g' "${srcdir}/etc/onlyoffice/documentserver/production-linux.json"
  sed -i 's|/etc/onlyoffice/documentserver|/etc/webapps/onlyoffice/documentserver|g' "${srcdir}/etc/onlyoffice/documentserver/production-linux.json"
}

package() {
  install -d "${pkgdir}/usr/share/webapps/onlyoffice"
  install -d "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js"
  install -d "${pkgdir}/usr/lib/"
  install -d "${pkgdir}/var/lib/onlyoffice/documentserver/App_Data"
  install -d "${pkgdir}/var/log/onlyoffice/documentserver"
  cp -r "${srcdir}/var/www/onlyoffice/documentserver/" "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/"
  chmod -R 755 "${pkgdir}/usr/share/webapps/onlyoffice/documentserver/"
  install -Dm 644 ${srcdir}/etc/onlyoffice/documentserver/{default.json,production-linux.json} "${pkgdir}/etc/webapps/onlyoffice/documentserver/"
  install -Dm 644 ${srcdir}/etc/onlyoffice/documentserver/log4js/production.json "${pkgdir}/etc/webapps/onlyoffice/documentserver/log4js/"
  install -Dm 777 ${srcdir}/usr/lib64/* "${pkgdir}/usr/lib/"
  install -Dm 644 "${srcdir}/onlyoffice-docservice.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-docservice.service"
  install -Dm 644 "${srcdir}/onlyoffice-fileconverter.service" "${pkgdir}/usr/lib/systemd/system/onlyoffice-fileconverter.service"
  install -D "${srcdir}/onlyoffice-documentserver.hook" "${pkgdir}/usr/share/libalpm/hooks/onlyoffice-documentserver.hook"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.sysusers" "${pkgdir}/usr/lib/sysusers.d/onlyoffice-documentserver.conf"
  install -Dm 644 "${srcdir}/onlyoffice-documentserver.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/onlyoffice-documentserver.conf"
}
