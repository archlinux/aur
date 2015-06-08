# Maintainer: Andrew <darkseed2007@yandex.ru>
# Contributor: Robert Štětka <robert dot stetka at gmail dot com>
pkgname=freenet-fms
_realname=fms
pkgver=0.3.75
pkgrel=1
url="http://127.0.0.1:8888/USK@0npnMrqZNKRCRoGojZV93UNHCMN-6UU3rRSAmP6jNLE,~BG-edFtdCC1cSH4O3BWdeIYa8Sw5DfyrSV-TKdO5ec,AQACAAE/fms/140/"
pkgdesc="Freenet Messaging System"
arch=('i686' 'x86_64')
license=('GPL')
depends=('poco>=1.3.6' 'sqlite3>3.6.14' 'freenet' )
makedepends=('cmake')
install=fms.install
# You have to start freenet before down installation
# or download the package manually and place it to the
# build directory
source=("http://127.0.0.1:8888/?forcedownload&max-size=99999999&key=CHK@GSJJ7n8~uBF3dxIqsJVy53g~rJZk8-MlyqN2nGN-Ces,wQIfL5UgA8Uh3ueTvEfIkTMk0dj9-Gcd~5qr97rseXE,AAMC--8/${_realname}-src-${pkgver}.zip"
        'fms.patch'
        'fms.install'
        'fms.service')
sha256sums=('1fe5e84aba572143fe95ffb384177e150d5cd4dff2930462b9df24b59c03d85e'
            'd2789f60679aacc9ce7a2e59ff87c0ca644e6f0e07af068930b19e5e4d62b1bf'
            '5c7db16d80a0af8e80447c8753cc1be66a834634798ea4ff913c6586d40a8da4'
            '0d276666a39efe3ba139259ec567f04b6767f26a13f2d2bf455a2005cf61791a')
build() {
  cd "${srcdir}/"
  patch -Np1 < ../fms.patch src/main.cpp || return 1

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
