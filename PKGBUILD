# Maintainer: hiruocha <hiruocha[at]outlook[dot]com>
# Contributor: EndlessEden <endlesseden@users.noreply.github.com>
# Contributor: Francois Menning <f.menning@pm.me>
# Contributer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >
# Contributor: James Campos <james.r.campos@gmail.com>
# Contributor: BlackEagle < ike DOT devolder AT gmail DOT com >
# Contributor: Dongsheng Cai <dongsheng at moodle dot com>
# Contributor: Masutu Subric <masutu.arch at googlemail dot com>
# Contributor: TIanyi Cui <tianyicui@gmail.com>

pkgname=nodejs-lts-hydrogen
pkgver=18.20.8
pkgrel=1
epoch=1
pkgdesc='Evented I/O for V8 javascript'
arch=('x86_64')
url='https://nodejs.org/'
license=('MIT')
options=(!lto)
provides=("nodejs=$pkgver")
conflicts=(nodejs)
depends=('brotli' 'openssl' 'zlib' 'icu' 'libuv' 'libnghttp2' 'c-ares') # 'http-parser' 'v8')
makedepends=('python' 'procps-ng' 'patchutils')
optdepends=('npm: nodejs package manager')
source=("https://github.com/nodejs/node/archive/v$pkgver/nodejs-$pkgver.tar.gz"
        "support-python314.patch"
        "make-nodedownload-module-compatible-with-Python314.patch::https://github.com/nodejs/node/commit/dfcb824ae3e7752abf3c809a3f226cb21dd2187a.patch"
        "fix-build-with-GCC15.patch::https://github.com/nodejs/node/commit/bade7a1866618b9e46358b839fe5fdf16b1db2be.patch")
sha512sums=('7d2b9a58c3adc1a136f1cbca77798823eaf747a7841989a4c25f171cafe59f3a9a409d6fae36a251bcbdf81b92ef39c13df89e33476f82b6b6fc6efa486a259f'
            '4012066bb274b0d4a0dffdeeb8693f2d808567abcd2604b392c2c687710102ab1dd8ccd031148cb0c1634b932f664c1d4a3ece9f01bf3d2aae0da1e91ed937c1'
            '02ead03615bb9cf8c1de027b0212aa49cf164ae9026cdc88978cd00d6946e4a125ad59b1a7c3e0e13a16838542dff91f951243be15b40378bff27ad38ac5077a'
            '7805d35ab9ec91ba1f7d9a7bbffb2a625037a5d3615c7a05bb19820e1c09ce9d5b333602117ef4226ee7e13d1e52f68b84964256c69d4d91885b4c8546358216')

prepare() {
  cd $srcdir/node-$pkgver
  patch -p1 -i $srcdir/support-python314.patch
  patch -p1 -i $srcdir/make-nodedownload-module-compatible-with-Python314.patch
  patch -p1 -i $srcdir/fix-build-with-GCC15.patch
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
