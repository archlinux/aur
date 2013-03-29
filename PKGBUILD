# Maintainer: Doug Newgard <scimmia22 at outlook dot com>
# Contributor: twa022 <twa022 at gmail dot com>

pkgname=ewebkit-svn
_pkgname=ewebkit
pkgver=146904
pkgrel=2
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
_svntrunk="https://svn.webkit.org/repository/webkit/trunk"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'edje' 'eeze' 'efreet' 'e_dbus' 'enchant' 'sqlite' 'libtiff'
         'gst-plugins-base-libs' 'libsoup' 'libxslt' 'libxt')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
  source+=("$_pkgname"::svn+"$_svntrunk")
  md5sums+=("SKIP")
fi

pkgver() {
  if [[ -d "$SRCDEST/$_pkgname/.svn" ]]; then
    svnversion "$SRCDEST/$_pkgname"
  else
    svnversion "$_svntrunk"
  fi
}

prepare() {
  cd "$SRCDEST"

  if [[ ! -d "$_pkgname/.svn" ]]; then
#   if this is the first run, checkout only what we need from the repo
    msg2 "Cloning $_pkgname svn repo..."
    svn co --depth immediates --config-dir "$_pkgname" -r "$pkgver" "$_svntrunk" "$_pkgname"
    cd "$_pkgname"
    svn up --set-depth infinity -r "$pkgver" Source
    svn up --set-depth infinity -r "$pkgver" Tools

#   and create a working copy
    msg2 "Creating working copy of $_pkgname svn repo..."
    rm -rf "$srcdir/$_pkgname"
    svn export "$SRCDEST/$_pkgname" "$srcdir/$_pkgname"
  fi
}

build() {
  cd "$srcdir/$_pkgname"

  cmake . \
	-DPORT=Efl \
	-DPYTHON_EXECUTABLE=/usr/bin/python2 \
	-DSHARED_CORE=OFF \
	-DCMAKE_BUILD_TYPE=Release \
	-DCMAKE_INSTALL_PREFIX=/usr \
	-DENABLE_WEBKIT=ON \
	-DENABLE_WEBKIT2=OFF

  make
}

package() {
  cd "$srcdir/$_pkgname"

  make DESTDIR="$pkgdir" install

# install license files
  install -Dm644 Source/WebCore/LICENSE-APPLE "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APPLE"
  install -Dm644 Source/WebCore/LICENSE-LGPL-2 "$pkgdir/usr/share/licenses/$pkgname/LICENSE-LGPL-2"
}
