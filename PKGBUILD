# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: Tom Moore <t.moore01@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

pkgname=plex-media-server
pkgver=0.9.12.13.1464
_pkgsum=4ccd2ca
pkgrel=1
pkgdesc='Plex Media Server'
arch=('arm' 'armv7h' 'i686' 'x86_64')
url='https://plex.tv/'
license=('custom')
depends=('systemd')
makedepends=('prelink')
replaces=('plexmediaserver')
conflicts=('plexmediaserver' 'plexmediaserver-plexpass')
backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'terms.txt')
source_arm=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm.spk")
source_armv7h=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/PlexMediaServer-${pkgver}-${_pkgsum}-arm7.spk")
source_i686=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.i386.rpm")
source_x86_64=("https://downloads.plex.tv/plex-media-server/${pkgver}-${_pkgsum}/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")
sha256sums=('7ab1ee8da9012d257b7f473fb79d76b201ca592cbe3722f977a43b58bfad180e'
            '9da45cc3951ae03086ec663e6273c2de0183495fd15dc34ddd9aa100346d4d3a'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')
sha256sums_arm=('72f4a9f4b575d341d45ecb39894a78951e8db837220578ad243c8f3c2f04fc73')
sha256sums_armv7h=('88349fabbfc914a77e58ac95a82a420173c6d1381c6a4fd63d1bb4bf4e42277b')
sha256sums_i686=('578f2ec19ff67c59a6e8d35c9de0c9632c15030823c3c02b52e89a79b4769606')
sha256sums_x86_64=('46dcb6a1bf1945d54f951515d1cb07e160ac065c8ab482a2a1778835661cf8bf')

prepare() {
  if [[ $CARCH =~ arm* ]]; then
    mkdir -p usr/lib/plexmediaserver
    tar -xf package.tgz -C usr/lib/plexmediaserver/
  fi

  #Fix for SELinux and Grsecurity
  execstack -c usr/lib/plexmediaserver/libgnsdk_dsp.so*
}

package() {
  install -dm 755 "${pkgdir}"/{opt,etc/conf.d,usr/lib/systemd/system}
  cp -dr --no-preserve='ownership' usr/lib/plexmediaserver "${pkgdir}"/opt/
  install -m 644 plexmediaserver.service "${pkgdir}"/usr/lib/systemd/system/
  install -m 644 plexmediaserver.conf.d "${pkgdir}"/etc/conf.d/plexmediaserver

  install -dm 755 "${pkgdir}"/var/lib/plex
  chown 421:421 -R "${pkgdir}"/var/lib/plex

  install -dm 755 "${pkgdir}"/usr/share/licenses/plex-media-server
  install -m 644 terms.txt "${pkgdir}"/usr/share/licenses/plex-media-server/
}

# vim: ts=2 sw=2 et:
