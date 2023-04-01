# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=midimsg-lv2
pkgver=0.0.5
pkgrel=2
pkgdesc="A collection of basic LV2 plugins to translate midi messages to usable values"
arch=(x86_64)
url="https://github.com/blablack/midimsg-lv2"
license=(GPL3)
groups=(
  lv2-plugins
  pro-audio
)
depends=(
  gcc-libs
  glibc
  lv2-host
)
makedepends=(
  lv2
  waf
)
checkdepends=(
  lv2lint
  sord
  xorg-server-xvfb
)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('e2977dfda904e48e87fdfb416b700efae578ceeb81cbcf1ad1a40a3dc0a80e8b92a98d846d25deb367f1763a285816a99ec3db399137f5faa5b53c9bcc1646cb')
b2sums=('8a24d9c837f549648ce6d7b063cf454314b8be44d5121b96578ff68e94013b7ca8db36bce3ccc9c1124bf24e20084b84f2888c257332632845cb307f9082fbb1')

prepare() {
  cd $pkgname-$pkgver
  mkdir -vp tools
  touch __init__.py
  cp -v waflib/extras/{autowaf,lv2}.py tools
  # modify wscript to use current scripts and fix version
  sed -e 's/waflib.extras/tools/' \
      -e "s/load('lv2'/load('lv2', tooldir='tools'/" \
      -i wscript
  rm -rv waflib
}

build() {
  cd $pkgname-$pkgver
  export LINKFLAGS="$LDFLAGS"
  waf configure --prefix=/usr
  waf build -vv
}

check() {
  local name

  cd $pkgname-$pkgver
 for name in aftertouch controller modwheel; do
    xvfb-run lv2lint -Mpack -I build/${pkgname//-/.}/ "https://github.com/blablack/midimsg-lv2/$name" || echo "Known to fail: https://github.com/blablack/midimsg-lv2/issues/1"
  done
}

package() {
  cd $pkgname-$pkgver
  waf install --destdir="$pkgdir/"
  install -vDm 644 {THANKS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
