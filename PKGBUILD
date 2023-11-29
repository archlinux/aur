# Maintainer: Kyle Keen <keenerd@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=spectrwm
pkgver=3.5.1
_ghver=3_5_1
pkgrel=4
pkgdesc="A minimalistic automatic tiling window manager that tries to stay out of the way."
arch=('x86_64')
url="http://www.spectrwm.org"
_watch="https://github.com/conformal/spectrwm/releases"
license=('custom:ISC')
depends=('dmenu' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'libxrandr' 'libxft' 'libxcursor' 'terminus-font')
replaces=('scrotwm')
makedepends=('libxt')
optdepends=('scrot: screenshots'
            'xlockmore: great screenlocker')
backup=(etc/spectrwm.conf)
install=spectrwm.install

#source=(http://opensource.conformal.com/snapshots/$pkgname/$pkgname-$pkgver.tgz \
source=("https://github.com/conformal/spectrwm/archive/refs/tags/SPECTRWM_${_ghver}.tar.gz" \
	LICENSE \
        baraction.sh \
        spectrwm-no-preload)
md5sums=('611604a6c4a9c7848d64ea98a0d1db16'
         'a67cfe51079481e5b0eab1ad371379e3'
         '950d663692e1da56e0ac864c6c3ed80e'
         '974d109ce0af39cc73936d5efd682480')
sha256sums=('7fe4260208a52d9fb844291d0afe6af18887c5452df0b921ed780af7b9223f0f'
            '1bf0c43ca1063b16f6ab784d251319081579a786f99bb86d9f6828b14abb2263'
            '2cc2ca7105ddb3575bbdf4184d974afab8b475aab0af113242188288d7ba4504'
            '22db9725551197ad1d19f9b5b2ee7c6d7a0f8bcedca982225b27071e0c4bbb26')

prepare() {
  cd "$srcdir/$pkgname-SPECTRWM_$_ghver"

  sed -i 's|\"/usr/local/lib/libswmhack.so\"|\"libswmhack.so\"|' spectrwm.c
  sed -i 's/verbose_layout = false;/verbose_layout = true;/' spectrwm.c
  sed -i 's/# modkey = Mod1/modkey = Mod4/' spectrwm.conf
  #sed -i 's/# program[lock].*/program[lock] = slock/' spectrwm.conf

  # see spectrwm FS#403
  #sed -i 's/setconfspawn("lock".*/setconfspawn("lock", "xlock", SWM_SPAWN_OPTIONAL);/' spectrwm.c
}

build() {
  #cd "$srcdir/$pkgname-$pkgver/linux"
  cd "$srcdir/$pkgname-SPECTRWM_$_ghver/linux"
  
  make PREFIX="/usr"
}

package() {
  #cd "$srcdir/$pkgname-$pkgver"
  cd "$srcdir/$pkgname-SPECTRWM_$_ghver"
  cd linux
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 spectrwm.desktop "$pkgdir/usr/share/xsessions/spectrwm.desktop"
  cd ..
  install -Dm644 spectrwm.conf "$pkgdir/etc/spectrwm.conf"
  install -Dm755 screenshot.sh "$pkgdir/usr/share/spectrwm/screenshot.sh"
  mkdir -p "$pkgdir/etc/spectrwm"
  cp spectrwm_*.conf "$pkgdir/etc/spectrwm/"
  cd "$srcdir"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 baraction.sh "$pkgdir/usr/share/spectrwm/baraction.sh"
  install -Dm755 spectrwm-no-preload "$pkgdir/usr/bin/spectrwm-no-preload"

  #ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir/usr/lib/libswmhack.so.0"
  #ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir/usr/lib/libswmhack.so"

  # fix this for real in the makefile
  rm "$pkgdir/usr/bin/scrotwm"
  ln -s "/usr/bin/spectrwm" "$pkgdir/usr/bin/scrotwm"
}
