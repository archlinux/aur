# Maintainer:	       EndlessEden <endlesseden@users.noreply.github.com>
# Previous Maintainer: Francois Menning <f.menning@pm.me>
# Contributer:	       Felix Yan <felixonmars@archlinux.org>
# Contributor:         Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor:         Thomas Dziedzic < gostrc at gmail >
# Contributor:         James Campos <james.r.campos@gmail.com>
# Contributor:         BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor:         Dongsheng Cai <dongsheng at moodle dot com>
# Contributor:         Masutu Subric <masutu.arch at googlemail dot com>
# Contributor:         TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-lts-hydrogen
pkgver=18.12.0
pkgrel=2
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64')
url='https://nodejs.org/'
license=('MIT')
options=(!lto)
provides=("nodejs=$pkgver")
conflicts=(nodejs)
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares') # 'http-parser' 'v8')
makedepends=('python310' 'procps-ng')
optdepends=('npm: nodejs package manager')
source=("https://github.com/nodejs/node/archive/v$pkgver/nodejs-$pkgver.tar.gz"
	fix-build-with-gcc13.patch::"https://chromium-review.googlesource.com/changes/v8%2Fv8~3934140/revisions/5/patch?download&raw"
	"missing-header.patch")
sha512sums=('1a5f076908ff0fe4e877d4d6085ea7dde38517fe5eba4492c37de7040afd92abc3d55974f203abbb93a49194ce815e2f22c4e9503a99ef3ebcb1bf269c4f3516'
	    '06b8ff03f27e683a1f8d0f3f89ac2597091553c41150cff5cdf3ac022d5756f4b7acea85a9daa2ca1ca3316cb1dbcb51a8473202ffcc73b716451d9121843d6b'
	    'd1ca8c27f5e71b22207bee11247cebf7f0ce507dd4711027b24dc688f2ea21f3e4087483bb7d78cc02725ed0b543dd7c56d22f3444d613557304db4fc1934b96')

prepare() {
  cd node-$pkgver/deps/v8
  patch -p1 -i $srcdir/fix-build-with-gcc13.patch
  cd $srcdir/node-$pkgver
  patch -p1 -i $srcdir/missing-header.patch
}

build() {
  cd node-$pkgver

  ./configure \
    --prefix=/usr \
    --with-intl=small-icu \
    --without-npm \
    --shared \
    --shared-openssl \
    --shared-zlib \
    --shared-libuv \
    --experimental-http-parser \
    --shared-nghttp2 \
    --shared-cares \
    --shared-brotli
    # --shared-v8
    # --shared-http-parser

  make
}

check() {
  cd node-$pkgver
  make test || :
}

package() {
  cd node-$pkgver

  make DESTDIR="$pkgdir" install

  install -D -m644 LICENSE \
    "$pkgdir"/usr/share/licenses/nodejs/LICENSE

  cd "$pkgdir"/usr/lib
  ln -s libnode.so.* libnode.so
}

# vim:set ts=2 sw=2 et:
