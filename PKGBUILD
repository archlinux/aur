# Maintainer: Andrew <darkseed2007@yandex.ru>
# Contributor: Robert Štětka <robert dot stetka at gmail dot com>
pkgname=freenet-fms
_realname=fms
pkgver=0.3.77
pkgrel=1
url="http://127.0.0.1:8888/USK@0npnMrqZNKRCRoGojZV93UNHCMN-6UU3rRSAmP6jNLE,~BG-edFtdCC1cSH4O3BWdeIYa8Sw5DfyrSV-TKdO5ec,AQACAAE/fms/140/"
pkgdesc="Freenet Messaging System"
arch=('i686' 'x86_64')
license=('GPL')
depends=('poco-git>=1.7.3' 'sqlite3>3.6.14' 'freenet' )
makedepends=('cmake')
install=fms.install
# You have to start freenet before down installation
# or download the package manually and place it to the
# build directory
source=("http://127.0.0.1:8888/?forcedownload&max-size=99999999&key=CHK@oyg6hliLoBymldIAsEb0gFmpNRN~GWVmR952cpbU3gw,2lg~dK8IiX4-z3WPQLJ8a3~xBcXbZPg0SxpMC4lWf~E,AAMC--8/${_realname}-src-${pkgver}.zip"
        'fms.install'
        'fms.service')
sha256sums=('c97929deab12ab4002a79255f09d05712644145ea54850468d1010d580e99468'
            '5c7db16d80a0af8e80447c8753cc1be66a834634798ea4ff913c6586d40a8da4'
            '0d276666a39efe3ba139259ec567f04b6767f26a13f2d2bf455a2005cf61791a')
build() {
  cd "${srcdir}/"

  cmake -D I_HAVE_READ_THE_README=ON -D USE_BUNDLED_SQLITE=OFF . || return 1
  make || return 1
}

package() {
  mkdir -p ${pkgdir}/opt/${_realname}/ || return 1
  cp fms ${pkgdir}/opt/${_realname}/ || return 1
  cp *.htm ${pkgdir}/opt/${_realname}/ || return 1
  cp readme.txt ${pkgdir}/opt/${_realname}/ || return 1
  cp -a fonts/ ${pkgdir}/opt/${_realname}/|| return 1
  cp -R images/ ${pkgdir}/opt/${_realname}/ || return 1
  cp -a styles/ ${pkgdir}/opt/${_realname}/ || return 1
  cp -a translations/ ${pkgdir}/opt/${_realname}/ || return 1

  chown -R 114:114 ${pkgdir}/opt/${_realname} || return 1
  chmod -R ug=rwX,o=rX ${pkgdir}/opt/${_realname}|| return 1

  # systemd service
  install -Dm644 ${_realname}.service ${pkgdir}/usr/lib/systemd/system/${_realname}.service
}


# vim:set ts=2 sw=2 et:
