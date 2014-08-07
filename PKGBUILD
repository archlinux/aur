# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit
pkgver=1.11.0alpha1
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'elementary' 'enchant' 'harfbuzz-icu' 'libsoup' 'libxslt' 'libxt')
makedepends=('cmake' 'perl' 'python2' 'ruby' 'gperf')
source=("http://download.enlightenment.org/rel/libs/webkit-efl/$pkgname-1.11.0-alpha1.tar.xz"
        '3e431a5bdd20c264a4636ddaa6b4d5a331020695.patch')
sha256sums=('3392b1d2e8b9acd9e0461f8235c22fde42420ae4e6c964aa7ec33695d3ceb10c'
            '2e1f0b7e9cd322a32c6d4464263f0ad2fd485871ba5417c41e53503edb60b4dd')

prepare() {
  cd "$srcdir/$pkgname"

  patch -Np1 < ../3e431a5bdd20c264a4636ddaa6b4d5a331020695.patch
}

build() {
  cd "$srcdir/$pkgname"

# build with glib 2.38/libsoup 2.44
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr

  make
}

package_ewebkit() {
  cd "$srcdir/$pkgname"

  make DESTDIR="$pkgdir" install
  install -m755 bin/MiniBrowser "$pkgdir/usr/bin/MiniBrowser-ewk"

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" Source/WebCore/LICENSE-{APPLE,LGPL-2}
}
