# Maintainer: Garrett <floft.net/contact>
pkgname=cinelerra-heroine
pkgver=4.6
pkgrel=2
pkgdesc="Cinelerra from the HeroineWarrior.com (64-bit)"
arch=('x86_64')
url="http://www.heroinewarrior.com/cinelerra.php"
license=('GPL')
depends=('libpng' 'freeglut' 'libxv' 'ncurses' 'libva'
         'openexr' 'libxft' 'freetype2' 'alsa-lib')
makedepends=('yasm' 'nasm' 'libtool')
conflicts=('cinelerra-cv')
source=(https://sourceforge.net/projects/heroines/files/cinelerra-$pkgver.src.tar.xz
        quicktime.patch
        plugin_dir.patch
        texi2html.patch
        gpac.patch
        libavcodec.patch
        cinelerra_4.6.patch
        cinelerra.desktop)
md5sums=('3da60ce525abc278a028c8889d5b9fd6'
         '0babae23875017653914bd121477ec97'
         'cf9861e808948fe8ea4d4be27765ffa5'
         '431503db853032e14ade0438ed3eea29'
         'cefa6a8efe5ba5bc00ad9fc5649dd25c'
         '4dd7fd1184dfe3813a8821d47ef70a55'
         '3e84af8442b5a3d426ed64f29be71cbf'
         '54ee50b75e5318509da5d4e8fa55caf3')

prepare() {
  cd "$srcdir/cinelerra-$pkgver-src"

  # Use ncurses instead of termcap
  sed -i 's/ltermcap/lncurses/g' ./thirdparty/speech_tools/{configure{,.in},config/config}

  # fixes to make it compile
  patch -Np1 -i "$srcdir/quicktime.patch"
  patch -Np1 -i "$srcdir/texi2html.patch"
  patch -Np1 -i "$srcdir/gpac.patch"
  patch -Np1 -i "$srcdir/libavcodec.patch"
  patch -Np1 -i "$srcdir/cinelerra_4.6.patch"
  
  # fix problems with Cinelerra_plugins in read-only directories
  patch -Np1 -i "$srcdir/plugin_dir.patch"
}

build() {
  cd "$srcdir/cinelerra-$pkgver-src"

  ./configure

  # fix faac linking
  sed -i 's/LDFLAGS = -Wl,-O1,--sort-common,--as-needed,-z,relro/LDFLAGS = -Wl,-O1,-lm,--sort-common,--as-needed,-z,relro/' \
		 ./quicktime/thirdparty/faac-1.24/frontend/Makefile

  make
}

package() {
  cd "$srcdir/cinelerra-$pkgver-src"

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
