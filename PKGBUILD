# Contributor: Adam Griffiths <adam_griffithsAATTdart.net.au>
# Contributor: Todd Maynard <arch@toddmaynard.com>
# Many thanks to AlexExtreme <alex@alex-smith.me.uk> (Frugalware pkg maintainer) from which much of this was borrowed.
# Many thanks to Stefan for patch for x86_64 support and el.ini fix.
# Contributor: Angelo Theodorou <encelo@users.sourceforge.net>

pkgname=eternallands
pkgver=1.9.3
pkgrel=1
pkgdesc="A free 3D MMORPG game with thousands of on-line players"
arch=('i686' 'x86_64')
license=('custom')
url="http://www.eternal-lands.com/"
depends=('sdl_net' 'sdl_image' 'openal' 'cal3d' 'libxml2' 'libvorbis' 'libgl' 'mesa')
makedepends=('unzip' 'git')
options=('!emptydirs')
changelog=eternallands.changelog
source=('http://www.eternal-lands.com/el_linux_193.zip' 'eternallands.desktop')
md5sums=('a1d0c7c5983d7c33ee0edc7a4e4867d6' '4564fba195fc39fce438f717dde0ad9e')

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
  git checkout d151c3d12c5984b3a2a953153811bf9961573374

  # Compile the client...
  if [ "$CARCH" == "x86_64" ]; then
    sed -i "s|i686|x86-64|" make.defaults
    sed -i "s|OPTIONS = |OPTIONS = -DX86_64 |" Makefile.linux
  fi
  sed -i "s@OPTIONS = @OPTIONS = -DDATA_DIR="\\\\\"/usr/share/eternallands/"\\\\\" @g" Makefile.linux
  sed -i "s@^LDFLAGS=@LDFLAGS=-lstdc++ -lX11 @" Makefile.linux
  make -f Makefile.linux release
}

package() {
  cd "$srcdir"

  mkdir -p "${pkgdir}/usr/bin"
  mkdir -p "${pkgdir}/usr/share/licenses/eternallands/"
  mkdir -p "${pkgdir}/usr/share/applications"
  mkdir -p "${pkgdir}/usr/share/pixmaps"
  mkdir -p "${pkgdir}/usr/share/eternallands"
  
  install -m755 elc-build/el.x86.linux.bin "${pkgdir}/usr/bin/el"
  install -m644 elc-build/eternal_lands_license.txt "${pkgdir}/usr/share/licenses/eternallands/"
  install -m644 elc-build/elc.png "${pkgdir}/usr/share/pixmaps/eternallands.png"
  install -m644 eternallands.desktop "${pkgdir}/usr/share/applications"

  cd el_linux

  # Compress textures and maps
  find \( -name *.bmp -or -name *.elm \) -exec gzip {} \;

  for dir in 2dobjects 3dobjects actor_defs animations languages maps meshes particles shaders skeletons skybox textures; do
	cp -R ${dir} "${pkgdir}/usr/share/eternallands/"
  done
  
  for file in *.ini *.txt *.lst *.xml; do
    install -m644 ${file} "${pkgdir}/usr/share/eternallands/"
  done
}
