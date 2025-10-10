# Maintainer: Lili1228 <aur at lili dot lgbt>
# Maintainer: Fabio Cavallo (FHorse) <punes.development@gmail.com>
# Contributor: Boris Timofeev <mashin87@gmail.com>
pkgname=punes
pkgver=0.111
pkgrel=3
pkgdesc="Nintendo Entertaiment System emulator"
arch=('i686' 'x86_64' 'aarch64')
url="https://github.com/punesemu/puNES"
license=('GPL-2.0-or-later')
depends=('alsa-lib' 'ffmpeg' 'hicolor-icon-theme' 'nvidia-cg-toolkit' 'libxrandr' 'qt5-base' 'qt5-svg' # explicit
'gcc-libs' 'glibc' 'libglvnd' 'libx11' 'libudev.so') # implicit
makedepends=('cmake>=3.15' 'glu' 'qt5-tools')
source=(
  "puNES-${pkgver}.tar.gz"::"https://github.com/punesemu/puNES/archive/v$pkgver.tar.gz"
  49f86fcf0fab37d4761b713b0a9e7dc342b8f594.patch
)
sha512sums=(
  6388cdf2b303e217adfe43b1b3b1ef66a75b6adfdb0363b213c47fc129b5815f3e96814ee25a3637147dc184203cef0438930c280f0c6249085ecac1220b435c
  fcaa3d325de2f075fa03a0f7a8c8f6f10a1c84b933a477cf55f0ca96ec18e8aae7deb52baf4279de748a5164c84530cdfcbf73915515f9293da69f0178c24324
)

# AUR 0.108-1 says lib7zip breaks with buildflags, but I can't find any proof, it builds and loads zips
#options=('!buildflags')
prepare() {
  cd "${srcdir}/puNES-${pkgver}"
  patch -p1 -i ../49f86fcf0fab37d4761b713b0a9e7dc342b8f594.patch
  sed -i 's/FF_PROFILE_H264_HIGH/AV_PROFILE_H264_HIGH/g' src/core/recording.c
}

build() {
  cmake -S"puNES-${pkgver}" -Bbuild -DCMAKE_INSTALL_PREFIX=/usr -DENABLE_OPENGL_CG=on -DDISABLE_PORTABLE_MODE=on #-DENABLE_QT6_LIBS=on
  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --build "${srcdir}/build" --target install
}

# vim:set ts=2 sw=2 et:
