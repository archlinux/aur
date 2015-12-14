# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: ekse <ekse.0x[AT]gmail[DOT]com>
# Maintainer: mirandir <mirandir[AT]orange[DOT]fr>

pkgname=jumpnbump
pkgver=1.60
pkgrel=2
pkgdesc="You, as a bunny, have to jump on your opponents to make them explode. It's a true multiplayer game which can't be played alone. It has network support. This program is a Unix port of the old DOS game by brainchilddesign. SDL2 port."
arch=('i686' 'x86_64')
url="https://github.com/MCMic/jumpnbump"
license=('GPL')
depends=('sdl2' 'sdl2_mixer' 'sdl2_net')
optdepends=('jumpnbump-levels: more levels for jumpnbump' 'jumpnbump-menu: a launcher for jumpnbump')
source=(jumpnbump::git+https://github.com/MCMic/jumpnbump#commit=28fc03e makefile.patch format-security.patch no-springs.patch safe-temporary-files.patch NetPacket_buffer_size.patch)
sha256sums=('SKIP'
            '68b8df05a9f3cb6fa4584570c0558cdd23e43bc822fd8a53d708900bdc23ef01'
            'c883804700bcaf602bdec6882fefe945519e18dfc430f05cffca34ec86c81290'
            'c6d795f3c5d0a174dfe6f2e528d70246d75181ffa3f652386c2f8b2b84657ce9'
            'f99113c04b988d2e2048b79bb58bfeba26b3aeea3937936b97b06334d34a5c4c'
            '521317ed06d957fb0e3a509e93976ec52709e6f2a16ea121d3767f871605a485')

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
  make PREFIX="${pkgdir}/usr/" install
  
  install -d $pkgdir/usr/lib/jumpnbump
  mv $pkgdir/usr/bin/gobpack $pkgdir/usr/lib/jumpnbump/gobpack
  mv $pkgdir/usr/bin/jnbpack $pkgdir/usr/lib/jumpnbump/pack
  mv $pkgdir/usr/bin/jnbunpack $pkgdir/usr/lib/jumpnbump/unpack
}
