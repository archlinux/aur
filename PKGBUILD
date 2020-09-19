# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>
# Contributor: Todd Maynard <arch@toddmaynard.com>
# Many thanks to AlexExtreme <alex@alex-smith.me.uk> (Frugalware pkg maintainer) from which much of this was borrowed.
# Many thanks to Stefan for patch for x86_64 support and el.ini fix.
# Maintainer: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands
pkgver=1.9.5.8
pkgrel=3
pkgdesc="A free 3D MMORPG game with thousands of on-line players"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.eternal-lands.com/"
depends=('sdl2_net' 'sdl2_image' 'openal' 'cal3d' 'libvorbis' 'glu')
makedepends=('git' 'unzip' 'pkgconf')
optdepends=('zenity: to use the launch script' 'kdialog: to use the launch script')
options=('!emptydirs')
changelog=eternallands.changelog
source=("git://github.com/raduprv/Eternal-Lands.git#tag=${pkgver}" 'https://github.com/raduprv/Eternal-Lands/releases/download/1.9.5.7/el_195_p7_data_files.zip')
md5sums=('SKIP' 'c58b6f374d0f9ce3f0aa0fe4eab348d5')

build()
{
  cd ${srcdir}/Eternal-Lands

  sed -i "s|/usr/games/|/usr/bin/|" pkgfiles/eternallands
  sed -i "s|/usr/share/games/EternalLands/|/usr/share/eternallands/|" pkgfiles/eternallands
  sed -i "s|#data_dir = /usr/share/games/EternalLands|#data_dir = /usr/share/eternallands|" pkgfiles/eternallands
  sed -i "s|#data_dir = \\\/usr\\\/share\\\/games\\\/EternalLands|#data_dir = \\\/usr\\\/share\\\/eternallands|" pkgfiles/eternallands
  rm -f gen_git_version
  make -f Makefile.linux release
}

package() {
  cd ${srcdir}/Eternal-Lands

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man6"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/licenses/eternallands/"
  mkdir -p "${pkgdir}/usr/share/eternallands"

  install -m755 el.x86.linux.bin "${pkgdir}/usr/bin/"
  install -m755 pkgfiles/eternallands "${pkgdir}/usr/bin/"
  install -m644 pkgfiles/eternallands.6 "${pkgdir}/usr/share/man/man6"
  install -m644 pkgfiles/el.x86.linux.bin.6 "${pkgdir}/usr/share/man/man6"
  install -m644 pkgfiles/eternallands.png "${pkgdir}/usr/share/pixmaps/"
  install -m644 pkgfiles/eternallands.xpm "${pkgdir}/usr/share/pixmaps/"
  install -m644 pkgfiles/eternallands.desktop "${pkgdir}/usr/share/applications"
  install -m644 eternal_lands_license.txt "${pkgdir}/usr/share/licenses/eternallands/"

  cd ${srcdir}/el_data

  # Compress textures and maps
  find \( -name *.bmp -or -name *.elm \) -exec gzip -f {} \;

  for dir in 2dobjects 3dobjects actor_defs animations languages maps meshes particles shaders skeletons skybox textures; do
    cp -R ${dir} "${pkgdir}/usr/share/eternallands/"
  done

  sed -i "s|^#data_dir = \"c:\\\Program Files\\\Eternal Lands\\\\\"|#data_dir = /usr/share/eternallands|" el.ini
  sed -i "s|^#use_new_selection.*$|#use_new_selection = 1|g" el.ini

  for file in *.ini *.txt *.lst *.xml; do
    install -m644 ${file} "${pkgdir}/usr/share/eternallands/"
  done

  install -m644 ${srcdir}/Eternal-Lands/el.ini "${pkgdir}/usr/share/eternallands/"
}
