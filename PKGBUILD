# Maintainer: Gilles Hamel <hamelg@laposte.net>
# Contributor: Taijian <taijian@posteo.de>
# Contributor: Jonathan Conder <jonno.conder@gmail.com>
# Contributor: Giovanni Scafora <giovanni@archlinux.org>

pkgbase=mythplugins-git
pkgname=('mythplugins-mytharchive-git'
         'mythplugins-mythbrowser-git'
         'mythplugins-mythgame-git'
         'mythplugins-mythmusic-git'
         'mythplugins-mythnews-git'
         'mythplugins-mythweather-git'
         'mythplugins-mythzoneminder-git')
br=fixes/31
t="${br#*/}+${br%/[0-9][0-9]}"
pkgver=31+fixes.20200413.4d092420
pkgrel=2
arch=('x86_64')
url="http://www.mythtv.org"
license=('GPL')

makedepends=('git' 'dvdauthor' 'dvd+rw-tools' 'mesa-libgl'  "mythtv-git>=$t"
             'perl-datetime-format-iso8601' 'perl-date-manip' 'perl-image-size' 'perl-cgi'
             'perl-json' 'perl-libwww' 'perl-soap-lite' 'perl-xml-simple' 'perl-xml-xpath' 'libhdhomerun'
             'python-pillow' 'python-pycurl' 'python-oauthlib' 'gdb' 'mariadb-libs' 'minizip'
             'python-lxml' 'perl-xml-xpath' 'python-urllib3' 'libcdio-paranoia')
source=("git+https://github.com/MythTV/mythtv#branch=$br")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/mythtv/mythtv"
  echo -n "$t.$(git show -s --format=%cd --date=short | tr -d -).$(git rev-parse --short=8 HEAD)"
}

prepare() {
  cd "$srcdir/mythtv/mythtv"

  git clean -xfd

  local src
  for src in "${source[@]}"; do
    src="${src%%::*}"
    src="${src##*/}"
    [[ $src = *.patch ]] || continue
    msg2 "Applying patch $src..."
    patch -Np1 < "../../$src"
  done
}

build() {
  cd "$srcdir/mythtv/mythplugins"

  ./configure --prefix=/usr \
              --enable-all
  qmake-qt5 mythplugins.pro
  make -s
}

package_mythplugins-mytharchive-git() {
  pkgdesc="Create DVDs or archive recorded shows in MythTV"
  depends=('dvdauthor' 'dvd+rw-tools' "mythtv-git>=$t" 'python-pillow')
  conflicts=('mythplugins-mytharchive')
  replaces=('mythplugins-mytharchive')

  cd "$srcdir/mythtv/mythplugins/mytharchive"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythbrowser-git() {
  pkgdesc="Mini web browser for MythTV"
  depends=("mythtv-git>=$t")
  conflicts=('mythplugins-mythbrowser')
  replaces=('mythplugins-mythbrowser')

  cd "$srcdir/mythtv/mythplugins/mythbrowser"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythgame-git() {
  pkgdesc="Game emulator plugin for MythTV"
  depends=("mythtv-git>=$t" 'minizip')
  conflicts=('mythplugins-mythgame')
  replaces=('mythplugins-mythgame')

  cd "$srcdir/mythtv/mythplugins/mythgame"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythmusic-git() {
  pkgdesc="Music playing plugin for MythTV"
  depends=("mythtv-git>=$t" 'libcdio-paranoia')
  conflicts=('mythplugins-mythmusic')
  replaces=('mythplugins-mythmusic')

  cd "$srcdir/mythtv/mythplugins/mythmusic"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythnews-git() {
  pkgdesc="News checking plugin for MythTV"
  depends=("mythtv-git>=$t")
  conflicts=('mythplugins-mythnews')
  replaces=('mythplugins-mythnews')

  cd "$srcdir/mythtv/mythplugins/mythnews"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythweather-git() {
  pkgdesc="Weather checking plugin for MythTV"
  depends=("mythtv-git>=$t" 'perl-date-manip' 'perl-json' 'perl-soap-lite'
           'perl-xml-simple' 'perl-xml-xpath' 'perl-image-size'
           'perl-datetime-format-iso8601')
  conflicts=('mythplugins-mythweather')
  replaces=('mythplugins-mythweather')

  cd "$srcdir/mythtv/mythplugins/mythweather"
  make INSTALL_ROOT="$pkgdir" install
}

package_mythplugins-mythzoneminder-git() {
  pkgdesc="View CCTV footage from zoneminder in MythTV"
  depends=("mythtv-git>=$t" 'mariadb-libs' 'zoneminder')
  conflicts=('mythplugins-mythzoneminder')
  replaces=('mythplugins-mythzoneminder')

  cd "$srcdir/mythtv/mythplugins/mythzoneminder"
  make INSTALL_ROOT="$pkgdir" install
}
