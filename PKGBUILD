# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ir.lv2
pkgver=1.3.4
pkgrel=3
pkgdesc="No-latency/low-latency, realtime, high performance signal convolver for reverb effects"
arch=(x86_64)
url="https://tomszilagyi.github.io/plugins/ir.lv2/"
license=(GPL2)
groups=(
  lv2-plugins
  pro-audio
)
depends=(
  cairo
  gcc-libs
  glibc
  lv2-host
)
makedepends=(
  glib2
  gtk2
  libsamplerate
  libsndfile
  lv2
  zita-convolver
)
checkdepends=(lv2lint)
source=(
  https://github.com/tomszilagyi/$pkgname/archive/$pkgver/$pkgname-$pkgver.tar.gz
  $pkgname-1.3.4-lv2-1.18.0.patch::https://github.com/tomszilagyi/ir.lv2/pull/20/commits/001904135bafa8931e4cf67402e0fa332feb857d.patch
)
sha512sums=('6a9c8f906a07c6ed0daa53d8dc3693d535ec4cf63f07b5fcc62ab6638c66992ff7951918b0ce2ef8c65289b19988363be49bba9bb75a20b0463fa972b07ff58c'
            'a1f4279df4ae916658249a4634b707f64982c0dc3baea7753e87f56bec3d4f26dd2bc4cf00db904ee054402a59986678478d810730b55bf50455749312af1b13')
b2sums=('52f5b236c4680a759c0621ed0f9a394e6e82bdb9aaf4110b325902ae382d2f640a079c53d89c662a192a97d0e79349082cf100636c1a7d6c00738602ca652962'
        '5630b894dcdb7d1ccf378b3308670c6648a6227cf42751d2c1c903f7f887252ce9e1bf72cfc4828df536f8afa6501a41590e494464f69a01b4fd3065fadb0968')

prepare() {
  patch -Np1 -d $pkgname-$pkgver -i ../$pkgname-1.3.4-lv2-1.18.0.patch
}

build() {
  make -C $pkgname-$pkgver
}

check() {
  local lv2lint_options=(
    # ignore tests that upstream won't fix: https://github.com/tomszilagyi/ir.lv2/issues/21
    -t "Plugin Version Minor"
    -t "Plugin Version Micro"
    -t "Plugin Symbols"
    -t "UI Symbols"
    -t "Port Properties"
    -Mpack
    -I $pkgname-$pkgver
    "http://tomszilagyi.github.io/plugins/lv2/ir"
  )

  lv2lint "${lv2lint_options[@]}"
}

package() {
  depends+=(
    gtk2 libgdk-x11-2.0.so libgtk-x11-2.0.so
    glib2 libgobject-2.0.so libglib-2.0.so
    libsamplerate libsamplerate.so
    libsndfile libsndfile.so
    zita-convolver libzita-convolver.so
  )

  make DESTDIR="$pkgdir/" install -C $pkgname-$pkgver
  install -vDm 644 $pkgname-$pkgver/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
