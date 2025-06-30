# Maintainer: envolution
# Contributor: Thomas "Ventto" Venriès <thomas.venries@gmail.com>
# shellcheck shell=bash disable=SC2034,SC2154
pkgname=pug
pkgver=1.3
pkgrel=3
pkgdesc='synchronize Pacman and AUR installed package lists into Gists.'
arch=('x86_64' 'i686')
license=('LicenseRef-NoLicense')
depends=('pacman' 'gist>=4.5.0')
makedepends=('make' 'git')
url="https://github.com/Ventto/${pkgname}"
source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
  disable_interaction_on_hook.patch
)
sha256sums=('eb70f1c95defd8d5862e891b345db9da81ce90600a6bca17cce5fbea384a0b71'
            '7be1ab2c7701f1cf41b6385e79946cfd12401c91cbfcdd5b826fbf41e8117f8a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  #The following are changes to stop 'pug' from adding user interaction at install/system updates
  sed -i '\|@sh $(BINDIR)|d' Makefile
  sed -i '/^BINDIR/ s|opt/pug|usr/bin|' Makefile
  sed -i 's|^Exec = /opt/pug/pug.sh$|Exec = /usr/bin/pug.sh --from-hook|' src/pug.hook
  patch -Np1 -i ../disable_interaction_on_hook.patch
}
package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}
# vim:set ts=2 sw=2 et:
