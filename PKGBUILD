# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=spectrwm-git
_gitname=spectrwm
pkgver=3.4.1.r16.g92589af
pkgrel=1
pkgdesc="A minimalistic dynamic tiling window manager that tries to stay out of the way."
arch=('i686' 'x86_64')
url="http://www.spectrwm.org"
license=('custom:ISC')
depends=('dmenu' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'libxrandr' 'libxft' 'libxcursor' 'terminus-font')
backup=(etc/spectrwm.conf)
replaces=('scrotwm')
makedepends=('git' 'libxt')
optdepends=('scrot: screenshots'
            'xlockmore: screenlocking')
source=('git+https://github.com/conformal/spectrwm'
        'baraction.sh')
md5sums=('SKIP'
         '950d663692e1da56e0ac864c6c3ed80e')
provides=('scrotwm' "spectrwm=${epoch:+$epoch:}${pkgver%%.r*}-${pkgrel}")
conflicts=('scrotwm' 'spectrwm')

pkgver() {
    cd "$_gitname"
    git describe --long --tags | sed -E 's/^[^0-9]*//;s/([^-]*-g)/r\1/;s/[-_]/./g'
}

prepare() {
  cd "$srcdir/$_gitname"
  #sed -i 's|setenv(\"LD_PRELOAD\", SWM_LIB, 1);|//setenv(\"LD_PRELOAD\", SWM_LIB, 1);|' spectrwm.c
  sed -i 's|\"/usr/local/lib/libswmhack.so\"|\"libswmhack.so\"|' spectrwm.c
  sed -i 's/# modkey = Mod1/modkey = Mod4/' spectrwm.conf
  #sed -i 's/-\*-terminus-medium-\*-\*-\*-\*/-*-profont-*-*-*-*-12/' spectrwm.conf
}

build() {
  cd "$srcdir/$_gitname/linux"
  make PREFIX="/usr" SYSCONFDIR="/etc"
}

package() {
  cd "$srcdir/$_gitname/linux"
  make PREFIX="/usr" SYSCONFDIR="/etc" DESTDIR="$pkgdir" install
  install -Dm644 spectrwm.desktop "$pkgdir/usr/share/xsessions/spectrwm.desktop"
  cd ..
  install -Dm644 spectrwm.conf "$pkgdir/etc/spectrwm.conf"
  install -Dm755 screenshot.sh "$pkgdir/usr/share/spectrwm/screenshot.sh"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE.md"
  install -Dm755 ../baraction.sh "$pkgdir/usr/share/spectrwm/baraction.sh"

  #ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir/usr/lib/libswmhack.so.0"
  #ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir/usr/lib/libswmhack.so"

  rm "$pkgdir/usr/bin/scrotwm"
  ln -s "/usr/bin/spectrwm" "$pkgdir/usr/bin/scrotwm"
}
