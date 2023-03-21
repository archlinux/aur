# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=deteriorate-lv2
pkgver=1.0.7
pkgrel=4
pkgdesc="A set of plugins to deteriorate the sound quality of a live input"
arch=(x86_64)
url="https://github.com/blablack/deteriorate-lv2"
license=(GPL3)
groups=(
  lv2-plugins
  pro-audio
)
depends=(
  gcc-libs
  glibc
  gtkmm
)
makedepends=(
  atkmm
  cairomm
  freetype2
  glib2
  glibmm
  libsigc++
  lv2
  lvtk
  pango
  waf
)
checkdepends=(lv2lint)
source=($url/archive/v$pkgver/$pkgname-v$pkgver.tar.gz)
sha512sums=('dec154c7f45cb69906245993e03d5551ff06a052d50fae753d52643a1cf9ed60479c76d586bd0e9b7606cd4e5b3b866e80a791b9c21dd6cdd7415f9687ff847e')
b2sums=('6ee4f790f143bb3756acdcbecab5f339fa53afbb1443a811c35c8ca74cd71b1bef6d43be5ef67d15d694f1a76b01c714b40e64e945f2443f769ee15abb4db8ad')

prepare() {
  cd $pkgname-$pkgver
  # let wscript(s) find the custom waf scripts
  mkdir -pv tools
  touch __init__.py
  cp -v waflib/extras/{autowaf,lv2}.py tools/
  mkdir -pv plugins/tools/
  cp -v waflib/extras/{autowaf,lv2}.py plugins/tools/
  rm -rv waflib
  sed -e 's/waflib.extras/tools/g' \
      -e "s/load('autowaf'/load('autowaf', tooldir='tools'/g" \
      -e "s/load('lv2'/load('lv2', tooldir='tools'/g" \
      -i wscript
}

build() {
  cd $pkgname-$pkgver
  export LINKFLAGS="$LDFLAGS"
  waf configure --prefix=/usr
  waf
}

check() {
  local _name
  local lv2lint_options=(
    # disable broken tests, as upstream does not care: https://github.com/blablack/deteriorate-lv2/issues/10
    -t "Plugin Symbols"
    -t "UI Symbols"
    -t "Plugin Version Minor"
    -t "Plugin Version Micro"
    -Mpack
    -I "$pkgname-$pkgver/build/${pkgname//-/.}/"
  )

  for _name in {downsampler_{mono,stereo},granulator_{mono,stereo}}; do
    lv2lint "${lv2lint_options[@]}" "http://github.com/blablack/deteriorate-lv2/${_name}"
  done
}

package() {
  depends+=(
    atkmm libatkmm-1.6.so
    cairomm libcairomm-1.0.so
    glibmm libglibmm-2.4.so
    libsigc++ libsigc-2.0.so
  )

  cd $pkgname-$pkgver
  install -vDm 755 build/${pkgname//-/.}/*.so -t "$pkgdir/usr/lib/lv2/${pkgname//-/.}/"
  install -vDm 644 build/${pkgname//-/.}/*.ttl -t "$pkgdir/usr/lib/lv2/${pkgname//-/.}/"
  install -vDm 644 {THANKS,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
