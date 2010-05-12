# Maintainer: Marti Raudsepp <marti@juffo.org>

pkgname=reconnoiter-svn
pkgver=1275
pkgrel=1
pkgdesc="Software for monitoring, trending and fault analysis of servers or data centers"
arch=(i686 x86_64)
url="https://labs.omniti.com/trac/reconnoiter"
license=('BSD')
depends=('ncurses' 'libxml2' 'libxslt' 'apr' 'pcre')
makedepends=('subversion' 're2c' 'jdk' 'perl')
# optdepends should be turned into makedeps when including this in Arch, as
# ./configure picks them up and creates modules when they're available
optdepends=('libssh2' 'net-snmp' 'jre' 'libmysqlclient' 'postgresql-libs')
provides=('reconnoiter')
conflicts=('reconnoiter')
source=()
md5sums=() #generate with 'makepkg -g'

_svntrunk=https://labs.omniti.com/reconnoiter/trunk
_svnmod=reconnoiter

# uncomment this to build Urskek release -- presumably a little more stable
#_svntrunk=https://labs.omniti.com/reconnoiter/tags/urskek

build() {
  cd "$srcdir"

  if [ -d $_svnmod/.svn ]; then
    (cd $_svnmod && svn up -r $pkgver)
  else
    svn co $_svntrunk --config-dir ./ -r $pkgver $_svnmod
  fi

  msg "SVN checkout done or server timeout"
  msg "Starting make..."

  rm -rf "$srcdir/$_svnmod-build"
  cp -r "$srcdir/$_svnmod" "$srcdir/$_svnmod-build"
  cd "$srcdir/$_svnmod-build"

  # patch up; reconnoiter expects awk in /usr/bin/awk
  sed -i 's|/usr/bin/awk|/bin/awk|' src/noitedit/makelist

  # yes, this is a braindead location to install .jars, but oh well!
  install -d "$pkgdir/usr/java/lib"

  # start build
  autoconf
  ./configure --prefix=/usr --sysconfdir=/etc/reconnoiter --libexecdir=/usr/libexec

  # wtf? they think Linux has DTrace?!
  sed -i 's|#define DTRACE_ENABLED 1||' src/noit_config.h
  make || return 1
  make DESTDIR="$pkgdir/" install

  install -d "$pkgdir/usr/share/licenses/reconnoiter-svn"
  install LICENSE "$pkgdir/usr/share/licenses/reconnoiter-svn"
}

