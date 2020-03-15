# Maintainer: neeshy <neeshy@tfwno.gf>
# Contributor: Jon Bergli Heier <snakebite@jvnv.net>
pkgname=rlvm
pkgver=0.14
pkgrel=3
pkgdesc="RealLive clone for Linux and OSX"
arch=('x86_64')
url="http://www.rlvm.net/"
license=('GPL')
depends=('boost-libs>=1.46' 'glew' 'libmad' 'libogg' 'libvorbis' 'libpng'
         'sdl_mixer' 'sdl_image' 'sdl_ttf' 'guichan' 'gtk2')
makedepends=('scons' 'boost')
source=("https://github.com/eglaysher/rlvm/archive/release-$pkgver.tar.gz"
        "https://github.com/eglaysher/rlvm/commit/97c808194c56ba58cabdc4730270797909b7652d.patch"
        "luabind.patch"
        "freetype.patch"
        "iostream.patch")
sha256sums=('6d1717540b8db8aca1480ebafae3354b24e3122a77dd2ee81f4b964c7b10dcc0'
            '8d2e8acf8bcb1f8fd5c78373dbea29036ccee1947a31ea99ae92af72b8ca84fd'
            '2c17ce6af4a2e176e64a2fb10add59b8d7372677fed86f949a2ea3b702f2a54d'
            'd8977832b099a00e51f161ce97d7fa0524888f0bad7e1b6100f71f8458f16ceb'
            '80ee25081846981e27dcd802760a86429e9580a793bd1523e39ba99a5609c739')

prepare() {
  cd "$srcdir/$pkgname-release-$pkgver"
  patch -Np1 -i "$srcdir/97c808194c56ba58cabdc4730270797909b7652d.patch"
  patch -Np1 -i "$srcdir/luabind.patch"
  patch -Np1 -i "$srcdir/freetype.patch"
  patch -Np1 -i "$srcdir/iostream.patch"
}

build() {
  cd "$srcdir/$pkgname-release-$pkgver"
  scons --release
}

package() {
  cd "$srcdir/$pkgname-release-$pkgver"

  install -Dm755 "build/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
  install -Dm644 "src/platforms/gtk/$pkgname.desktop" "$pkgdir/usr/share/applications/$pkgname.desktop"

  local _i
  for _i in 16 24 32 48 128 256; do
    install -Dm644 "resources/$_i/$pkgname.png" "$pkgdir/usr/share/icons/hicolor/${_i}x${_i}/apps/$pkgname.png"
  done
}
