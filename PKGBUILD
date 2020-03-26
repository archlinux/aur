# Maintainer: Stephan Springer <buzo+arch@Lini.de>
# Contributor: Kostis Karantias <kkarantias [at] gmail [dot] com>
# Contributor: Pieter Goetschalckx <3.14.e.ter [at] gmail [dot] com>
# Contributor: Bastien Traverse <firstname at lastname dot email>
# Contributor: Ricardo Funke <ricardo [at] gmail [dot] com>
# Contributor: Attila Bukor <r1pp3rj4ck [at] w4it [dot] eu>
# Contributor: Iwan Timmer <irtimmer [at] gmail [dot] com>
# Contributor: Eric Engestrom <aur [at] engestrom [dot] ch>
# Contributor: Ricardo Band <me [at] xengi [dot] de>
# Contributor: Axilleas Pipinellis (aka axil42) <axilleas [at] archlinux [dot] info>
# Contributor: UshakovVasilii <UshakovVasilii [at] yahoo [dot] com>
# Contributor: Giulio Fidente <gfidente [at] gmail [dot] com>
# Contributor: xantares <xantares09 [at] hotmail [dot] com>
# Contributor: petterk <stifler3k [at] hotmail [dot] com>

pkgname=popcorntime-bin
_pkgname=popcorntime
pkgver=0.4.1
pkgrel=1
pkgdesc="Stream free movies and TV shows from torrents"
arch=('x86_64')
url="https://popcorntime.app/"
license=('GPL3')
depends=('nss' 'ttf-font' 'libxss' 'gconf' 'gtk2' 'gtk3')
makedepends=('unzip')
provides=('popcorntime' 'popcorn-time-ce' 'popcorntime-ci-bin' 'popcorntime-stable-bin')
conflicts=('popcorntime')
options=('!strip')
_zipfile="Popcorn-Time-${pkgver}-linux64.zip"
source=("https://get.popcorntime.app/build/$_zipfile"
        "${_pkgname}.desktop" )
sha256sums=('e167c42ffa49d5bf9f530ad998275dbcf38195bd0b10a121922d91dd528d546c'
            '4422f21e16176fda697ed0c8a6d1fb6f9dd7c4bc3f3694f9bcc19cbe66630334')

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Link to program
  ln -s "../share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Remove makepkg-created symlinks before copying content
  rm "$_zipfile" "${_pkgname}.desktop"

  # Move library files to /usr/lib/popcorntime
  install -d "${pkgdir}/usr/lib/${_pkgname}/${pkgver}"
  mv "${srcdir}"/lib/* "${pkgdir}/usr/lib/${_pkgname}/${pkgver}"
  rmdir "${srcdir}"/lib

  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}/${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"

  # Copy complete content of source archive to /usr/share/${_pkgname}/
  cp -a "${srcdir}"/* "${pkgdir}/usr/share/${_pkgname}/"

  # Fix permissions
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 600 -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 700 -exec chmod 755 '{}' \;
}
