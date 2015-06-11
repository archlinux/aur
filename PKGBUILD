# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgbase=openss7-git
_pkgbase=openss7
pkgname=('openss7-git' 'openss7-modules-git' 'openss7-modules-lts-git' 'openss7-java-git')
pkgver=1.1.8.7.ge3ccfa1
pkgrel=1
pkgdesc="OpenSS7 Fast-STREAMS and Protocol Suites"
arch=('x86_64' 'i686')
url="http://www.openss7.org"
license=('AGPL3')
depends=()
makedepends=('doxygen' 'gcc-gcj' 'gcc-libs' 'ghostscript' 'gjdoc' 'glibc'
	     'gnupg' 'gnuplot' 'imagemagick' 'latex2html' 'linux'
	     'linux-headers' 'linux-lts' 'linux-lts-headers' 'lsof'
	     'net-snmp' 'openssl' 'swig' 'systemd' 'tcl' 'texlive-bin'
	     'texlive-core' 'transfig' 'gawk' 'java-environment' 'lm_sensors'
             'popt')
conflicts=("$_pkgbase" 'strigi')
options=('!emptydirs' 'ccache' '!distcc' '!makeflags')
#source=("$pkgbase::git+file:///u2/git/monavacon.git")
source=("$pkgbase::git+https://github.com/openss7/openss7.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgbase
  git describe --long --tags|sed -e 's,^openss7-,,;s,\.2[0-9]*-,-,;s,[-_],.,g'
}

prepare() {
  cd $pkgbase
  echo "$pkgver"|awk 'BEGIN{FS="."}{print$4"."$5}'>.pkgpatchlevel
  [ -x configure ] || autoreconf -fiv

  cd "$srcdir"
  cp -au openss7-git openss7-modules-git
  cp -au openss7-git openss7-modules-lts-git
}

build() {
  cd "$srcdir/openss7-git"

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-modpost.cache
  _cache_file=../$CARCH-config.cache

  ./configure \
      syslibdir=/usr/lib \
      sysbindir=/usr/bin \
      syssbindir=/usr/bin \
      CONFIG_SITE=${_csite_file} \
      MODPOST_CACHE=${_mpost_file} \
      --cache-file=${_cache_file} \
      --libdir=/usr/lib \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --docdir=/usr/share/doc/$_pkgbase \
      --disable-maintainer-mode \
      --disable-sysvinit \
      --disable-k-abi-support \
      --disable-k-weak-symbols \
      --enable-k-weak-modules \
      --disable-specfs-lock \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --with-gnu-ld \
      --disable-modules
  make

  cd "$srcdir/openss7-modules-git"

  _kvr="$(pacman -Qi linux|awk '/^Version/{print$3}')-ARCH"

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-$_kvr-modpost.cache
  _cache_file=../$CARCH-$_kvr-config.cache

  ./configure \
      syslibdir=/usr/lib \
      sysbindir=/usr/bin \
      syssbindir=/usr/bin \
      CONFIG_SITE=${_csite_file} \
      MODPOST_CACHE=${_mpost_file} \
      --cache-file=${_cache_file} \
      --libdir=/usr/lib \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --docdir=/usr/share/doc/$_pkgbase \
      --disable-maintainer-mode \
      --disable-static \
      --disable-sysvinit \
      --disable-k-abi-support \
      --disable-k-weak-symbols \
      --enable-k-weak-modules \
      --disable-specfs-lock \
      --with-k-release=$_kvr \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --with-gnu-ld \
      --disable-docs \
      --disable-tools
  make

  cd "$srcdir/openss7-modules-lts-git"

  _kvr="$(pacman -Qi linux-lts|awk '/^Version/{print$3}')-lts"

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-$_kvr-modpost.cache
  _cache_file=../$CARCH-$_kvr-config.cache

  ./configure \
      syslibdir=/usr/lib \
      sysbindir=/usr/bin \
      syssbindir=/usr/bin \
      CONFIG_SITE=${_csite_file} \
      MODPOST_CACHE=${_mpost_file} \
      --cache-file=${_cache_file} \
      --libdir=/usr/lib \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --libexecdir=/usr/lib \
      --docdir=/usr/share/doc/$_pkgbase \
      --disable-maintainer-mode \
      --disable-static \
      --disable-sysvinit \
      --disable-k-abi-support \
      --disable-k-weak-symbols \
      --enable-k-weak-modules \
      --disable-specfs-lock \
      --with-k-release=$_kvr \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --with-gnu-ld \
      --disable-docs \
      --disable-tools
  make
}

