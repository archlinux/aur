# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.22.1
pkgrel=2
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('x86_64')
provides=('vkquake')
url="https://github.com/Novum/vkquake"
license=('GPL2')
depends=('flac' 'glibc' 'libgl' 'libmad' 'libmikmod' 
	 'libvorbis' 'libx11' 'opusfile' 'sdl2')
makedepends=('vulkan-validation-layers' 'meson' 'vulkan-headers' 'zopfli' 'glslang' 'spirv-tools' 'git')
install=$pkgname.install
source=("https://github.com/Novum/vkQuake/archive/${pkgver}.tar.gz"
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg')
sha512sums=('a410425d68f7cbbd65dda66d2c387bbb4d8659fb37f1942b9ba1d77a9e6a001c4845496b93c8ad3817deb0c77e5302a4cbf6d24cdb591b4fc5db84ada1069fea'
            '75881c2fea0628dcecff496a5e3035bbb4e408b81527737339ebfd66ad04ca04621d4e13e3e0537f091f8b1127dc231583f746d11cc6c11658cdb976db77e145'
            '9ac17fb2f549656869a02a9a1896786aa4a4f753c6b1174d14b999c94693164ec71a73f9ab6f4a96591ef3af407ffce4f29b0ed87e878f14bb177e396898f29f'
            '5a712a6c0447acea7a6c690cb7e63a2111e28646ef0935dfbd40cc4164c9ed5fc6fdba6eeafe44b618b17e856b3b0f60cc3ddbdedd8e536feef97de969d407b0')


build() {
  
  cd "$srcdir/$_quake-$pkgver"
  if [[ -d build ]]
  then
    rm -rf build
  fi
  mkdir build && cd build

  meson setup ../ \
  --prefix /usr \
  --libexecdir lib \
  --sbindir bin \
  --buildtype plain \
  --auto-features enabled \
  --wrap-mode nodownload \
  -D use_codec_mp3=enabled \
  -D use_codec_flac=enabled \
  -D use_codec_vorbis=enabled \
  -D use_codec_opus=enabled \
  -D vorbis_lib=vorbis \
  -D mp3_lib=mad

  # Compile vkquake binary
  ninja

  # Package vkquake.pak
  cd "$srcdir/$_quake-$pkgver/Misc/vq_pak"
  make

}

package() {

  cd "$srcdir/$_quake-$pkgver"

  # Install main binary
  install -Dm755 build/vkquake "$pkgdir"/usr/bin/vkquake

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake/
  mkdir -p $pkgdir/usr/share/games/vkquake/

  # pak files
  install -Dm644 "$srcdir/$_quake-$pkgver/Misc/vq_pak/vkquake.pak" "$pkgdir/usr/share/games/vkquake/vkquake.pak" 

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/vkquake.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/vkquake.png"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/vkquake.svg"
  install -Dm644 readme.md "$pkgdir"/usr/share/doc/vkquake/readme.md

}
