# Maintainer: Vaporeon <vaporeon@tfwno.gf>
# Contributor: shvr <tusklahoma at gmail dot com>
# Contributor: alucryd <alucryd at gmail dot com>
# Contributor: Infy <eugene dot yudin at gmail dot com>

_pkgname=pcsxr
pkgname=bin32-pcsxr-svn
pkgver=1.9.93.r97860
pkgrel=1
pkgdesc="A Sony PlayStation emulator based on the PCSX-df Project (32-bit)"
arch=('x86_64')
url="http://pcsxr.codeplex.com/"
license=('GPL')
depends=('lib32-gtk3' 'lib32-sdl2' 'lib32-libcdio' 'lib32-libxv')
makedepends=('gcc-multilib' 'intltool' 'sdl2' 'lib32-mesa' 'subversion')
optdepends=('lib32-libpulse: Pulseaudio support')
provides=("$_pkgname")
conflicts=("$_pkgname", "${_pkgname%-*}" 'pcsx-df')
options=('!libtool')
source=("$_pkgname::svn+https://pcsxr.svn.codeplex.com/svn/pcsxr")
sha256sums=('SKIP')

pkgver() {
  cd $_pkgname

  printf "1.9.93.r%s" "$(svnversion)"
}

build() {
  cd $_pkgname
  
  CFLAGS="-m32 ${CFLAGS}"
  CXXFLAGS="-m32 ${CXXFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh --prefix='/usr' --libdir=/usr/lib32 \
      --enable-{libcdio,opengl} --enable-dynarec=x86
  make
}

package() {
  cd $_pkgname

  make DESTDIR="${pkgdir}" install
}