package_openss7-git() {
  pkgdesc="OpenSS7 Fast-STREAMS and Protocol Suites"
  backup=('etc/snmp/snmp.d/01openss7'
          'etc/sock2path.d/openss7')
  provides=("$_pkgbase")
  conflicts=("$_pkgbase" 'strigi' 'lksctp-tools' 'strace')
  depends=('net-snmp' 'gawk' 'lm_sensors' 'popt')
  optdepends=('perl-tk: for graphical utilities'
              'gtkdialog: for graphical utilities')
  options=('!emptydirs' 'strip' '!zipman')
  install="openss7-git.install"

  cd "$srcdir"/openss7-git
  make DESTDIR="$pkgdir" install-strip

  rm -fr "$srcdir/_java/usr/lib"
  mkdir -p "$srcdir/_java/usr/lib"
  mv -fv "$pkgdir/usr/lib/java"      "$srcdir/_java/usr/lib"
  mv -fv "$pkgdir/usr/lib/gcj"       "$srcdir/_java/usr/lib"
  rm -fr "$srcdir/_java/usr/share"
  mkdir -p "$srcdir/_java/usr/share"
  mv -fv "$pkgdir/usr/share/java"    "$srcdir/_java/usr/share"
  mv -fv "$pkgdir/usr/share/javadoc" "$srcdir/_java/usr/share"

  rm -frv "$pkgdir/usr/share/javadoc"
  rm -frv "$pkgdir/boot"
  rm -frv "$pkgdir/usr/lib/modules"
  rm -frv "$pkgdir/usr/src"
  for f in "$pkgdir"/usr/sbin/* ; do
    [ -f "$f" ] && mv -fv "$f" "$pkgdir/usr/bin"
  done
  rm -frv "$pkgdir/usr/sbin"
  sed -i -e '/Generated from/d' "$pkgdir/usr/lib/openss7/testsuite"
}

package_openss7-modules-git() {
  _kvv="$(pacman -Qi linux|awk '/^Version/{print$3}')"
  _kvr="${_kvv}-ARCH"
  _kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"
  _kvn="$(echo $_kvr | sed -e 's,-.*$,,')"
  _kvl="$(echo $_kvr | sed -e 's,\.[0-9][0-9]*-.*$,,')"
  _kvi="$(echo $_kvl | sed -e 's,.*\.,,')"
  _kvi=$((_kvi+1))
  _kvu="3.$_kvi"
  pkgdesc="OpenSS7 Fast-STREAMS and protocol Suites ($_kvx Kernel Modules)"
  provides=("$_pkgbase-kernel=$pkgver"
            "$_pkgbase-modules=$pkgver")
  conflicts=("$_pkgbase-modules")
  depends=("$pkgbase" "linux=$_kvv")
# depends=("$pkgbase" "linux>=$_kvl" "linux<$_kvu")
  options=('!emptydirs' '!strip')
  install="openss7-modules-git.install"

  cd "$srcdir"/openss7-modules-git
  make DESTDIR="$pkgdir" install-strip
  rm -fr "$pkgdir/usr/bin"
  rm -fr "$pkgdir/usr/lib/openss7"
  rm -fr "$pkgdir/usr/share/doc"
  d="$pkgdir/usr/src/$_pkgbase-$pkgver-$pkgrel/$_kvr"
  install -d "$d"
  b="$pkgdir/boot"
  install -d "$b"
  install -m644 ../$CARCH-$_kvr-config.cache     "$d"
  install -m644 ../$CARCH-config.site            "$d"
  install -m644 ../$CARCH-$_kvr-modpost.cache    "$d"
  install -m644 Module.mkvars                    "$d"
  install -m644 System.symvers                   "$d"
  install -m644 Module.symvers                   "$d"
  install -m644 config.h                         "$d"
  cat System.symvers Module.symvers | gzip -9 -c >symvers-${_kvr}.gz
  install -m644 symvers-${_kvr}.gz               "$d"
  install -m644 symvers-${_kvr}.gz               "$b"
  cat Module.symvers|awk '{print$4"\t"$3"\t"$1"\t"$2}' >abi-${_kvr}
  install -m644 abi-${_kvr}                      "$d"
  install -m644 abi-${_kvr}                      "$b"
  install -m644 symsets-${_kvr}.tar.gz           "$d"
  install -m644 symsets-${_kvr}.tar.gz           "$b"
  install -d "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-ARCH
  mv -f "$pkgdir"/usr/lib/modules/${_kvr}/updates/openss7 \
        "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-ARCH
  install -d "$pkgdir"/usr/lib/modules/${_kvr}/build/openss7
  mv -f "$pkgdir"/usr/src/${_pkgbase}-$pkgver-$pkgrel/$_kvr \
        "$pkgdir"/usr/lib/modules/${_kvr}/build/openss7
}

package_openss7-modules-lts-git() {
  _kvv="$(pacman -Qi linux-lts|awk '/^Version/{print$3}')"
  _kvr="${_kvv}-lts"
  _kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"
  _kvn="$(echo $_kvr | sed -e 's,-.*$,,')"
  _kvl="$(echo $_kvr | sed -e 's,\.[0-9][0-9]*-.*$,,')"
  _kvi="$(echo $_kvl | sed -e 's,.*\.,,')"
  _kvi=$((_kvi+1))
  _kvu="3.$_kvi"
  pkgdesc="OpenSS7 Fast-STREAMS and protocol Suites ($_kvx Kernel Modules)"
  provides=("$_pkgbase-modules-git=$pkgver"
            "$_pkgbase-kernel=$pkgver"
            "$_pkgbase-modules-lts=$pkgver")
  conflicts=("$_pkgbase-modules-lts")
  depends=("$pkgbase" "linux-lts=$_kvv")
# depends=("$pkgbase" "linux-lts>=$_kvl" "linux-lts<$_kvu")
  options=('!emptydirs' '!strip')
  install="openss7-modules-lts-git.install"

  cd "$srcdir"/openss7-modules-lts-git
  make DESTDIR="$pkgdir" install-strip
  rm -fr "$pkgdir/usr/bin"
  rm -fr "$pkgdir/usr/lib/openss7"
  rm -fr "$pkgdir/usr/share/doc"
  d="$pkgdir/usr/src/$_pkgbase-$pkgver-$pkgrel/$_kvr"
  install -d "$d"
  b="$pkgdir/boot"
  install -d "$b"
  install -m644 ../$CARCH-$_kvr-config.cache     "$d"
  install -m644 ../$CARCH-config.site            "$d"
  install -m644 ../$CARCH-$_kvr-modpost.cache    "$d"
  install -m644 Module.mkvars                    "$d"
  install -m644 System.symvers                   "$d"
  install -m644 Module.symvers                   "$d"
  install -m644 config.h                         "$d"
  cat System.symvers Module.symvers | gzip -9 -c >symvers-${_kvr}.gz
  install -m644 symvers-${_kvr}.gz               "$d"
  install -m644 symvers-${_kvr}.gz               "$b"
  cat Module.symvers|awk '{print$4"\t"$3"\t"$1"\t"$2}' >abi-${_kvr}
  install -m644 abi-${_kvr}                      "$d"
  install -m644 abi-${_kvr}                      "$b"
  install -m644 symsets-${_kvr}.tar.gz           "$d"
  install -m644 symsets-${_kvr}.tar.gz           "$b"
  install -d "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-lts
  mv -f "$pkgdir"/usr/lib/modules/${_kvr}/updates/openss7 \
        "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-lts
  install -d "$pkgdir"/usr/lib/modules/${_kvr}/build/openss7
  mv -f "$pkgdir"/usr/src/${_pkgbase}-$pkgver-$pkgrel/$_kvr \
        "$pkgdir"/usr/lib/modules/${_kvr}/build/openss7
}

package_openss7-java-git() {
  pkgdesc="OpenSS7 Fast-STREAMS and Protocol Suites (Java)"
  provides=("$_pkgbase-java=$pkgver")
  conflicts=("$_pkgbase-java")
  depends=("$pkgbase" 'gcc-gcj' 'java-environment')
  install="openss7-java-git.install"

  mv -fv "$srcdir/_java/usr" "$pkgdir/"
}

# vim: sw=2 et
