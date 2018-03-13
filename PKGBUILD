# Maintainer: Fredy García <frealgagu at gmail dot com>
# Contributor: schuay <jakob.gruber@gmail.com>
# Contributor: quantax -- contact via Arch Linux forum or AUR
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=pcsxr
pkgver=1.9.94
pkgrel=1
pkgdesc='A Sony PlayStation (PSX) emulator based on the PCSX-df project'
arch=('any')
url='http://pcsxr.codeplex.com'
license=('GPL')
depends=('ffmpeg' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk3' 'libarchive' 'libcdio' 'libgl' 'libpulse' 'libx11' 'libxext' 'libxtst' 'libxv' 'libxxf86vm' 'sdl2' 'zlib')
makedepends=('cmake' 'intltool' 'mesa' 'nasm')
provides=('pcsxr')
conflicts=('pcsxr' 'pcsx-df')

# Accessible through /srv/ftp/other/community on nymeria.
source=("http://ftp.debian.org/debian/pool/main/p/pcsxr/${pkgname}_${pkgver}.orig.tar.xz")
sha256sums=('8a366b68a7c236443aa75b422bea84b5115f8d8c23e5a78fd6951e643e90f660')

build() {
  cd "${srcdir}/${pkgname}"

  #zlib >= 1.2.11 has a new function that is called uncompress2 that conflicts with the one in cdriso.c line 916 and line 995
  sed -i "s/uncompress2/cdriso_uncompress2/g" libpcsxcore/cdriso.c
  
  autoreconf -f -i
  intltoolize --force

  ./configure \
    --prefix=/usr \
    --enable-libcdio \
    --enable-opengl
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}
