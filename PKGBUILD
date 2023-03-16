# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.30.1
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('x86_64')
provides=('vkquake')
url="https://github.com/Novum/vkquake"
license=('GPL2')
depends=('flac' 'libmad'
	 'libvorbis' 'opusfile' 'sdl2')
makedepends=('vulkan-validation-layers' 'meson' 'vulkan-headers' 'glslang' 'spirv-tools')
install=$pkgname.install
source=("https://github.com/Novum/vkQuake/archive/${pkgver}.tar.gz"
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg')
sha512sums=('e29a469e6c923e899e142860e27e343eafd54f02dfb5842f081aadb077f97187d5aa092dcb98352b76f13dbc18d88a3afabf2e21799a305fe536c35fb6d68bbd'
            '75881c2fea0628dcecff496a5e3035bbb4e408b81527737339ebfd66ad04ca04621d4e13e3e0537f091f8b1127dc231583f746d11cc6c11658cdb976db77e145'
            '9ac17fb2f549656869a02a9a1896786aa4a4f753c6b1174d14b999c94693164ec71a73f9ab6f4a96591ef3af407ffce4f29b0ed87e878f14bb177e396898f29f'
            '5a712a6c0447acea7a6c690cb7e63a2111e28646ef0935dfbd40cc4164c9ed5fc6fdba6eeafe44b618b17e856b3b0f60cc3ddbdedd8e536feef97de969d407b0')


build() {
  
  cd "$srcdir/$_quake-$pkgver"
  [[ -d build ]] && rm -rf build
  mkdir build && cd build

  export CFLAGS="$CFLAGS -DDO_USERDIRS=1"
  export CXXFLAGS="$CXXFLAGS -DDO_USERDIRS=1"
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
}

package() {

  cd "$srcdir/$_quake-$pkgver"

  # Install main binary
  install -Dm755 build/vkquake "$pkgdir"/usr/bin/vkquake

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake/
  mkdir -p $pkgdir/usr/share/games/vkquake/

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/vkquake.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/vkquake.png"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/vkquake.svg"
  install -Dm644 readme.md "$pkgdir"/usr/share/doc/vkquake/readme.md

}
