# Maintainer: Tom Moore <t.moore01@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

pkgname=plex-media-server
pkgver=0.9.16.3.1840
_pkgsum=cece46d
pkgrel=1
pkgdesc='Plex Media Server'
arch=('arm' 'armv7h' 'i686' 'x86_64')
url='https://plex.tv/'
license=('custom')
depends=('systemd')
makedepends_i686=('prelink')
makedepends_x86_64=('prelink')
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
sha256sums_arm=('a5224045fd4cf20b4b07f572b21f5d6bf73327a08c4a87cb010f65ca157c92e3')
sha256sums_armv7h=('d59801aa3ef04806d76a11cd3e08dadb015e4652d33416bc607fcd1d9fe0514a')
sha256sums_i686=('0f45b93d02ed491fdaf382d4eae02520e99f3579fceb7ab5321c13a1e18d64be')
sha256sums_x86_64=('eda5e924e0c3ab8bf373496f3fdb9d8d069fefacfad0e30a80c7281454b4395c')

prepare() {

case "$CARCH" in
  arm*) mkdir -p usr/lib/plexmediaserver && tar -zxf package.tgz -C usr/lib/plexmediaserver/;;
        #Fix for SELinux and Grsecurity
     *) execstack -c usr/lib/plexmediaserver/libgnsdk_dsp.so*;;
esac

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
