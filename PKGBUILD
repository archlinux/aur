# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>
# Contributor: Todd Maynard <arch@toddmaynard.com>
# Many thanks to AlexExtreme <alex@alex-smith.me.uk> (Frugalware pkg maintainer) from which much of this was borrowed.
# Many thanks to Stefan for patch for x86_64 support and el.ini fix.
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands
pkgver=1.9.4
pkgrel=1
pkgdesc="A free 3D MMORPG game with thousands of on-line players"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.eternal-lands.com/"
depends=('sdl_net' 'sdl_image' 'openal' 'cal3d' 'libxml2' 'libvorbis' 'glu')
makedepends=('gzip' 'git')
optdepends=('zenity: to use the launch script')
options=('!emptydirs')
changelog=eternallands.changelog
source=('http://www.eternal-lands.com/el_linux_installer_194.sh')
md5sums=('46962fe07907fd5ebcd030d4ebebbacd')

build()
{
  # Local to the function to avoid version bumping
  _gitroot="git://github.com/raduprv/Eternal-Lands.git"
  _gitname="elc"

  cd "$srcdir"
  msg "Connecting to GIT server...."

  if [ -d $_gitname ] ; then
    cd $_gitname && git pull $_gitroot
    msg "The local files are updated."
  else
    git clone $_gitroot $_gitname
  fi

  msg "GIT checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_gitname-build"
  git clone "$srcdir/$_gitname" "$srcdir/$_gitname-build"
  cd "$srcdir/$_gitname-build"
  git checkout 1.9.4.1

  make -f Makefile.linux gen_git_version
  sed -i "s|#data_dir = \"c:\\\Program Files\\\Eternal Lands\\\\\"|#data_dir = /usr/share/eternallands|" el.ini 
  sed -i "s|/usr/games/|/usr/bin/|" pkgfiles/eternallands
  sed -i "s|/usr/share/games/EternalLands/|/usr/share/eternallands/|" pkgfiles/eternallands
  sed -i "s|#data_dir = /usr/share/games/EternalLands|#data_dir = /usr/share/eternallands|" pkgfiles/eternallands
  sed -i "s|#data_dir = \\\/usr\\\/share\\\/games\\\/EternalLands|#data_dir = \\\/usr\\\/share\\\/eternallands|" pkgfiles/eternallands
  make -f Makefile.linux release
}

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/man/man6"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/licenses/eternallands/"
  mkdir -p "${pkgdir}/usr/share/eternallands"
  
  install -m755 elc-build/el.x86.linux.bin "${pkgdir}/usr/bin/"
  install -m755 elc-build/pkgfiles/eternallands "${pkgdir}/usr/bin/"
  install -m644 elc-build/pkgfiles/eternallands.6 "${pkgdir}/usr/share/man/man6"
  install -m644 elc-build/pkgfiles/el.x86.linux.bin.6 "${pkgdir}/usr/share/man/man6"
  install -m644 elc-build/pkgfiles/eternallands.png "${pkgdir}/usr/share/pixmaps/"
  install -m644 elc-build/pkgfiles/eternallands.xpm "${pkgdir}/usr/share/pixmaps/"
  install -m644 elc-build/pkgfiles/eternallands.desktop "${pkgdir}/usr/share/applications"
  install -m644 elc-build/eternal_lands_license.txt "${pkgdir}/usr/share/licenses/eternallands/"

  sh el_linux_installer_194.sh --noexec --target el_linux_installer_194
  cd el_linux_installer_194
  mkdir -p subarch_uncompressed && tar --lzma -xvpf subarch -C subarch_uncompressed
  cd subarch_uncompressed
  mkdir -p instarchive_uncompressed && tar --lzma -xvpf instarchive_all -C instarchive_uncompressed
  cd instarchive_uncompressed

  # Compress textures and maps
  find \( -name *.bmp -or -name *.elm \) -exec gzip -f {} \;

  for dir in 2dobjects 3dobjects actor_defs animations languages maps meshes particles shaders skeletons skybox textures; do
	cp -R ${dir} "${pkgdir}/usr/share/eternallands/"
  done
  
  for file in *.ini *.txt *.lst *.xml; do
    install -m644 ${file} "${pkgdir}/usr/share/eternallands/"
  done

  install -m644 ${srcdir}/elc-build/el.ini "${pkgdir}/usr/share/eternallands/"
}
