# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=rlvm
pkgver=0.14
pkgrel=5
pkgdesc="RealLive clone for Linux and OSX"
arch=('x86_64')
url="https://github.com/eglaysher/rlvm"
license=('GPL')
depends=('boost-libs>=1.46' 'glew' 'libmad' 'libogg' 'libvorbis' 'libpng'
         'sdl_mixer' 'sdl_image' 'sdl_ttf' 'guichan' 'gtk2')
makedepends=('scons' 'boost')
source=("https://github.com/eglaysher/rlvm/archive/release-$pkgver.tar.gz"
        "https://github.com/eglaysher/rlvm/commit/373a3db1c4d3c9a4b9eb60b8bca60fa58d1687f9.patch"
        "https://github.com/eglaysher/rlvm/commit/668863d2222b962ee8e7d9829e972ef05c990302.patch"
        "https://github.com/eglaysher/rlvm/commit/fb627bad9129080d2070845bcebe0d7eed9a5243.patch"
        "https://github.com/eglaysher/rlvm/commit/97c808194c56ba58cabdc4730270797909b7652d.patch"
        "https://github.com/eglaysher/rlvm/commit/573f47fc9ddf58fdd7f4cedcec4997673e812be8.patch"
        "memory.patch")
sha256sums=('6d1717540b8db8aca1480ebafae3354b24e3122a77dd2ee81f4b964c7b10dcc0'
            '00101444e8d5dc7e7bcadf0469ef98281394d3d72dca0ef00a4be084b1eb3028'
            '84e97116bdb5f78bf81fdcaa4602978671e6c6e672002577eeeaaf1eeeb07dee'
            'a949dc649fac6cdff44ddf7f76480de82035b979b4bf8d959ae07ab648c5589d'
            '8d2e8acf8bcb1f8fd5c78373dbea29036ccee1947a31ea99ae92af72b8ca84fd'
            '388f9113f229863e679c000dd5820d35f0e9de52de38a1aa041794493d7ebc3c'
            '05b4c17fe4132b3877b53ba34076c4f21b0982d40ec134400697a51f7ea52226')

prepare() {
  cd "$srcdir/$pkgname-release-$pkgver"

  patch -Np1 -i "$srcdir/373a3db1c4d3c9a4b9eb60b8bca60fa58d1687f9.patch"
  patch -Np1 -i "$srcdir/668863d2222b962ee8e7d9829e972ef05c990302.patch"
  patch -Np1 -i "$srcdir/fb627bad9129080d2070845bcebe0d7eed9a5243.patch"
  patch -Np1 -i "$srcdir/97c808194c56ba58cabdc4730270797909b7652d.patch"
  patch -Np1 -i "$srcdir/573f47fc9ddf58fdd7f4cedcec4997673e812be8.patch"
  patch -Np1 -i "$srcdir/memory.patch"
}

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  scons --release
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"

  install -Dm755 build/release/rlvm "$pkgdir/usr/bin/rlvm"
  install -Dm644 src/platforms/gtk/rlvm.desktop "$pkgdir/usr/share/applications/rlvm.desktop"

  local _i
  for _i in 16 24 32 48 128 256; do
    install -Dm644 "resources/$_i/rlvm.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/rlvm.png"
  done
}
