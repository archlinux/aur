# Maintainer: Daniel Kamil Kozar <dkk089@gmail.com>
pkgname=tuxracer
pkgver=0.61
pkgrel=2
pkgdesc="The Tux racing game - original version"
arch=('i686' 'x86_64')
url="http://tuxracer.sourceforge.net/"
license=('GPL2')
depends=('tcl' 'libx11' 'libxi' 'libxext' 'libxmu' 'libxt' 'mesa' 'glu'
  'freeglut' 'sdl' 'sdl_mixer')
source=(
  "http://download.sourceforge.net/tuxracer/${pkgname}-${pkgver}.tar.gz"
  "http://download.sourceforge.net/tuxracer/${pkgname}-data-${pkgver}.tar.gz"
  'invalid-preprocessing-token.diff'
  'pointer-printf-overflow.diff'
  'tuxracer.xpm'
  'tuxracer.desktop'
  'tuxracer.install'
)
noextract=("${pkgname}-data-${pkgver}.tar.gz")
sha256sums=(
  'a311d09080598fe556134d4b9faed7dc0c2ed956ebb10d062e5d4df022f91eff'
  '3783d204b7bb1ed16aa5e5a1d5944de10fbee05bc7cebb8f616fce84301f3651'
  '6b0ec990d678f2b70f6719d00ec801137f36a842060bfe61409acf20f7cafe73'
  '4a1eb831016211e76d770a3f13bf04f034c78ef65a13427c8004f641300a95f2'
  'fb4ddee30cabe0c49f9b63a91abde762847b0a994fc6ae82ad84eb88a5f9f155'
  'bf1ac9b1cb6eb2642ab10dcb42f3f73eab4a7e675e7fee1f176f6a462da5ed40'
  '51c656197322833ee3140d71452d31e3258e4bdbeabadc6588562150077281e4'
)

prepare() {
  cd "$pkgname-$pkgver"
  patch -p1 -i "$srcdir/invalid-preprocessing-token.diff"
  patch -p1 -i "$srcdir/pointer-printf-overflow.diff"
}

build() {
  cd "$pkgname-$pkgver"
  
  # CPPFLAGS contains -D_FORTIFY_SOURCE=2 by default. when configure checks how
  # to invoke the preprocessor, it rightly uses the value of $CPPFLAGS, but it
  # causes an error when processing the headers, saying that "_FORTIFY_SOURCE
  # requires compiling with optimization". this causes the script to revert to
  # the default location of /lib/cpp for the preprocessor, which causes the rest
  # of the configuration to fail, as it does not exist. therefore, append
  # CPPFLAGS to CFLAGS and CXXFLAGS before passing them to configure and leave
  # CPPFLAGS empty. this is not foolproof and bound to break, but works so far.
  CFLAGS="${CFLAGS} ${CPPFLAGS}" \
    CXXFLAGS="${CXXFLAGS} ${CPPFLAGS}" \
    CPPFLAGS="" \
    ./configure --prefix=/usr --with-data-dir=/usr/share/tuxracer
  
  make
}

package() {
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  
  mkdir -p "$pkgdir/usr/share"
  pushd "$pkgdir/usr/share"
  tar xf "$srcdir/${pkgname}-data-${pkgver}.tar.gz"
  mv "${pkgname}-data-${pkgver}" tuxracer
  popd
  
  mkdir -p "$pkgdir/usr/share/pixmaps"
  cp "$srcdir/tuxracer.xpm" "$pkgdir/usr/share/pixmaps"
  
  mkdir -p "$pkgdir/usr/share/applications"
  cp "$srcdir/tuxracer.desktop" "$pkgdir/usr/share/applications"
}
