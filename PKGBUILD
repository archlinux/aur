# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=ewebkit
pkgname=$_pkgname-svn
pkgver=170826
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'efl' 'e_dbus' 'enchant' 'harfbuzz-icu' 'libsoup' 'libxslt' 'libxt')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$_pkgname-CMakeLists.txt::https://svn.webkit.org/repository/webkit/trunk/CMakeLists.txt"
        "$_pkgname-Source::svn+https://svn.webkit.org/repository/webkit/trunk/Source")
sha256sums=('SKIP'
            'SKIP')

# make sure CMakeLists.txt gets re-downloaded every time
if [[ -z $_removed ]]; then
  [[ -e "$SRCDEST/$_pkgname-CMakeLists.txt" ]] && rm "$SRCDEST/$_pkgname-CMakeLists.txt"
  export _removed=1
fi

pkgver() {
  svnversion "$srcdir/$_pkgname-Source" | tr -d '[[:alpha:]]'
}

prepare() {
  ln -s $_pkgname-Source "$srcdir/Source"
  ln -s $_pkgname-CMakeLists.txt "$srcdir/CMakeLists.txt"
}

build() {
  cd "$srcdir"

# build with glib 2.38/libsoup 2.44
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

  cmake . \
    -DPORT=Efl \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DENABLE_TOOLS=OFF

  make
}

package() {
  cd "$srcdir"

  make DESTDIR="$pkgdir" install

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" Source/WebCore/LICENSE-{APPLE,LGPL-2}
}
