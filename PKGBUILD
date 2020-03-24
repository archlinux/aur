# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgbase=openss7-git
_pkgbase=openss7
pkgname=('openss7-git' 'openss7-modules-git' 'openss7-modules-lts-git' 'openss7-java-git')
pkgver=1.1.8.468.g7c7fc62a9
pkgrel=1
pkgdesc="OpenSS7 Fast-STREAMS and Protocol Suites"
arch=('x86_64' 'i686')
url="http://www.openss7.org"
license=('AGPL3')
depends=('binutils')
makedepends=('doxygen' 'gcc6-gcj' 'gcc-libs' 'ghostscript' 'gjdoc' 'glibc'
	     'gnupg' 'gnuplot' 'imagemagick' 'latex2html' 'linux'
	     'linux-headers' 'linux-lts' 'linux-lts-headers' 'lsof'
	     'net-snmp' 'openssl' 'swig' 'systemd' 'tcl' 'texlive-bin'
	     'texlive-core' 'transfig' 'gawk' 'classpath' 'popt' 'zip' 'git')
conflicts=("$_pkgbase" 'strigi')
options=('!emptydirs' '!distcc' '!makeflags')
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
  [ -x configure ] || autoreconf -fi

  cd "$srcdir"
  cp -au openss7-git openss7-modules-git
  cp -au openss7-git openss7-modules-lts-git
}

build() {
  cd "$srcdir/openss7-git"

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-modpost.cache
  _cache_file=../$CARCH-config.cache

  _knm="-lts"
  _kvd="5.4.27-1"
  _kvo=""
  _kvv="$(pacman -Qi linux${_knm}|awk '/^Version/{print$3;exit}')" || \
  _kvv="$(pacman -Si linux${_knm}|awk '/^Version/{print$3;exit}')"
  _kvv="${_kvv:-${_kvd}}"
  _kvr="${_kvv:+${_kvv}${_knm}}"
  _kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"


  set -x
  ./configure \
      KCC="gcc" \
      GCJ="gcj" \
      CXX="g++-6" \
      CPPFLAGS="$CPPFLAGS" \
      CFLAGS="$CFLAGS" \
      CXXFLAGS="$CXXFLAGS" \
      LDFLAGS="$LDFLAGS" \
      DEBUG_CFLAGS="$DEBUG_CFLAGS" \
      DEBUG_CXXFLAGS="$DEBUG_CXXFLAGS" \
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
      --with-k-release=$_kvr \
      --with-k-subdir=extramodules/openss7 \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --enable-k-test \
      --with-gnu-ld \
      --disable-modules
  # Fight unused direct deps
  sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0 /g' -e 's/    if test "$export_dynamic" = yes && test -n "$export_dynamic_flag_spec"; then/      func_append compile_command " -Wl,-O1,--as-needed"\n      func_append finalize_command " -Wl,-O1,--as-needed"\n\0/' libtool
  set +x
  make

  cd "$srcdir/openss7-modules-lts-git"

  _knm="-lts"
  _kvd="5.4.27-1"
  _kvo=""
  _kvv="$(pacman -Qi linux${_knm}|awk '/^Version/{print$3;exit}')" || \
  _kvv="$(pacman -Si linux${_knm}|awk '/^Version/{print$3;exit}')"
  _kvv="${_kvv:-${_kvd}}"
  _kvr="${_kvv:+${_kvv}${_knm}}"
  _kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-$_kvr-modpost.cache
  _cache_file=../$CARCH-$_kvr-config.cache

  set -x
  ./configure \
      KCC="gcc" \
      GCJ="gcj" \
      CXX="g++-6" \
      CPPFLAGS="$CPPFLAGS" \
      CFLAGS="$CFLAGS" \
      CXXFLAGS="$CXXFLAGS" \
      LDFLAGS="$LDFLAGS" \
      DEBUG_CFLAGS="$DEBUG_CFLAGS" \
      DEBUG_CXXFLAGS="$DEBUG_CXXFLAGS" \
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
      --with-k-subdir=extramodules/openss7 \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --enable-k-test \
      --with-gnu-ld \
      --disable-docs \
      --disable-tools
  set +x
  make -j1

  cd "$srcdir/openss7-modules-git"

  _knm=""
  _kvd="5.5.11-arch1-1"
  _kvo=""
  _kvv="$(pacman -Qi linux${_knm}|awk '/^Version/{print$3;exit}')" || \
  _kvv="$(pacman -Si linux${_knm}|awk '/^Version/{print$3;exit}')"
  _kvv="${_kvv:-${_kvd}}"
  _kvr="${_kvv:+${_kvv}${_knm}}"
  _kvr="$(echo $_kvr|sed -e 's,\.arch,-arch,')"
  _kvx="$(echo $_kvr|sed -e 's,\.arch*,,')"

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-$_kvr-modpost.cache
  _cache_file=../$CARCH-$_kvr-config.cache

  set -x
  ./configure \
      KCC="gcc" \
      GCJ="gcj" \
      CXX="g++-6" \
      CPPFLAGS="$CPPFLAGS" \
      CFLAGS="$CFLAGS" \
      CXXFLAGS="$CXXFLAGS" \
      LDFLAGS="$LDFLAGS" \
      DEBUG_CFLAGS="$DEBUG_CFLAGS" \
      DEBUG_CXXFLAGS="$DEBUG_CXXFLAGS" \
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
      --with-k-subdir=extramodules/openss7 \
      --with-k-optimize=speed \
      --with-optimize=speed \
      --enable-k-test \
      --with-gnu-ld \
      --disable-docs \
      --disable-tools
  set +x
  make -j1
}

