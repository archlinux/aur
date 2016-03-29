# Maintainer: Alad Wenter `base32 -d <<< MFWGCZCAMFZGG2DMNFXHK6BONFXGM3YK`
# Contributor: Michael Manley <mmanley@nasutek.com>
# Contributor: Pawel 'l0ner' Soltys <pwslts@gmail.com>
# Contributor: Calvin Morrison <MutantTurkey@gmail.com>
# Contributor: David C. Rankin <drankinatty at gmail dot com>

pkgname=tde-tqt3
pkgver=14.0.3
pkgrel=1
pkgdesc='TQt3 gui toolkit'
arch=('i686' 'x86_64')
url='http://scm.trinitydesktop.org/scm/git/tqt3'
license=('GPL')
groups=('tde-core' 'tde-base')
options=('staticlibs' 'libtool' '!emptydirs' '!strip')
depends=('libjpeg-turbo' 'libmng' 'libmariadbclient' 'libpng'
	 'libxcursor' 'libxft' 'libxinerama' 'libxmu' 'libxrandr'
	 'mesa' 'postgresql-libs')
makedepends=('libcups' 'libiodbc' 'libxi' 'postgresql' 'mariadb'
             'unixodbc')  
optdepends=('cups: printing support'
            'postgresql: database support'
	    'unixodbc: database support'
            'mariadb: database support')
provides=('qt3' 'tqt3')
replaces=('qt3' 'qt3-enhanced' 'trinity-tqt3')
source=(http://tde-mirror.yosemite.net/trinity/releases/R"$pkgver"/dependencies/tqt3-R"$pkgver".tar.bz2
        tqt3.{sh,conf})
install='tqt3.install'
sha512sums=('09d730aa576a7593002c4d9463184d061a5789f34349f32c0c849174ed5b2422997f3db55344977b58beb7a7dd37ec3e75f1bd01339d28c062360b545e219870'
            'b043d2b924afedbd09d8a2b1ceacf80663d57e05245f00443f0e09a74cc1e73f517a1611bc9bc976e3df41d6aa14f2669472235916d952c08bd1487c93132fed'
            'c2ca13204e2c916eab016dda0fc1b5dd3b614fe4595df3cf6d87eb99d145d0e49c8fcec9d6f7296db0f335c2a5a271f82d875e30f39c220261c0ef8dc4f81aa4')
#validpgpkeys=() # XXX: .gpg is available

prepare() {
  cd dependencies/tqt3

  # /etc/makepkg.conf CXXFLAGS
  sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++/qmake.conf
  sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++-32/qmake.conf
  sed -i "s|-O2|$CXXFLAGS|" mkspecs/linux-g++-64/qmake.conf
  sed -i "s|-I. |$CXXFLAGS -I. |" qmake/Makefile.unix

  # Fix commits 4412d295 and 18696899 that broke tqca-tls
  sed -i 's|lib64|lib|g' mkspecs/linux-g++-64/qmake.conf

  # XXX: accept license
  sed -i "s|read acceptance|acceptance=yes|" configure
}

build() {
  local _prefix=/opt/trinity/tqt3
  cd dependencies/tqt3
  
  export QTDIR=$PWD
  export PATH=$QTDIR/bin:$PATH
  export LD_LIBRARY_PATH=$QTDIR/lib:$LD_LIBRARY_PATH
  export QMAKESPEC=$QTDIR/mkspecs/linux-g++

  [[ $CARCH == x86_64 ]] && ARCH=-64

  # XXX: check why ipv6 is disabled
  ./configure \
      -prefix "$_prefix" \
      -sysconfdir /etc/tqt \
      -I/usr/include/mysql \
      -I/usr/include/postgresql/server \
      -I/usr/include/libiodbc \
      -lpq \
      -lmysqlclient \
      -L/usr/lib/mysql \
      -qt-gif \
      -system-zlib \
      -system-libpng \
      -system-libjpeg \
      -system-libmng \
      -plugin-imgfmt-png \
      -plugin-imgfmt-jpeg \
      -plugin-imgfmt-mng \
      -plugin-sql-mysql \
      -plugin-sql-psql \
      -plugin-sql-sqlite \
      -plugin-sql-odbc \
      -platform linux-g++$ARCH \
      -no-exceptions \
      -thread \
      -dlopen-opengl \
      -no-ipv6

  # fix /opt/qt/lib path
  if [[ $CARCH == x86_64 ]]; then
      sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "$QTDIR"/src/Makefile
      sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "$QTDIR"/tools/designer/designer/Makefile
      sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "$QTDIR"/tools/designer/editor/Makefile
      sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "$QTDIR"/tools/assistant/lib/Makefile
      sed -i "s|/opt/qt/lib64|/opt/qt/lib|g" "$QTDIR"/tools/designer/uilib/Makefile
  fi

  make
}

package() {
  local _prefix=$pkgdir/opt/trinity/tqt3
  cd dependencies/tqt3
  
  make INSTALL_ROOT="$pkgdir" install

  # /opt/trinity/tqt3 prefix
  install -D -m755 tqt3.conf "$pkgdir"/etc/ld.so.conf.d/tqt3.conf
  install -D -m755 tqt3.sh "$pkgdir"/etc/profile.d/tqt3.sh

  # New links providing old package functionality (3rd party packages
  # are unlikely to build, unless updated to use new name references)
  for i in assistant designer linguist lrelease lupdate moc uic; do
    ln -sf /opt/trinity/tqt3/bin/tq"$i" "$_prefix"/bin/"$i"
  done

  ln -sf /opt/trinity/tqt3/bin/tqmake "$_prefix"/bin/qmake
  ln -sf /opt/trinity/tqt3/bin/tqtconfig "$_prefix"/bin/qtconfig

  # remove any link to the compiled libraries present in $srcdir,
  # which won't be present in non-building system.
  sed -i "s|-L$srcdir/tqt3/lib ||g" "$_prefix"/lib/*.prl

  # missing include "qglobal.h" in include/qtimer.h fix
  sed -i 's/define TQTIMER_H/&\n#include "ntqglobal.h"/' "$_prefix"/include/ntqtimer.h
}
