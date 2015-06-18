# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=conky-manager
pkgver=2.3.3
_ubuntu=~132~ubuntu15.04.1
pkgrel=2
pkgdesc="GUI for managing Conky config files with options to browse and edit themes"
url="https://launchpad.net/conky-manager"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick' 'json-glib' 'libgee06' 'libsoup' 'p7zip' 'rsync')
makedepends=('vala')
options=(!emptydirs)
install=conky-manager.install
source=(https://launchpad.net/~teejee2008/+archive/ubuntu/ppa/+files/${pkgname}_${pkgver}${_ubuntu}.tar.xz)
sha512sums=('b8470de6bf029911c7e4d610a8025c004831b88fb7dd15b4541161462b19987521b30a86c4e69305ae95527486ed6d08f491f31a82c8345c2d4e81a444292b94')

prepare() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  find . -type f -name '*.vala' -exec sed -ri 's/(\s|\()ListStore/\1Gtk.ListStore/g' {} \;
}

build() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  make
}

package() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  make DESTDIR="${pkgdir}" install

  # fix make install problems
  rm "${pkgdir}/usr/bin/conky-manager-uninstall"
  find "${pkgdir}/usr/share/${pkgname}" -type f -print0 | xargs -0 chmod 644
  chmod 644 "${pkgdir}/usr/share/applications/conky-manager.desktop" \
    "${pkgdir}/usr/share/pixmaps/conky-manager.png"
}

# vim: ts=2 sw=2 et:
