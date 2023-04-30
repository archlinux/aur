# Maintainer: Mark Wagie <mark dot wagie at proton dot me>
# Contributor: Eric Bélanger <eric@archlinux.org>
pkgname=gweled
pkgver=0.9.1
pkgrel=6
pkgdesc="A puzzle game similar to Bejeweled (aka Diamond Mine)"
arch=('x86_64')
license=('GPL')
url="https://gweled.org"
depends=('gtk2' 'hicolor-icon-theme' 'librsvg' 'sdl_mixer')
makedepends=('git' 'intltool')
install="$pkgname.install"
_commit=819bede9b80860c49eb7666c163bfe42f21dd2c6
#source=("https://launchpad.net/gweled/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz"
# Fork using sdl_mixer rather than libcanberra or libmikmod
source=("git+https://github.com/Marisa-Chan/gweled-sdl_mixer.git#commit=$_commit"
        "$pkgname-fix-librsvg-segfault-v2.patch"
        "$pkgname-c99.patch"
        "$pkgname.appdata.xml")
sha256sums=('SKIP'
            '61f483bde4bfafc4e964da990e34f82f94861c2d7318efb4c52b998b52b92045'
            'd7d09017527c0eb44c311e105f1b1106dcbffd9c0711736ed680a371deb69c81'
            '987567fac9026edb06493a7be7de522a625f224aa7d31684846bbacfd770ad7c')

prepare() {
  cd "$srcdir/$pkgname-sdl_mixer"
  patch -Np0 -i ../"$pkgname-fix-librsvg-segfault-v2.patch"
  patch -Np1 -i ../"$pkgname-c99.patch"
}

build() {
  cd "$srcdir/$pkgname-sdl_mixer"
  export LDFLAGS="${LDFLAGS} -lm -Wl,--export-dynamic "
  ./autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --localstatedir=/var \
    --with-scores-user=root --with-scores-group=games
  make
}

package() {
  cd "$srcdir/$pkgname-sdl_mixer"
  make DESTDIR="$pkgdir" install

  # Register as an application to be visible in the software center
  #
  # NOTE: It would be *awesome* if this file was maintained by the upstream
  # project, translated and installed into the right place during `make install`.
  #
  # See http://www.freedesktop.org/software/appstream/docs/ for more details.
  #
  install -Dm644 "$srcdir/$pkgname.appdata.xml" -t "$pkgdir/usr/share/appdata/"

  # We generate these files on post-install to prevent score resets on upgrade
  rm -rf "$pkgdir/var"
}
