# Maintainer: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Josip Ponjavic <josipponjavic at gmail dot com>

pkgname=conky-manager
pkgver=2.3.4
_ubuntu=~134~ubuntu15.10.1
pkgrel=2
pkgdesc="GUI for managing Conky config files with options to browse and edit themes"
url="https://launchpad.net/conky-manager"
arch=('i686' 'x86_64')
license=('GPL3')
depends=('cairo' 'conky' 'desktop-file-utils' 'gtk3' 'imagemagick' 'json-glib' 'libgee' 'p7zip' 'rsync')
makedepends=('vala')
options=('!emptydirs')
install=conky-manager.install
source=(${pkgname}_${pkgver}.tar.xz::https://launchpad.net/~teejee2008/+archive/ubuntu/ppa/+files/${pkgname}_${pkgver}${_ubuntu}.tar.xz)
sha512sums=('c230ff9f1ef952a7534918a6f9934baf557003fbcc98936a814214e4bb75e63617ad4c65f8c4f432eff2bcf22342f70bc0702134f58ca847ec0c7fb3253651d5')

prepare() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  sed '/-uninstall/d' -i src/makefile
  sed -r 's|0755 (\$\{app_name\}.desktop)|644 \1|g' -i src/makefile
  sed -r 's|0755 (share/pixmaps/\$\{app_name\}.png)|644 \1|g' -i src/makefile
  sed -r 's|0755 (\$\{app_name\}.appdata.xml)|644 \1|g' -i src/makefile
  sed -r 's|(recursive) 0755|\1 644|g' -i src/makefile
  sed -r "s|(.*chmod --recursive.*)|\\1\n\tfind \$(DESTDIR)\$(sharedir)/\${app_name} -type d -exec chmod +x '{}' +|g" -i src/makefile
  sed 's|-X -Wl,-rpath,/usr/share/${app_name}/libs||g' -i src/makefile
}

build() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  make
}

package() {
  cd ${pkgname}-${pkgver}${_ubuntu}
  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
