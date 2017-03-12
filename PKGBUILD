# Maintainer: Brian Bidulock <bidulock@openss7.org>
_kvv="$(pacman -Qi linux-lts41|awk '/^Version/{print$3}')"
_kvr="${_kvv:+${_kvv}-lts41}"
_kvx="$(echo $_kvr|sed -e 's,\.[0-9][0-9]*-.*,,')"
pkgname=openss7-modules-lts41-git
_pkgname=openss7-modules-lts41
pkgver=1.1.8.63.g45f1b08cd
pkgrel=1
pkgdesc="OpenSS7 Fast-STREAMS and protocol Suites (${_kvx:-LTS 4.1} Kernel Modules)"
arch=('x86_64' 'i686')
url="http://www.openss7.org"
license=('AGPL3')
depends=("linux-lts41${_kvv:+=$_kvv}")
#depends=("openss7-git" "linux-lts41${_kvv:+=$_kvv}")
makedepends=('doxygen' 'gcc-gcj' 'gcc-libs' 'ghostscript' 'gjdoc' 'glibc'
	     'gnupg' 'gnuplot' 'imagemagick' 'latex2html'
             'linux-lts41' 'linux-lts41-headers'
             'lsof' 'net-snmp' 'openssl' 'swig' 'systemd' 'tcl' 'texlive-bin'
	     'texlive-core' 'transfig' 'gawk' 'java-environment' 'lm_sensors'
             'popt')
conflicts=($_pkgname)
provides=("$_pkgname=$pkgver")
options=('!emptydirs' '!strip')
install="$pkgname.install"
source=("$pkgname::git+https://github.com/openss7/openss7.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --long --tags|sed -e 's,^openss7-,,;s,\.2[0-9]*-,-,;s,[-_],.,g'
}

prepare() {
  cd $pkgname
  echo "$pkgver"|awk 'BEGIN{FS="."}{print$4"."$5}'>.pkgpatchlevel
  [ -x configure ] || autoreconf -fi
}

build() {
  cd $pkgname

  _csite_file=../$CARCH-config.site
  _mpost_file=../$CARCH-$_kvr-modpost.cache
  _cache_file=../$CARCH-$_kvr-config.cache

  ./configure \
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
      --docdir=/usr/share/doc/$_pkgname \
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

package() {
  cd $pkgname
  make DESTDIR="$pkgdir" install-strip
  rm -fr "$pkgdir/usr/bin"
  rm -fr "$pkgdir/usr/lib/openss7"
  rm -fr "$pkgdir/usr/share/doc"
  d="$pkgdir/usr/src/$_pkgname-$pkgver-$pkgrel/$_kvr"
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
  install -d "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-lts41
  mv -f "$pkgdir"/usr/lib/modules/${_kvr}/updates/openss7 \
        "$pkgdir"/usr/lib/modules/extramodules-${_kvx}-lts41
  install -d "$pkgdir"/usr/lib/modules/${_kvr}/build/openss7
  mv -f "$pkgdir"/usr/src/${_pkgname}-$pkgver-$pkgrel/$_kvr \
        "$pkgdir"/usr/lib/modules/${_kvr}/build/openss7
}

# vim: sw=2 et
