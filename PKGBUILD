# Contributor: Simon Bachmann <simonbachmann@freesurf.ch>
# Contributor: Anton Larionov <diffident dot cat at gmail dot com>
# Contributor: https://bbs.archlinux.org/viewtopic.php?pid=1625279
# Maintainer: SanskritFritz (gmail)

pkgname=mirrormagic
pkgver=2.0.2
pkgrel=5
pkgdesc="Arcade style game like Deflektor (C64) or Mindbender (Amiga)."
arch=('i686' 'x86_64')
url="http://www.artsoft.org/mirrormagic/"
license=('GPL2')
depends=('sdl_image' 'sdl_mixer')

source=("http://www.artsoft.org/RELEASES/unix/mirrormagic/${pkgname}-${pkgver}.tar.gz"
        "mirrormagic.desktop"
        "mirrormagic-2.0.2-64bit.patch"
        "mirrormagic-2.0.2-editor.patch"
        "mirrormagic-2.0.2-gcc5.patch"
        "mirrormagic-2.0.2-gcc41.patch"
        "mirrormagic-2.0.2-parallel.patch")

md5sums=('32fd3909c1e27f493d89bc2276da6744'
         '64ebdbe659a2fd5efd3979350cf9bbec'
         'b3d5df027271f0c6ae6889343de75dfb'
         '7aedb179764532d2c51d3c034668c189'
         '5cf97ba0dcb81f5431d96a7f0464163a'
         '103c7e4bc30e0a38c1ed1bb1aa79f9a9'
         '32c300be135c848e1f33deefadb74bf2')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  # apply patches from gentoo
  # http://mirror.qubenet.net/mirror/gentoo-portage/games-puzzle/mirrormagic/files/
  patch -p0 < "${srcdir}/mirrormagic-2.0.2-64bit.patch"
  patch -p1 < "${srcdir}/mirrormagic-2.0.2-editor.patch"
  patch -p1 < "${srcdir}/mirrormagic-2.0.2-gcc5.patch"
  patch -p0 < "${srcdir}/mirrormagic-2.0.2-gcc41.patch"
  patch -p0 < "${srcdir}/mirrormagic-2.0.2-parallel.patch"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make RO_GAME_DIR="/usr/share/${pkgname}" RW_GAME_DIR=~/.${pkgname} sdl
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  # copy main files
  install -dm755 "${pkgdir}/usr/share/${pkgname}"
  cp -r graphics levels music scores sounds "${pkgdir}/usr/share/${pkgname}"

  # copy documentation
  install -dm755 "${pkgdir}/usr/share/doc/${pkgname}"
  install -m644 CHANGES CREDITS INSTALL README TODO "${pkgdir}/usr/share/doc/${pkgname}"

  # install exec-file
  install -D -m755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

  # install desktop entry file
  install -D -m644 "${srcdir}/${pkgname}.desktop" "${pkgdir}/usr/share/applications/${pkgname}.desktop"

  # fix permissions
  cd "${pkgdir}/usr/share/${pkgname}/"
  find . -type f -exec chmod 644 {} \;
}

# vim:set ts=2 sw=2 et:
