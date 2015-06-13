# Maintainer: Kyle Keen <keenerd@gmail.com>
pkgname=spectrwm-git
_gitname=spectrwm
pkgver=20140826
pkgrel=1
pkgdesc="A minimalistic dynamic tiling window manager that tries to stay out of the way."
arch=('i686' 'x86_64')
url="http://www.spectrwm.org"
license=('custom:ISC')
depends=('dmenu' 'xcb-util' 'xcb-util-wm' 'xcb-util-keysyms' 'libxft' 'profont')
backup=(etc/spectrwm.conf)
replaces=('scrotwm')
conflicts=('scrotwm' 'spectrwm')
provides=('scrotwm' 'spectrwm')
makedepends=('git')
optdepends=('scrot: screenshots'
            'xlockmore: screenlocking'
            'terminus-font: great font')
source=('git://opensource.conformal.com/spectrwm.git'
        "http://opensource.conformal.com/snapshots/$_gitname/$_gitname-2.5.1.tgz"
        'LICENSE'
        'baraction.sh')
md5sums=('SKIP'
         'd9aec3342920e31cbe60f1032571043a'
         'a67cfe51079481e5b0eab1ad371379e3'
         '950d663692e1da56e0ac864c6c3ed80e')

# the 2.6.0 linux makefile does not build
# so download and use the 2.5.1 makefile until this is fixed

pkgver() {
    cd "$_gitname"
    git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

build() {
  cd "$srcdir/$_gitname"

  # it is like a patch, only less fragile
  #sed -i 's|setenv(\"LD_PRELOAD\", SWM_LIB, 1);|//setenv(\"LD_PRELOAD\", SWM_LIB, 1);|' spectrwm.c
  sed -i 's|\"/usr/local/lib/libswmhack.so\"|\"libswmhack.so\"|' spectrwm.c
  sed -i 's/# modkey = Mod1/modkey = Mod4/' spectrwm.conf
  sed -i 's/-\*-terminus-medium-\*-\*-\*-\*/-*-profont-*-*-*-*-12/' spectrwm.conf

  cd linux
  cp "$srcdir/$_gitname-2.5.1/linux/Makefile" ./
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
