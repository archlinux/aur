# Maintainer: Tom Moore <tmoore01[at]gmail[dot]com>
# Contributors: Anthony Ruhier <a.ruhier[at]laposte[dot]net>

pkgname=subsonic-kang
pkgver=5.3
pkgrel=2

pkgdesc="Fork of the Subsonic project, an open-source web-based media streamer, with the licensing code removed"
url="https://github.com/EugeneKay/subsonic"
arch=('any')
license=('GPL')
depends=('bash' 'java-environment')
conflicts=('subsonic' 'subsonic-kang-git' 'subsonic-beta')
backup=('opt/subsonic-kang/subsonic.properties' 'opt/subsonic-kang/subsonic.sh')
noextract=('subsonic-v${pkgver}.war')
install='subsonic-kang.install'
source=("http://prdownloads.sourceforge.net/subsonic/subsonic-${pkgver}-standalone.tar.gz"
        "https://github.com/EugeneKay/subsonic/releases/download/v${pkgver}-kang/subsonic-v${pkgver}-kang.war"
        'subsonic-kang.service')

package() {
  war_name="subsonic-v${pkgver}-kang.war"
  install -dm 755 "${pkgdir}"/{opt/subsonic-kang,etc/conf.d,usr/lib/systemd/system,/var/lib/subsonic-kang/playlists}
  cp -dr --no-preserve='ownership' * "${pkgdir}"/opt/subsonic-kang/
  cp --no-preserve='ownership' "${war_name}" "${pkgdir}"/opt/subsonic-kang/subsonic.war
  find "${pkgdir}"/opt/subsonic-kang/ -type d -exec chmod 755 {} \;
  find "${pkgdir}"/opt/subsonic-kang/ -type f -exec chmod 664 {} \;
  sed -i 's/SUBSONIC_HOME=\/var\/subsonic/SUBSONIC_HOME=\/opt\/subsonic-kang/' "${pkgdir}"/opt/subsonic-kang/subsonic.sh
  sed -i 's/\/var/\/var\/lib\/subsonic-kang/' "${pkgdir}"/opt/subsonic-kang/subsonic.sh
  touch "${pkgdir}"/opt/subsonic-kang/subsonic.properties
  ln -fs /opt/subsonic-kang/subsonic.sh "${pkgdir}"/etc/conf.d/subsonic-kang.conf
  install -m 644 subsonic-kang.service "${pkgdir}"/usr/lib/systemd/system/
  rm -f "${pkgdir}"/opt/subsonic-kang/{subsonic.bat,subsonic-"${pkgver}"-standalone.tar.gz,"${war_name}",subsonic-kang.service}
}

sha256sums=('dc71cd31072f92d8e05850cd36758f8da07a9d91d13379b4f27db594137ad487'
            'ce6ecadcdef6e553dd0360581adcd9d47e72da24892c9ec381c74f8479fc2966'
            'a984953632162ad6197ef8d644042498d06bccbf30887f614cf5e41da6020ff4')

# vim: ts=2 sw=2 et:
