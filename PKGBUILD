# Maintainer: HurricanePootis <hurricanepootis@protonmail.com>
# Contributor: Michal Wojdyla < micwoj9292 at gmail dot com >
# Contributor: Michael DeGuzis <mdeguzis@gmail.com>
# Please note you must have a Vulkan-capable GPU

_quake=vkQuake
pkgname=vkquake
pkgver=1.35.0
pkgrel=1
pkgdesc="A modern Quake 1 engine. Forked from Fitzquake. This version contains Vulkan API support."
arch=('x86_64')
provides=('vkquake')
url="https://github.com/Novum/vkquake"
license=('GPL-2.0-or-later')
depends=('glibc' 'flac' 'mpg123' 'libvorbis' 'opusfile' 'sdl2' 'vulkan-icd-loader' 'hicolor-icon-theme' 'vulkan-driver')
makedepends=('vulkan-validation-layers' 'meson' 'vulkan-headers' 'glslang' 'spirv-tools')
install=$pkgname.install
source=("$pkgname-$pkgver.tar.gz::$url/archive/${pkgver}.tar.gz"
	'vkquake.desktop'
	'vkquake.png'
	'vkquake.svg'
	'ctype.patch')
sha512sums=('75b6b0be1e622ede8552db1a08b90ef29e904840e0badf7ec6af095cac185e4975f90318ec7f49348adf4408725c987a57519e9a0e7ef3b0db46350e8a147a72'
            '75881c2fea0628dcecff496a5e3035bbb4e408b81527737339ebfd66ad04ca04621d4e13e3e0537f091f8b1127dc231583f746d11cc6c11658cdb976db77e145'
            '9ac17fb2f549656869a02a9a1896786aa4a4f753c6b1174d14b999c94693164ec71a73f9ab6f4a96591ef3af407ffce4f29b0ed87e878f14bb177e396898f29f'
            '5a712a6c0447acea7a6c690cb7e63a2111e28646ef0935dfbd40cc4164c9ed5fc6fdba6eeafe44b618b17e856b3b0f60cc3ddbdedd8e536feef97de969d407b0'
            'f1f1535724c2838d1fc257eee9996029a2ed5a50f15488e852d17bb8d0dc9cdcc7a22cb88021f4e5489e74ea8be6b135d6767a2b7f01a7d3922151e3f79c9469')


prepare() {
  cd "$srcdir/$_quake-$pkgver"
  patch -Np1 < "$srcdir/ctype.patch"
}

build() {
  
  cd "$srcdir"

  arch-meson \
  build \
  "${_quake}-${pkgver}" \
  -D use_codec_mp3=enabled \
  -D use_codec_flac=enabled \
  -D use_codec_vorbis=enabled \
  -D use_codec_opus=enabled \
  -D vorbis_lib=vorbis \
  -D mp3_lib=mpg123 \
  -D do_userdirs=enabled

  # Compile vkquake binary
  meson compile -C build
}

package() {

  cd "$srcdir"

  # Install main binary
  install -Dm755 build/vkquake "$pkgdir"/usr/bin/vkquake

  # Make doc dir
  mkdir -p $pkgdir/usr/share/doc/vkquake/

  # supplemental files
  install -Dm644 "$srcdir/$pkgname.desktop" "$pkgdir/usr/share/applications/vkquake.desktop"
  install -Dm644 "$srcdir/$pkgname.png" "$pkgdir/usr/share/pixmaps/vkquake.png"
  install -Dm644 "$srcdir/$pkgname.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vkquake.svg"
  install -Dm644 "${_quake}-${pkgver}/readme.md" "$pkgdir"/usr/share/doc/vkquake/readme.md

}
