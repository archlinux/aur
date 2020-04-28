# Maintainer: David Runge <dvzrv@archlinux.org>

pkgname=ir.lv2
pkgver=1.3.4
pkgrel=2
pkgdesc="No-latency/low-latency, realtime, high performance signal convolver for reverb effects"
arch=('x86_64')
url="https://tomszilagyi.github.io/plugins/ir.lv2/"
license=('GPL2')
groups=('lv2-plugins' 'pro-audio')
depends=('cairo' 'gcc-libs' 'glibc')
makedepends=('glib2' 'gtk2' 'lv2' 'libsamplerate' 'libsndfile' 'zita-convolver')
checkdepends=('lv2lint')
source=("$pkgname-$pkgver.tar.gz::https://github.com/tomszilagyi/${pkgname}/archive/${pkgver}.tar.gz"
        "${pkgname}-1.3.4-lv2-1.18.0.patch::https://github.com/tomszilagyi/ir.lv2/pull/20/commits/001904135bafa8931e4cf67402e0fa332feb857d.patch")
sha512sums=('6a9c8f906a07c6ed0daa53d8dc3693d535ec4cf63f07b5fcc62ab6638c66992ff7951918b0ce2ef8c65289b19988363be49bba9bb75a20b0463fa972b07ff58c'
            'a1f4279df4ae916658249a4634b707f64982c0dc3baea7753e87f56bec3d4f26dd2bc4cf00db904ee054402a59986678478d810730b55bf50455749312af1b13')

prepare() {
  cd "$pkgname-$pkgver"
  patch -Np1 -i "../${pkgname}-1.3.4-lv2-1.18.0.patch"
}

build() {
  cd "$pkgname-$pkgver"
  make
}

check() {
  cd "$pkgname-$pkgver"
  lv2lint -Mpack -I . "http://tomszilagyi.github.io/plugins/lv2/ir" || echo "Known to fail: https://github.com/tomszilagyi/ir.lv2/issues/21"
}

package() {
  depends+=('libgdk-x11-2.0.so' 'libgobject-2.0.so' 'libglib-2.0.so'
  'libgtk-x11-2.0.so' 'libsamplerate.so' 'libsndfile.so'
  'libzita-convolver.so')
  cd "$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
  install -vDm 644 {ChangeLog,README.md} \
    -t "${pkgdir}/usr/share/doc/${pkgname}"
}