package_openss7-git() {
  pkgdesc="OpenSS7 Fast-STREAMS and Protocol Suites"
  backup=('etc/snmp/snmp.d/01openss7'
          'etc/sock2path.d/openss7')
  provides=("$_pkgbase")
  conflicts=("$_pkgbase" 'strigi' 'lksctp-tools' 'strace')
  depends=('binutils' 'net-snmp' 'gawk' 'popt' "$_pkgbase-kernel-git")
  depends_x86_64=('lib32-glibc')
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
  rm -f "$pkgdir/usr/lib/systemd/system/multi-user.target.*"
}

package_openss7-modules-git() {
  _knm=""
  _kvd="5.5.11-arch1-1"
  _kvo=""
  _kvv="$(pacman -Qi linux${_knm}|awk '/^Version/{print$3;exit}')" || \
  _kvv="$(pacman -Si linux${_knm}|awk '/^Version/{print$3;exit}')"
  _kvv="${_kvv:-${_kvd}}"
  _kvr="${_kvv:+${_kvv}${_knm}}"
  _kvr="$(echo $_kvr|sed -e 's,\.arch,-arch,')"
  _kvx="$(echo $_kvr|sed -e 's,\.arch*,,')"
# _kvn="$(echo $_kvr | sed -e 's,-.*$,,')"
# _kvl="$(echo $_kvr | sed -e 's,\.[0-9][0-9]*-.*$,,')"
# _kvi="$(echo $_kvl | sed -e 's,.*\.,,')"
# _kvi=$((_kvi+1))
# _kvu="5.$_kvi"
  pkgdesc="OpenSS7 Fast-STREAMS and protocol Suites (${_kvx:-ARCH} Kernel Modules)"
  provides=("$_pkgbase-kernel=$pkgver"
            "$_pkgbase-kernel-git=$pkgver"
            "$_pkgbase-modules=$pkgver")
  conflicts=("$_pkgbase-modules")
  depends=("linux${_knm}${_kvv:+=$_kvv}")
# depends=("$pkgbase" "linux${_knm}=${_kvv:+=$_kvv}")
# depends=("$pkgbase" "linux${_knm}>=$_kvl" "linux${_knm}<$_kvu")
  options=('!emptydirs' '!strip')

  cd "$srcdir"/openss7-modules-git
  make DESTDIR="$pkgdir" install-strip
  rm -fr "$pkgdir/usr/bin"
  rm -fr "$pkgdir/usr/lib/openss7"
  rm -fr "$pkgdir/usr/share/doc"
  d="$pkgdir/usr/lib/modules/${_kvr}/build/openss7"
  install -d "$d"
  install -m644 ../$CARCH-config.site            "$d"
  install -m644 ../$CARCH-$_kvr-modpost.cache    "$d"
  install -m644 ../$CARCH-$_kvr-config.cache     "$d"
  install -m644 Module.mkvars                    "$d"
  install -m644 System.symvers                   "$d"
  install -m644 Module.symvers                   "$d"
  install -m644 config.h                         "$d"
  cat System.symvers Module.symvers | gzip -9 -c >symvers-${_kvr}.gz
  install -m644 symvers-${_kvr}.gz               "$d"
  cat Module.symvers|awk '{print$4"\t"$3"\t"$1"\t"$2}' >abi-${_kvr}
  install -m644 abi-${_kvr}                      "$d"
  install -m644 symsets-${_kvr}.tar.gz           "$d"
# install -d "$pkgdir"/usr/lib/modules/extramodules-${_kvx}${_knm}
# mv -f "$pkgdir"/usr/lib/modules/${_kvr}/extramodules/openss7 \
#       "$pkgdir"/usr/lib/modules/extramodules-${_kvx}${_knm}
  install -d "$pkgdir"/usr/src
  ln -s ../lib/modules/${_kvr}/build/openss7 \
        "$pkgdir"/usr/src/$_pkgbase-modules-$pkgver-$pkgrel
}

