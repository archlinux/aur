# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=ewebkit
pkgname=$_pkgname-svn
pkgver=1.11.0.r173935
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'efl' 'e_dbus' 'enchant' 'espeak' 'geoclue2' 'harfbuzz-icu' 'libxslt')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname/Source::svn+https://svn.webkit.org/repository/webkit/trunk/Source")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/Source/cmake"

  for _i in PROJECT_VERSION_{MAJOR,MINOR,MICRO}; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i OptionsEfl.cmake | grep -o "[[:digit:]]*")
  done

  printf "$v_ver.r$(svnversion | tr -d '[[:alpha:]]')"
}

prepare() {
  cd "$SRCDEST"

  if [[ -d $_pkgname/.svn ]]; then
    msg2 "Updating $_pkgname svn repo..."
    svn update --revision ${pkgver#*.r} $_pkgname
  else
    msg2 "Cloning $_pkgname svn repo..."
    mkdir -p $_pkgname/.makepkg
    svn checkout --depth files --config-dir $_pkgname/.makepkg --revision ${pkgver#*.r} \
      "https://svn.webkit.org/repository/webkit/trunk/" $_pkgname
  fi

  cp $_pkgname/CMakeLists.txt "$srcdir/CMakeLists.txt"
}

build() {
  cd "$srcdir"

# build with glib 2.38/libsoup 2.44
  export CFLAGS="$CFLAGS -Wno-deprecated-declarations"
  export CXXFLAGS="$CXXFLAGS -Wno-deprecated-declarations"

# Make it so geoclue support can find glib2
  export CFLAGS="$CFLAGS -I/usr/include/gio-unix-2.0"
  export CXXFLAGS="$CXXFLAGS -I/usr/include/gio-unix-2.0"

  cmake . \
    -DPORT=Efl \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release

  make
}

package() {
  cd "$srcdir"

  make DESTDIR="$pkgdir" install

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 -t "$pkgdir/usr/share/licenses/$pkgname/" Source/WebCore/LICENSE-{APPLE,LGPL-2}
}
