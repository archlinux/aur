# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.60
pkgrel=1
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=('i686' 'x86_64')
url="https://github.com/MCMic/jumpnbump"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net')
optdepends=('jumpnbump-levels: more levels for jumpnbump' 'jumpnbump-menu: a launcher for jumpnbump')
source=(jumpnbump::git+https://github.com/MCMic/jumpnbump#commit=28fc03e makefile.patch format-security.patch no-springs.patch safe-temporary-files.patch NetPacket_buffer_size.patch)
sha256sums=('SKIP'
            'deaaa6b6ffbeca4988cbe140c1099073b0939c9665f3092c865a3185b1eafcb8'
            'c883804700bcaf602bdec6882fefe945519e18dfc430f05cffca34ec86c81290'
            '9abb6eacbdc964575de1219467e376737c2d67b79c43c0ac8f2a17ab55cfea2c'
            'f99113c04b988d2e2048b79bb58bfeba26b3aeea3937936b97b06334d34a5c4c'
            'db10c56f0183177e02da83e4277b4cff4637b67a8a354fa7981a519a90ee7ba9')

build() {
  cd "${srcdir}/${pkgname}/"
  patch -lp0 < ${srcdir}/makefile.patch
  patch -lp0 < ${srcdir}/no-springs.patch
  patch -lp0 < ${srcdir}/NetPacket_buffer_size.patch
  
  for i in 'format-security.patch' 'safe-temporary-files.patch'
  do
     patch -p1 < ${srcdir}/$i
  done
  
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make PREFIX="${pkgdir}" install
  
  install -d $pkgdir/usr/lib/jumpnbump
  mv $pkgdir/usr/bin/gobpack $pkgdir/usr/lib/jumpnbump/gobpack
  mv $pkgdir/usr/bin/jnbpack $pkgdir/usr/lib/jumpnbump/pack
  mv $pkgdir/usr/bin/jnbunpack $pkgdir/usr/lib/jumpnbump/unpack
}
