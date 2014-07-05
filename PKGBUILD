# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=ewebkit
pkgname=$_pkgname-svn
pkgver=170806
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
_svnurl="https://svn.webkit.org/repository/webkit/trunk"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'efl' 'e_dbus' 'enchant' 'harfbuzz-icu' 'libsoup' 'libxslt' 'libxt')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
  source=("$_pkgname::svn+$_svnurl")
  sha256sums=('SKIP')
fi

pkgver() {
  if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
    svnversion "$srcdir/$_pkgname" | tr -d '[[:alpha:]]'
  else
    LC_ALL=C svn info "$_svnurl" | awk '/Revision/ {print $2}'
  fi
}

prepare() {
  if [[ ! -d "$SRCDEST/$_pkgname/.svn" ]]; then
#   if this is the first run, checkout only what we need from the repo
    msg2 "Cloning $_pkgname svn repo..."
    cd "$SRCDEST"
    mkdir -p "$_pkgname/.makepkg"
    svn co --depth immediates --config-dir "$_pkgname/.makepkg" -r "$pkgver" "$_svnurl" "$_pkgname"
    cd "$_pkgname"
    svn up --set-depth infinity -r "$pkgver" Source

#   and create a working copy
    msg2 "Creating working copy of $_pkgname svn repo..."
    rm -rf "$srcdir/$_pkgname"
    cp -a "$SRCDEST/$_pkgname" "$srcdir/$_pkgname"
  fi
}

build() {
  cd "$srcdir/$_pkgname"

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
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 Source/WebCore/LICENSE-APPLE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APPLE"
  install -Dm644 Source/WebCore/LICENSE-LGPL-2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL-2"
}
