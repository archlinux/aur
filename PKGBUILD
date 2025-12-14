# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.33.0
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('x86_64')
provides=('vkquake')
url="https://github.com/Novum/vkquake"
license=('GPL-2.0-or-later')
depends=('glibc' 'flac' 'mpg123' 'libvorbis' 'opusfile' 'sdl2' 'vulkan-icd-loader' 'hicolor-icon-theme' 'vulkan-driver')
makedepends=('vulkan-validation-layers' 'meson' 'vulkan-headers' 'glslang' 'spirv-tools')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::https://github.com/Novum/vkQuake/archive/${pkgver}.tar.gz"
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg'
	'ctype.patch')
sha512sums=('36355e03d419c3e99a038b1a20c3f2172f16037aa0ca38a7af2d14f34d599fe2953ea0ac068274685bcdc24c918f723292c3f75c6ff4b9eb422354f1b8455606'
            '75881c2fea0628dcecff496a5e3035bbb4e408b81527737339ebfd66ad04ca04621d4e13e3e0537f091f8b1127dc231583f746d11cc6c11658cdb976db77e145'
            '9ac17fb2f549656869a02a9a1896786aa4a4f753c6b1174d14b999c94693164ec71a73f9ab6f4a96591ef3af407ffce4f29b0ed87e878f14bb177e396898f29f'
            '5a712a6c0447acea7a6c690cb7e63a2111e28646ef0935dfbd40cc4164c9ed5fc6fdba6eeafe44b618b17e856b3b0f60cc3ddbdedd8e536feef97de969d407b0'
            'f1f1535724c2838d1fc257eee9996029a2ed5a50f15488e852d17bb8d0dc9cdcc7a22cb88021f4e5489e74ea8be6b135d6767a2b7f01a7d3922151e3f79c9469')


prepare() {
  cd "$srcdir/$_quake-$pkgver"
  patch -p1 < "$srcdir/ctype.patch"
}

build() {
  
  cd "$srcdir/$_quake-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  CFLAGS="$CFLAGS -DDO_USERDIRS=1"
  CXXFLAGS="$CXXFLAGS -DDO_USERDIRS=1"
  arch-meson \
  -D use_codec_mp3=enabled \
  -D use_codec_flac=enabled \
  -D use_codec_vorbis=enabled \
  -D use_codec_opus=enabled \
  -D vorbis_lib=vorbis \
  -D mp3_lib=mpg123

  # Compile vkquake binary
  ninja
}

package() {

  cd "$srcdir/$_quake-$pkgver"

  # Install main binary
  install -Dm755 build/vkquake "$pkgdir"/usr/bin/vkquake

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake/

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/vkquake.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/vkquake.png"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vkquake.svg"
  install -Dm644 readme.md "$pkgdir"/usr/share/doc/vkquake/readme.md

}
