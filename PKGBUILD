# Maintainer: Federico Giuliani <federico.giuliani86@gmail.com>

pkgname=libresonic
pkgver=6.0.1
_subver=6.0
pkgrel=3

pkgdesc="Media streaming software"
url="https://github.com/Libresonic/libresonic"
arch=('any')
license=('GPL')
depends=('bash' 'java-environment')
conflicts=('subsonic' 'subsonic-kang' 'subsonic-kang-git' 'subsonic-beta')
backup=('opt/libresonic/subsonic.properties' 'opt/libresonic/subsonic.sh')
noextract=('libresonic-v${pkgver}.war')
install='libresonic.install'
source=("http://prdownloads.sourceforge.net/subsonic/subsonic-${_subver}-standalone.tar.gz"
        "https://github.com/Libresonic/libresonic/releases/download/v${pkgver}/libresonic-v${pkgver}.war"
        'libresonic.service')

package() {
  war_name="libresonic-v${pkgver}.war"
  install -dm 755 "${pkgdir}"/{opt/libresonic,etc/conf.d,usr/lib/systemd/system,/var/lib/libresonic/playlists}
  cp -dr --no-preserve='ownership' * "${pkgdir}"/opt/libresonic/
  cp --no-preserve='ownership' "${war_name}" "${pkgdir}"/opt/libresonic/subsonic.war
  find "${pkgdir}"/opt/libresonic/ -type d -exec chmod 755 {} \;
  find "${pkgdir}"/opt/libresonic/ -type f -exec chmod 664 {} \;
  sed -i 's/SUBSONIC_HOME=\/var\/subsonic/SUBSONIC_HOME=\/opt\/libresonic/' "${pkgdir}"/opt/libresonic/subsonic.sh
  sed -i 's/\/var/\/var\/lib\/libresonic/' "${pkgdir}"/opt/libresonic/subsonic.sh
  touch "${pkgdir}"/opt/libresonic/subsonic.properties
  ln -fs /opt/libresonic/subsonic.sh "${pkgdir}"/etc/conf.d/libresonic.conf
  install -m 644 libresonic.service "${pkgdir}"/usr/lib/systemd/system/
  rm -f "${pkgdir}"/opt/libresonic/{subsonic.bat,subsonic-"${_subver}"-standalone.tar.gz,"${war_name}",libresonic.service}
}

sha256sums=('df14d05e3b52f07486782e3e16922688968c95b0c8cc4987941bc3b9cea7872b'
            '52413b38ffb4e035f2d450faadc1cc52d5bd7bc65e9cd9223696a728d3ac9fba'
            '8d2ceae3cd0e14aeef9efd3281813dd4c0db411b950cbea6c4caf48a793dedce')

# vim: ts=2 sw=2 et:
