# Maintainer: Mike Cuche <cuche@gmx.com>

pkgname=dosbox-x
pkgver=0.83.5
pkgrel=1
pkgdesc="x86 emulator with builtin DOS, with patches with more features"
arch=(i686 x86_64)
url="http://dosbox-x.com"
license=(GPL)
depends=(fluidsynth libxkbfile libpng libxrandr mesa ffmpeg)
makedepends=(glu)
optdepends=()
conflicts=(dosbox-x-git)
source=(https://github.com/joncampbell123/dosbox-x/archive/dosbox-x-v${pkgver}.tar.gz
		dosbox-x.png
		dosbox-x.desktop)
sha256sums=('debcd2370c260d1e90a3b42dccfa90406b2a51332d3e2dd7b50d92af5287370d'
			'caa164f3d17d414733882d29098cb9cd63faddbdd5580a0c30f1173a63c42475'
			'32f290580ec02dedd09908d8a4de10f57b94998f2c1eb597b649208cd87b2d33')

build() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  #removing --as-needed compile flag as refered to this: https://github.com/joncampbell123/dosbox-x/issues/1698#issuecomment-655291120
  export LDFLAGS="${LDFLAGS//,--as-needed}" 
  sed -i -e 's/-j3/-j$(nproc)/g' build
  ./build
}

package() {
  cd $srcdir/dosbox-x-dosbox-x-v${pkgver}
  make DESTDIR="${pkgdir}" install
  install -Dm644 "${srcdir}/dosbox-x.png" \
	"${pkgdir}/usr/share/pixmaps/dosbox-x.png"
  install -Dm644 "${srcdir}/dosbox-x.desktop" \
	"${pkgdir}/usr/share/applications/dosbox-x.desktop"
}
