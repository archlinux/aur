# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>
# Contributor: Todd Maynard <arch@toddmaynard.com>
# Many thanks to AlexExtreme <alex@alex-smith.me.uk> (Frugalware pkg maintainer) from which much of this was borrowed.
# Many thanks to Stefan for patch for x86_64 support and el.ini fix.
# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands
pkgver=1.9.6.0
_version=${pkgver}-1
_dataversion=${pkgver}
pkgrel=1
pkgdesc="A free 3D MMORPG game with thousands of on-line players"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.eternal-lands.com/"
depends=('sdl2_net' 'sdl2_image' 'sdl2_ttf' 'openal' 'cal3d' 'libvorbis' 'glu' 'openssl')
makedepends=('unzip' 'cmake')
optdepends=('zenity: to use the launch script' 'kdialog: to use the launch script')
options=('!emptydirs')
changelog=eternallands.changelog
source=("https://github.com/raduprv/Eternal-Lands/archive/refs/tags/${_version}.tar.gz" "https://github.com/raduprv/Eternal-Lands/releases/download/${_dataversion}/eternallands-data_${_dataversion}.zip")
md5sums=('0330e98eaddf616cc1eb7c9f2d21a86e' '6b8dcee000b150d7c1d84ca17f5cbae4')

build()
{
  cd ${srcdir}/Eternal-Lands-${_version}

  sed -i "s|/usr/games/|/usr/bin/|" pkgfiles/eternallands
  sed -i "s|/usr/share/games/EternalLands/|/usr/share/eternallands/|" pkgfiles/eternallands
  sed -i "s|#data_dir = /usr/share/games/EternalLands|#data_dir = /usr/share/eternallands|" pkgfiles/eternallands
  sed -i "s|#data_dir = \\\/usr\\\/share\\\/games\\\/EternalLands|#data_dir = \\\/usr\\\/share\\\/eternallands|" pkgfiles/eternallands
  cmake -B build -D CMAKE_BUILD_TYPE=Release -D CMAKE_INSTALL_PREFIX=${pkgdir}/usr/ -D LOCAL_NLOHMANN_JSON=On
  make -C build
}

package() {
  cd ${srcdir}/Eternal-Lands-${_version}/build
  make install

  cd ${srcdir}/Eternal-Lands-${_version}
  mkdir -p "${pkgdir}/usr/share/man/man6"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/licenses/eternallands/"
  mkdir -p "${pkgdir}/usr/share/eternallands"

  install -m755 pkgfiles/eternallands "${pkgdir}/usr/bin/"
  install -m644 pkgfiles/eternallands.6 "${pkgdir}/usr/share/man/man6"
  install -m644 pkgfiles/el.linux.bin.6 "${pkgdir}/usr/share/man/man6"
  install -m644 pkgfiles/eternallands.png "${pkgdir}/usr/share/pixmaps/"
  install -m644 pkgfiles/eternallands.xpm "${pkgdir}/usr/share/pixmaps/"
  install -m644 pkgfiles/eternallands.desktop "${pkgdir}/usr/share/applications"
  install -m644 eternal_lands_license.txt "${pkgdir}/usr/share/licenses/eternallands/"

  cd ${srcdir}/el_data

  # Compress textures and maps
  find \( -name *.bmp -or -name *.elm \) -exec gzip -f {} \;

  for dir in 2dobjects 3dobjects actor_defs animations fonts languages maps meshes particles shaders skeletons skybox textures; do
    cp -R ${dir} "${pkgdir}/usr/share/eternallands/"
  done

  sed -i "s|^#data_dir = \"c:\\\Program Files\\\Eternal Lands\\\\\"|#data_dir = /usr/share/eternallands|" el.ini

  for file in *.ini *.json *.lst *.menu *.txt *.xml; do
    install -m644 ${file} "${pkgdir}/usr/share/eternallands/"
  done
}