package_openss7-modules-lts-git() {
  _knm="-lts"
  _kvd="5.4.27-1"
  _kvo=""
  _kvv="$(pacman -Qi linux${_knm}|awk '/^Version/{print$3;exit}')" || \
  _kvv="$(pacman -Si linux${_knm}|awk '/^Version/{print$3;exit}')"
  _kvv="${_kvv:-${_kvd}}"
  _kvr="${_kvv:+${_kvv}${_knm}}"
  _kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"
# _kvn="$(echo $_kvr | sed -e 's,-.*$,,')"
# _kvl="$(echo $_kvr | sed -e 's,\.[0-9][0-9]*-.*$,,')"
# _kvi="$(echo $_kvl | sed -e 's,.*\.,,')"
# _kvi=$((_kvi+1))
# _kvu="4.$_kvi"
  pkgdesc="OpenSS7 Fast-STREAMS and protocol Suites (${_kvx:-LTS} Kernel Modules)"
  provides=("$_pkgbase-kernel=$pkgver"
            "$_pkgbase-kernel-git=$pkgver"
            "$_pkgbase-modules-lts=$pkgver")
  conflicts=("$_pkgbase-modules-lts")
  depends=("linux${_knm}${_kvv:+=$_kvv}")
# depends=("$pkgbase" "linux${_knm}=${_kvv:+=$_kvv}")
# depends=("$pkgbase" "linux${_knm}>=$_kvl" "linux${_knm}<$_kvu")
  options=('!emptydirs' '!strip')

  cd "$srcdir"/openss7-modules-lts-git
  make DESTDIR="$pkgdir" install-strip
  rm -fr "$pkgdir/usr/bin"
  rm -fr "$pkgdir/usr/lib/openss7"
  rm -fr "$pkgdir/usr/share/doc"
  d="$pkgdir/usr/lib/modules/${_kvr}/build/openss7"
  install -d "$d"
  install -m644 ../$CARCH-config.site            "$d"
  install -m644 ../$CARCH-$_kvr-modpost.cache    "$d"
  install -m644 ../$CARCH-$_kvr-config.cache     "$d"
  install -m644 Module.mkvars                    "$d"
  install -m644 System.symvers                   "$d"
  install -m644 Module.symvers                   "$d"
  install -m644 config.h                         "$d"
  cat System.symvers Module.symvers | gzip -9 -c >symvers-${_kvr}.gz
  install -m644 symvers-${_kvr}.gz               "$d"
  cat Module.symvers|awk '{print$4"\t"$3"\t"$1"\t"$2}' >abi-${_kvr}
  install -m644 abi-${_kvr}                      "$d"
  install -m644 symsets-${_kvr}.tar.gz           "$d"
# install -d "$pkgdir"/usr/lib/modules/extramodules-${_kvx}${_knm}
# mv -f "$pkgdir"/usr/lib/modules/${_kvr}/extramodules/openss7 \
#       "$pkgdir"/usr/lib/modules/extramodules-${_kvx}${_knm}
  install -d "$pkgdir"/usr/src
  ln -s ../lib/modules/${_kvr}/build/openss7 \
        "$pkgdir"/usr/src/$_pkgbase-modules-lts-$pkgver-$pkgrel
}

package_openss7-java-git() {
  pkgdesc="OpenSS7 Fast-STREAMS and Protocol Suites (Java)"
  provides=("$_pkgbase-java=$pkgver")
  conflicts=("$_pkgbase-java")
  depends=("$pkgbase" 'gcc6-gcj' 'classpath')
  install="openss7-java-git.install"

  mv -fv "$srcdir/_java/usr" "$pkgdir/"
}

# vim: sw=2 et
