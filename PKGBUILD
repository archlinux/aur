# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=spectrwm-git
_gitname=spectrwm
pkgver=20161209
pkgrel=1
pkgdesc="A minimalistic dynamic tiling window manager that tries to stay out of the way."
arch=('i686' 'x86_64')
url="http://www.spectrwm.org"
license=('custom:ISC')
depends=('dmenu' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'libxft' 'terminus-font')
backup=(etc/spectrwm.conf)
replaces=('scrotwm')
conflicts=('scrotwm' 'spectrwm')
provides=('scrotwm' 'spectrwm')
makedepends=('git')
optdepends=('scrot: screenshots'
            'xlockmore: screenlocking')
source=('git+https://github.com/conformal/spectrwm'
        'LICENSE'
        'baraction.sh')
md5sums=('SKIP'
         'a67cfe51079481e5b0eab1ad371379e3'
         '950d663692e1da56e0ac864c6c3ed80e')

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
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
  make PREFIX="/usr"
}

package() {
  cd "$srcdir/$_gitname/linux"
  make PREFIX="/usr" DESTDIR="$pkgdir" install
  install -Dm644 spectrwm.desktop "$pkgdir/usr/share/xsessions/spectrwm.desktop"
  cd ..
  install -Dm644 spectrwm.conf "$pkgdir/etc/spectrwm.conf"
  install -Dm755 screenshot.sh "$pkgdir/usr/share/spectrwm/screenshot.sh"
  cd ../..
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm755 baraction.sh "$pkgdir/usr/share/spectrwm/baraction.sh"

  #ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir/usr/lib/libswmhack.so.0"
  #ln -s /usr/lib/libswmhack.so.0.0 "$pkgdir/usr/lib/libswmhack.so"

  rm "$pkgdir/usr/bin/scrotwm"
  ln -s "/usr/bin/spectrwm" "$pkgdir/usr/bin/scrotwm"
}
