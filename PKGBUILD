# Maintainer: Jakob Gruber <jakob.gruber@gmail.com>
# Contributor: Daenyth <Daenyth+Arch AT gmail DOT com>

pkgname=dwarftherapist-hg
pkgver=571
pkgrel=2
pkgdesc="An extension application for the fantastic game Dwarf Fortress"
arch=('i686' 'x86_64')
url="http://code.google.com/p/dwarftherapist/"
license=('MIT')
depends=('qt4' 'icu')
makedepends=('mercurial')
conflicts=('dwarftherapist-svn')
replaces=('dwarftherapist-svn')
source=('fix_file_path.diff'
        'dwarftherapist.desktop')

_hgroot=https://dwarftherapist.googlecode.com/hg/
_hgrepo=dwarftherapist

build() {
  cd "$srcdir"
  msg "Connecting to Mercurial server...."

  if [[ -d "$_hgrepo" ]]; then
    cd "$_hgrepo"
    hg pull -u
    msg "The local files are updated."
  else
    hg clone "$_hgroot" "$_hgrepo"
  fi

  msg "Mercurial checkout done or server timeout"
  msg "Starting build..."

  rm -rf "${srcdir}/${_hgrepo}-build"
  cp -r "${srcdir}/${_hgrepo}" "${srcdir}/${_hgrepo}-build"
  cd "${srcdir}/${_hgrepo}-build"

  # Change to more suitable linux paths
  patch -Np0 < "${srcdir}/fix_file_path.diff"

  # pidof may not exist on systemd installations
  sed -i "/dwarfort.exe/d" src/dfinstancelinux.cpp
  sed -i "s/pidof/pgrep/g" src/dfinstancelinux.cpp

  # Build
  qmake-qt4 dwarftherapist.pro
  make
}
package() {
  cd "${srcdir}/${_hgrepo}-build"

  install -d "${pkgdir}/usr/share/dwarftherapist/memory_layouts/linux/"
  install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm755 bin/release/DwarfTherapist "${pkgdir}/usr/bin/dwarftherapist"
  install -Dm644 etc/game_data.ini \
    "${pkgdir}/usr/share/dwarftherapist/game_data.ini"
  install -Dm644 etc/memory_layouts/linux/*.ini \
    "${pkgdir}/usr/share/dwarftherapist/memory_layouts/linux/"
  # install -Dm644 "${srcdir}"/*.ini \
  #   "${pkgdir}/usr/share/dwarftherapist/memory_layouts/linux/"

  install -Dm644 "${srcdir}"/dwarftherapist.desktop \
    "${pkgdir}"/usr/share/applications/dwarftherapist.desktop
  install -Dm644 img/hammer.png \
    "${pkgdir}"/usr/share/icons/hicolor/128x128/apps/dwarftherapist.png
}

# vim:set ts=2 sw=2 et:
md5sums=('e5109f6cadbd19865f72a8ad86279d92'
         '32c80fd6e3b86900c1677b4e2859b07b')
