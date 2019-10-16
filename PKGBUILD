# Maintainer: Donald Webster <fryfrog@gmail.com>
# Maintainer: Shaun Bartlett <tixetsal@gmail.com>
# Contributor: Mikael Eriksson <mikael_eriksson@miffe.org>
# Contributor: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Rob Sletten <rsletten@gmail.com>
# Contributor: Tom Moore <t.moore01@gmail.com>
# Contributor: monty <linksoft@gmx.de>
# Contributor: Jon Wiersma <archaur@jonw.org>
# Contributor: Arthur <arthur.darcet@m4x.org>
# Contributor: Praekon <praekon@googlemail.com>

# Based on the plex-media-server package by Maxime Gauduin.

pkgname=plex-media-server-plexpass
pkgver=1.18.1.1966
_pkgsum=10fc2f8d3
pkgrel=1
pkgdesc='The back-end media server component of Plex.'
arch=('x86_64' 'armv7h' 'aarch64')
url='https://plex.tv/'
license=('custom')
options=('!emptydirs' '!strip' 'staticlibs')
provides=('plex-media-server')
conflicts=('plex-media-server')
# Commented to override user version
#backup=('etc/conf.d/plexmediaserver')
install='plex-media-server.install'
source=('plexmediaserver.conf.d'
        'plexmediaserver.service'
        'plex.sysusers'
        'plex.tmpfiles'
        'terms.txt')

source_aarch64=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/debian/plexmediaserver_${pkgver}-${_pkgsum}_arm64.deb")
source_armv7h=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/debian/plexmediaserver_${pkgver}-${_pkgsum}_armhf.deb")
source_x86_64=("https://downloads.plex.tv/plex-media-server-new/${pkgver}-${_pkgsum}/redhat/plexmediaserver-${pkgver}-${_pkgsum}.x86_64.rpm")

sha256sums=('16c4d1c2d5c40dff1e57a24b90fcb4fd6a32702bce569de4a3f23128920d3c67'
            'b2c5105e4d31d1810d4d3b1d837008ef6223bf69a987352786f294274cb9a404'
            'c597bee0bcbb59ed791651555a904e5f7e9d2e82f6c6986b6352e5fc38e5b557'
            '7d321e237f2861405e7cb752eb5602efb091bad28cd873ff65244ed09dcf8736'
            '7bb97271eb2dc5d1dcb95f9763f505970d234df17f1b8d79b467b9020257915a')
sha256sums_x86_64=('03867eb98d3c74d279cf724ee3f468ae36924c17a4ea7d524fa136d661548e16')
sha256sums_armv7h=('fdcd8735662e7fa7179ca325c87d0a975370c8d7b3b7fc5ada0bf09d6ca2fb1d')
sha256sums_aarch64=('a3c5a585f4ab79fea59551ae27ad38b46a3ea3465c9d996edf697a9505613788')

prepare() {
  if [[ $CARCH = armv7h ]] || [[ $CARCH = aarch64 ]]; then
    bsdtar -xf data.tar.xz
  fi
}

package() {
  install -d -m 755 "${pkgdir}/usr/lib/plexmediaserver"
  cp -dr --no-preserve='ownership' "${srcdir}/usr/lib/plexmediaserver" "${pkgdir}/usr/lib/"

  install -D -m 644 "${srcdir}/plexmediaserver.conf.d" "${pkgdir}/etc/conf.d/plexmediaserver"
  install -D -m 644 "${srcdir}/plexmediaserver.service" "${pkgdir}/usr/lib/systemd/system/plexmediaserver.service"
  install -D -m 644 "${srcdir}/plex.sysusers" "${pkgdir}/usr/lib/sysusers.d/plex.conf"
  install -D -m 644 "${srcdir}/plex.tmpfiles" "${pkgdir}/usr/lib/tmpfiles.d/plex.conf"

  install -D -m 644 "${srcdir}/terms.txt" "${pkgdir}/usr/share/licenses/${pkgname}/terms.txt"
}

# vim: ts=2 sw=2 et:
