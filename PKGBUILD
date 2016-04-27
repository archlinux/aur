# Maintainer: Tom Moore <t.moore01@gmail.com>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

pkgname=plex-media-server
pkgver=0.9.16.6.1993
_pkgsum=5089475
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
sha256sums_arm=('e960cb98191a39cbf4557c4dea0a75e638ad95415eb666c035132b6c67e45940')
sha256sums_armv7h=('dfe4fea0cf8aadd4d36d967e2013b64b5bbc461d10e46230898097f84d952d61')
sha256sums_i686=('0f29c1d2a2fddda09ad69d69f1867e36d475600a730812536eb89864f5ac2b4e')
sha256sums_x86_64=('7843247084e55fce4bcce0b7a1e0ac4bcf9896adb63cd7535c7264cb56bfbdfd')

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
