# Maintainer: Andrew <darkseed2007@yandex.ru>
# Contributor: Robert Štětka <robert dot stetka at gmail dot com>
pkgname=freenet-fms
_realname=fms
pkgver=0.3.79
pkgrel=1
url="http://127.0.0.1:8888/USK@0npnMrqZNKRCRoGojZV93UNHCMN-6UU3rRSAmP6jNLE,~BG-edFtdCC1cSH4O3BWdeIYa8Sw5DfyrSV-TKdO5ec,AQACAAE/fms/140/"
pkgdesc="Freenet Messaging System"
arch=('i686' 'x86_64')
license=('GPL')
depends=('poco>=1.7.6' 'sqlite3>3.6.14' 'freenet' )
makedepends=('cmake')
install=fms.install
# You have to start freenet before down installation
# or download the package manually and place it to the
# build directory
source=("http://127.0.0.1:8888/?forcedownload&max-size=99999999&key=CHK@5K1KMp7PRVL4ViePzUeidqWd1L5AS2EM3VM8p~AlaZo,4xnRHnAJxNrXCgnnVurrSWEL4L-qPafthoE8AZS0EKk,AAMC--8/${_realname}-src-${pkgver}.zip"
        'fms.install'
        'fms.service')
sha256sums=('b5dbb1e1d075e2134c692038ea95805a528807b0d777e2752f806f6935508f30'
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
