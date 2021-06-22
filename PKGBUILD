# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>
pkgname=spectrwm-git
_pkgname=spectrwm
pkgver=3.4.1.r19.g63b9ae4
_ghver=3_4_1
pkgrel=1
pkgdesc="A minimalistic automatic tiling window manager that tries to stay out of the way."
arch=('x86_64' 'i686')
url="http://www.spectrwm.org"
_watch="https://github.com/conformal/spectrwm/releases"
license=('custom:ISC')
depends=('dmenu' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'libxrandr' 'libxft' 'libxcursor' 'terminus-font')
replaces=('scrotwm')
makedepends=('git' 'libxt')
optdepends=('scrot: screenshots'
            'xlockmore: great screenlocker')
backup=(etc/spectrwm.conf)
install=spectrwm.install

source=(git+https://github.com/conformal/spectrwm
	LICENSE
        baraction.sh
	spectrwm-no-preload)
md5sums=('SKIP'
         'a67cfe51079481e5b0eab1ad371379e3'
         '950d663692e1da56e0ac864c6c3ed80e'
         '974d109ce0af39cc73936d5efd682480')

provides=("spectrwm=${pkgver%%.r*}-${pkgrel}")
conflicts=('spectrwm')

pkgver() {
    cd "$_pkgname"
    git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/[-_]/./g'
}

prepare() {
  cd "$srcdir/$_pkgname"

  sed -i 's|\"/usr/local/lib/libswmhack.so\"|\"libswmhack.so\"|' spectrwm.c
  sed -i 's/verbose_layout = false;/verbose_layout = true;/' spectrwm.c
  sed -i 's/# modkey = Mod1/modkey = Mod4/' spectrwm.conf
  #sed -i 's/# program[lock].*/program[lock] = slock/' spectrwm.conf

  # see spectrwm FS#403
  #sed -i 's/setconfspawn("lock".*/setconfspawn("lock", "xlock", SWM_SPAWN_OPTIONAL);/' spectrwm.c
}

build() {
  cd "$srcdir/$_pkgname/linux"

  make PREFIX="/usr" SYSCONFDIR="/etc"
}

package() {
  cd "$srcdir/$_pkgname"
  cd linux
  make PREFIX="/usr" SYSCONFDIR="/etc" DESTDIR="$pkgdir" install
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
