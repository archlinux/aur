# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Contributor: twa022 <twa022 at gmail dot com>

_pkgname=ewebkit
pkgname=$_pkgname-svn
pkgver=1.11.0.r183545
pkgrel=1
pkgdesc="WebKit ported to the Enlightenment Foundation Libraries - Development version"
arch=('i686' 'x86_64')
url="http://trac.webkit.org/wiki/EFLWebKit"
license=('LGPL2' 'LGPL2.1' 'BSD')
depends=('atk' 'cairo' 'efl' 'enchant' 'espeak' 'geoclue2' 'harfbuzz-icu' 'libxslt')
makedepends=('cmake' 'subversion' 'perl' 'python2' 'ruby' 'gperf')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname/Source::svn+https://svn.webkit.org/repository/webkit/trunk/Source"
        "$pkgname/Tools::svn+https://svn.webkit.org/repository/webkit/trunk/Tools"
        'fix_libXext_linking.patch')
sha256sums=('SKIP'
            'SKIP'
            'cbed18fde023d83cf810a31c6b77aab2247d78481cbbd264144f6bf5f6e5126c')

pkgver() {
  cd Source/cmake

  for _i in PROJECT_VERSION_{MAJOR,MINOR,MICRO}; do
    local v_ver=${v_ver#.}.$(grep -m1 $_i OptionsEfl.cmake | grep -o "[[:digit:]]*")
  done

  printf "$v_ver.r$(svnversion | tr -d '[[:alpha:]]')"
}

prepare() {
# Turn off -Werror, causes too many build failures for things we don't care about
  sed -i '/-Werror/d' Source/cmake/WebKitHelpers.cmake

# Let the linker find libXext for WebKit2
  patch -Np0 -i fix_libXext_linking.patch

# Make sure Tools is at the same rev as Source
  svn update --revision ${pkgver#*.r} Tools

# Get CMakeLists.txt from SVN root
  cd "$SRCDEST"

  if [[ -d $pkgname/.svn ]]; then
    svn update --revision ${pkgver#*.r} $pkgname
  else
    mkdir -p $pkgname/.makepkg
    svn checkout --depth files --config-dir $_pkgname/.makepkg --revision ${pkgver#*.r} \
      "https://svn.webkit.org/repository/webkit/trunk/" $pkgname
  fi

  cp $pkgname/CMakeLists.txt "$srcdir/CMakeLists.txt"
}

build() {
  cmake . \
    -DPORT=Efl \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_BUILD_TYPE=Release \
    -DDEVELOPER_MODE=ON

  make
}

package() {
  make DESTDIR="$pkgdir" install

# install license files
  install -d "$pkgdir/usr/share/licenses/$pkgname/"
  install -m644 Source/WebCore/LICENSE-{APPLE,LGPL-2} "$pkgdir/usr/share/licenses/$pkgname/"
}
