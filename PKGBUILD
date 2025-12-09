# Maintainer: XZS <d dot f dot fischer at web dot de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Felix Golatofski <contact@xdfr.de>
# Contributor: Chih-Hsuan Yen <yan12125@gmail.com>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: grimsock <lord.grimsock at gmail dot com>
# Contributor: Dieter Plaetinck <dieter@plaetinck.be>
# Contributor: Vladimir Chizhov <jagoterr@gmail.com>
# Contributor: Henry Tang <henryykt@gmail.com>

pkgname=phantomjs
pkgver=2.1.1
_debver=2.1.1+dfsg
_debrel=2
pkgrel=17
pkgdesc='Headless WebKit with JavaScript API'
url='https://www.phantomjs.org/'
license=('BSD' 'LGPL' 'MIT')
arch=('i686' 'x86_64')
depends=('gcc-libs' 'glibc' 'qt5-base' 'qt5-webkit')
makedepends=('python' 'quilt')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ariya/phantomjs/archive/${pkgver}.tar.gz"
        "https://archive.debian.org/debian/pool/main/p/phantomjs/phantomjs_$_debver-$_debrel.debian.tar.xz"
        fix-missing-webkit-include-files.patch)
sha512sums=('07b769133957c5194c9afdaa347bd9a019ebe47653f98adf17a35d3dd12714d2f8e3773ced91d7d99f31cb18d7f73167022d5b0a3906d9aac0732ef96341f5ec'
            'f2dc95aa1a4c3c68b7400a068224b529d80a985911a3da5354a8eef08319cdcca21065fd470542b52132eb4f5d8fd699e58cba3e840d4662948ee290f8b22ef9'
            '0bb57e7f2dee65717bd58006a361556c64b92f0dfb83a7c0fa6691da8f7a3757f7da1575af5108bead5d78505e53779bd10463d928daa5031e653856aca131a8')

prepare() {
  cd $pkgname-$pkgver
  if [[ ${pkgver%.*} = ${_debver%.*} ]]; then
    # Debian patches
    export QUILT_PATCHES=debian/patches
    export QUILT_REFRESH_ARGS='-p ab --no-timestamps --no-index'
    export QUILT_DIFF_ARGS='--no-timestamps'

    mv "$srcdir"/debian .

    quilt push -av
  fi
#  mkdir "$srcdir/python2-path"
#  ln -s /usr/bin/python2 "$srcdir/python2-path/python"
  patch -p1 -i ../fix-missing-webkit-include-files.patch
}

build() {
  cd $pkgname-$pkgver
#  export PATH="$srcdir/python2-path:$PATH" PYTHON=/usr/bin/python2
#  export CXXFLAGS+=' -I/usr/include/openssl-1.0'
#  export OPENSSL_LIBS='-L/usr/lib/openssl-1.0 -lssl -lcrypto'

#  CFLAGS+=' -Wno-expansion-to-defined'
#  CXXFLAGS+=' -Wno-expansion-to-defined'

  python build.py --skip-git --skip-qtbase --skip-qtwebkit --confirm --release
}

package() {
  cd $pkgname-$pkgver
  install -Dm755 bin/phantomjs "$pkgdir/usr/bin/phantomjs"

  mkdir -p "$pkgdir/usr/share/$pkgname"
  cp -r examples "$pkgdir/usr/share/$pkgname/"

  install -Dm644 LICENSE.BSD "$pkgdir/usr/share/licenses/$pkgname/LICENSE.BSD"
  install -Dm644 third-party.txt "$pkgdir/usr/share/licenses/$pkgname/third-party.txt"
}

