# Maintainer: Garrett <floft.net/contact>
pkgname=cinelerra-heroine
pkgver=7.2
pkgrel=1
pkgdesc="Cinelerra from the HeroineWarrior.com (64-bit)"
arch=('x86_64')
url="http://www.heroinewarrior.com/cinelerra.php"
license=('GPL')
depends=('libpng' 'freeglut' 'libxv' 'ncurses' 'libva'
         'openexr' 'libxft' 'freetype2' 'alsa-lib')
makedepends=('yasm' 'nasm' 'libtool')
conflicts=('cinelerra-cv')
source=(https://netcologne.dl.sourceforge.net/project/heroines/cinelerra-${pkgver}-src.tar.xz
        cinelerra.desktop)
sha512sums=('da422379e738bb9c9019bb95fbe4d3cf2f2df995e4d42bd1ef958a79b5013bbdb5c9f50f64e1091d2990215c514e4d28c30f50f65b94bb01a69f6a3e78c02dc7'
            '111cd582cc8d165a6888f66b7de4286058e8037ed9b5dbcbffc4ad6ab283df15203325a2ba5096112e583cc03b56f38b604e7a070113a5deb3762af8f382ff94')

prepare() {
  cd "$srcdir/cinelerra-$pkgver"

  # Use ncurses instead of termcap
  sed -i 's/ltermcap/lncurses/g' ./thirdparty/speech_tools/{configure{,.in},config/config}
}

build() {
  cd "$srcdir/cinelerra-$pkgver"

  ./configure

  # fix faac linking
  sed -i 's/LDFLAGS = -Wl,-O1,--sort-common,--as-needed,-z,relro/LDFLAGS = -Wl,-O1,-lm,--sort-common,--as-needed,-z,relro/' \
		 ./quicktime/thirdparty/faac-1.24/frontend/Makefile

  make
}

package() {
  cd "$srcdir/cinelerra-$pkgver"

  # makes repackaging work
  [ ! -e "bin/cinelerra" ] && \
  	make -C cinelerra && \
	make -C plugins

  make install

  # install puts it in bin/
  rm -rf "$pkgdir/usr/lib/cinelerra/"
  mkdir -p "$pkgdir/usr/lib/cinelerra/"
  mv bin/* "$pkgdir/usr/lib/cinelerra/"

  mkdir -p "$pkgdir/usr/bin/"
  ln -s /usr/lib/cinelerra/cinelerra "$pkgdir/usr/bin/cinelerra"

  mkdir -p "$pkgdir/usr/share/applications/"
  install -Dm644 "$srcdir/cinelerra.desktop" "$pkgdir/usr/share/applications/"
}
