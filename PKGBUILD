# Maintainer: Vaporeon <vaporeon@vaporeon.io>
# Contributor: shvr <tusklahoma at gmail dot com>
# Contributor: alucryd <alucryd at gmail dot com>
# Contributor: Infy <eugene dot yudin at gmail dot com>

pkgname=bin32-pcsxr-git
pkgver=r1662.fc378b6
pkgrel=2
pkgdesc="A Sony PlayStation emulator based on the PCSX-df Project (32-bit)"
arch=('x86_64')
url="http://pcsxr.codeplex.com/"
license=('GPL')
depends=('lib32-gtk3' 'lib32-sdl2' 'lib32-libcdio' 'lib32-libxv')
makedepends=('gcc-multilib' 'intltool' 'sdl2' 'lib32-mesa' 'git')
optdepends=('lib32-libpulse: Pulseaudio support')
provides=("pcsxr")
conflicts=("pcsxr" "pcsxr-git" 'pcsx-df')
replaces=("bin32-pcsxr-svn")
options=('!libtool')
source=("git+https://git01.codeplex.com/pcsxr")
sha256sums=('SKIP')

pkgver() {
  cd pcsxr
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd pcsxr/pcsxr
  
  CFLAGS="-m32 ${CFLAGS}"
  CXXFLAGS="-m32 ${CXXFLAGS}"
  export PKG_CONFIG_PATH="/usr/lib32/pkgconfig"

  ./autogen.sh --prefix='/usr' --libdir=/usr/lib32 \
      --enable-{libcdio,opengl} --enable-dynarec=x86
  make
}

package() {
  cd pcsxr/pcsxr

  make DESTDIR="${pkgdir}" install
}
