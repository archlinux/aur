# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit-svn
_pkgname=ewebkit
pkgver=150941
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
_svnurl="https://svn.webkit.org/repository/webkit/trunk"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'edje' 'eeze' 'efreet' 'e_dbus' 'enchant' 'libtiff'
         'gst-plugins-base-libs' 'libsoup' 'libxslt' 'libxt')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
  source+=("$_pkgname::svn+$_svnurl")
  md5sums+=("SKIP")
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
    svn up --set-depth infinity -r "$pkgver" Tools

#   and create a working copy
    msg2 "Creating working copy of $_pkgname svn repo..."
    rm -rf "$srcdir/$_pkgname"
    cp -a "$SRCDEST/$_pkgname" "$srcdir/$_pkgname"
  fi
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . \
	-DPORT=Efl \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	-DSHARED_CORE=ON \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
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
