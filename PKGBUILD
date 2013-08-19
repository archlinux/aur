# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit-svn
_pkgname=${pkgname%-*}
pkgver=154268
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
_svnurl="https://svn.webkit.org/repository/webkit/trunk"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'edje' 'eeze' 'efreet' 'e_dbus' 'enchant' 'libtiff'
         'gst-plugins-base-libs' 'libsoup' 'libxslt' 'libxt' 'harfbuzz-icu')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
source=("harfbuzz-icu.patch")
sha256sums=('95f61c07e2548ff7b3799c8812a3eb922658a3969144cca701f6f89d9e5c6a34')
if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
  source+=("$_pkgname::svn+$_svnurl")
  sha256sums+=('SKIP')
fi

pkgver() {
  if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
    svnversion "$srcdir/$_pkgname" | sed 's/P$//'
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

  cd "$srcdir/$_pkgname"
  patch -Np0 < ../harfbuzz-icu.patch
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . \
    -DPORT=Efl \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPYTHON_EXECUTABLE=/usr/bin/python2 \
    -DCMAKE_BUILD_TYPE=Release \
    -DSHARED_CORE=ON \
    -DENABLE_WEBKIT=ON \
    -DENABLE_WEBKIT2=ON \
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
