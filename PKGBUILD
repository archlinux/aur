# Maintainer: Gelmo <gelmo[at]outlook.com>
# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ir.lv2
pkgver=1.3.4
pkgrel=4
relcommit=a523bba0f336d26197b271b64799c4f369e487a8
relcommitshort=a523bba
pkgdesc="No-latency/low-latency, realtime, high performance signal convolver for reverb effects"
arch=(x86_64)
url="https://tomscii.sig7.se/plugins/ir.lv2"
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
  https://git.hq.sig7.se/$pkgname.git/snapshot/$relcommit.tar.gz
  $pkgname-1.3.4-lv2-1.18.0.patch::https://github.com/tomszilagyi/ir.lv2/pull/20/commits/001904135bafa8931e4cf67402e0fa332feb857d.patch
)
sha512sums=('394725dd8345dc09efd77acd43befa0c70548ca4056b5b56d573a47ec1458b957ee0bd7acf8f7237a69c48d1d6b0a037e55734da57f306c4f48f0e4457cc5057'
            'a1f4279df4ae916658249a4634b707f64982c0dc3baea7753e87f56bec3d4f26dd2bc4cf00db904ee054402a59986678478d810730b55bf50455749312af1b13')
b2sums=('33816a91079d24608b9ac058ac2018f3bdc535a14329ab7c81b31706cd3ed7329555ae4fd9e8ceeb84bead544feec3b62b5ff33667c8894fa9c01cf786804b6f'
        '5630b894dcdb7d1ccf378b3308670c6648a6227cf42751d2c1c903f7f887252ce9e1bf72cfc4828df536f8afa6501a41590e494464f69a01b4fd3065fadb0968')

prepare() {
  patch -Np1 -d $pkgname-$relcommitshort -i ../$pkgname-1.3.4-lv2-1.18.0.patch
}

build() {
  make -C $pkgname-$relcommitshort
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
    -I $pkgname-$relcommitshort
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

  make DESTDIR="$pkgdir/" install -C $pkgname-$relcommitshort
  install -vDm 644 $pkgname-$relcommitshort/{ChangeLog,README.md} -t "$pkgdir/usr/share/doc/$pkgname/"
}
