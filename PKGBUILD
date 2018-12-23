# Maintainer: Kostis Karantias <kkarantias [at] gmail [dot] com>
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
pkgver=0.3.10
pkgrel=4
pkgdesc="Stream movies and TV shows from torrents (stable builds)"
arch=('x86_64')
url="https://popcorntime.sh"
license=('GPL3')
depends=('nss' 'ttf-font' 'libxss' 'gtk3' 'nodejs')
provides=('popcorntime' 'popcorn-time-ce' 'popcorntime-ci-bin' 'popcorntime-stable-bin')
conflicts=('popcorntime')
options=('!strip')
source=("${_pkgname}.desktop" "https://get.popcorntime.sh/build/Popcorn-Time-${pkgver}-Linux-64.tar.xz")
sha512sums=('7e6538a7b39465439a62cb089510b6d85a65ad4bfa74d21b692363d1176ee94165ab7b5fef5f3470bf821cfc9f3b3a23763b8e3d8530420d7fa97c66083c3adb'
            '0fe3c1be064231134eacfb0be74266361ba5d521f0cda2848cad5357fe03d6603284e80ed3bdacdf0a012b415949b9603ff3dcf95b03693e2f7704d500ee9516')

package() {
  install -dm755 "${pkgdir}/usr/share/${_pkgname}"
  install -dm755 "${pkgdir}/usr/bin"

  # Link to program
  ln -s "/usr/share/${_pkgname}/Popcorn-Time" "${pkgdir}/usr/bin/${_pkgname}"

  # Desktop file
  install -Dm644 "${_pkgname}.desktop" "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

  # Icon
  install -Dm644 "${srcdir}/src/app/images/icon.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/${_pkgname}.png"

  # Remove makepkg-created symlinks before copying content
  rm *.tar.xz *.desktop

  # Move library files to /usr/lib/popcorntime
  install -d "${pkgdir}/usr/lib/${_pkgname}/${pkgver}"
  mv "${srcdir}"/lib/* "${pkgdir}/usr/lib/${_pkgname}/${pkgver}"
  rmdir "${srcdir}"/lib/
  install -d "${pkgdir}/etc/ld.so.conf.d"
  echo "/usr/lib/${_pkgname}/${pkgver}" > "${pkgdir}/etc/ld.so.conf.d/${_pkgname}.conf"

  # Copy complete content of source archive to /usr/share/${_pkgname}/
  cp -a "${srcdir}"/* "${pkgdir}/usr/share/${_pkgname}/"

  # Fix permissions
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 600 -exec chmod 644 '{}' \;
  find "${pkgdir}/usr/share/${_pkgname}/" -perm 700 -exec chmod 755 '{}' \;
}
