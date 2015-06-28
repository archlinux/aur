# Contributor: Sara <sara at archlinux dot us>
# Maintainer: aksr <aksr at t-com dot me>
pkgname=fbpad-git
pkgver=0.r250.3d7ca84
pkgrel=3
pkgdesc="A small linux framebuffer virtual terminal."
arch=('i686' 'x86_64')
#url="http://litcave.rudi.ir/"
url="http://repo.or.cz/w/fbpad.git"
license=('custom:BSD')
groups=()
depends=('bash' 'vim' 'mutt')
makedepends=('git' 'ft2tf' 'ttf-dejavu')
optdepends=()
provides=('fbpad')
conflicts=('fbpad')
replaces=()
backup=()
options=()
install=$pkgname.install
source=($pkgname::git://repo.or.cz/fbpad.git
        'config.h'
        'fbpad-256.info'
        'LICENSE')
noextract=()
md5sums=('SKIP'
         'cdc8e8c4582768dd90b954a143f805d2'
         '185b9d6ec1c539213226a3e2509c7ccd'
         'ec67f29a7dec10f86ef31515ed657a91')
sha1sums=('SKIP'
          '85cbf626883ec0febb714c7226e4de0685985f69'
          'dbb816fe37faf0acb4e1a916d7493787c2b647fc'
          '76a535243054e1fdd9caaa46a1571cd381d74353')
sha256sums=('SKIP'
            '10347e990c1fe1316b69c47170a7d7b4e9e53a9cabe1417269da769647a78445'
            'fb8ae049aa7d41fb285cbf7aa4487b28014273ebcfceefb4d58fb07018312e9c'
            '0ea8d51c57a3a59ca57428b6fe9b47fdb1fde281fc1b095c9832872e85b09a72')

pkgver() {
  cd $srcdir/$pkgname
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $srcdir/$pkgname
  ## Custom config.h
  cp $srcdir/config.h config.h
}

build() {
  cd $srcdir/$pkgname
  make
}

package() {
  cd $srcdir/$pkgname

  install -Dm755 $srcdir/$pkgname/fbpad  $pkgdir/usr/bin/fbpad
  install -Dm644 $srcdir/$pkgname/README $pkgdir/usr/share/doc/$pkgname/README
  install -Dm644 $srcdir/LICENSE         $pkgdir/usr/share/licenses/$pkgname/LICENSE

  ## Compile terminfo
  mkdir -p  $pkgdir/usr/share/terminfo
  tic -x -o $pkgdir/usr/share/terminfo   $srcdir/fbpad-256.info

  ## Setup fonts
  ft2tf /usr/share/fonts/TTF/DejaVuSansMono.ttf:6         >$srcdir/font.ttf
  ft2tf /usr/share/fonts/TTF/DejaVuSansMono-Oblique.ttf:6 >$srcdir/fonti.ttf
  ft2tf /usr/share/fonts/TTF/DejaVuSansMono-Bold.ttf:6    >$srcdir/fontb.ttf

  ## Install fonts
  install -Dm644 $srcdir/font.ttf  $pkgdir/usr/share/$pkgname/font.ttf
  install -Dm644 $srcdir/fonti.ttf $pkgdir/usr/share/$pkgname/fonti.ttf
  install -Dm644 $srcdir/fontb.ttf $pkgdir/usr/share/$pkgname/fontb.ttf
}

