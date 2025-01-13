# Maintainer:  dreieck

pkgbase=isdnutils
pkgname=(
  "isdnutils"
)
groups=("isdn4linux")
_debianver=dfsg1
_debianrel=10
_upstreamver=3.25
pkgver="${_upstreamver}+${_debianver}.${_debianrel}"
pkgrel=4
pkgdesc="Some utilities from the 'ISDN4Linux' project."
url="https://www.isdn4linux.de/"
arch=(
  "x86_64"
  "i686"
)
license=(
  "GPL-2.0-only"
  "LGPL-2.1-only"
)
depends=(
  "glibc"
  "libcapi"
)
makedepends=(
  "autoconf"
  "automake"
  "bzip2"
  "coreutils"
  "gcc"
  "groff"           # for 'troff'.
  "gzip"
  "imake"           # for 'xmkmf'.
  "libcrypt.so"
  "linuxdoc-tools"  # for 'sgml2html' and 'sgml2txt'.
  "make"
  "ncurses"
  "perl"
  "tcl"
)
optdepends=(
  "bash:            For 'vboxmail' and 'vboxplay'"
  "lame:            For 'vboxmail' (optional mp3 encoding)."
  "xingmp3enc:      For 'vboxmail' (optional mp3 encoding, alternative to 'lame')."
  "mime-construct:  For 'vboxmail'."
  "sox:             For 'vboxmail'."
  "libcrypt.so:     For 'vbox'."
  "ncurses:         For 'vbox'."
  "perl:            For 'isdn_cause', and some tools."
  "tcl:             For 'vboxgetty'."
)
provides=(
  "capifax=${pkgver}"
  "capiinfo=${pkgver}"
  "divertctrl=${pkgver}"
  "iprovd=${pkgver}"
  "ipppstats=${pkgver}"
  "isdn_cause=${pkgver}"
  "isdnctrl=${pkgver}"
  "isdnutils-doc=${pkgver}"
  "isdnvboxclient=${pkgver}"
  "isdnvboxserver=${pkgver}"
)
conflicts=(
  "capifax"
  "capiinfo"
  "divertctrl"
  "iprovd"
  "ipppstats"
  "isdn_cause"
  "isdnctrl"
  "isdnutils-doc"
  "isdnvboxclient"
  "isdnvboxserver"
)
source=(
  "http://deb.debian.org/debian/pool/main/i/isdnutils/isdnutils_${_upstreamver}+${_debianver}.orig.tar.bz2"
  "http://deb.debian.org/debian/pool/main/i/isdnutils/isdnutils_${_upstreamver}+${_debianver}-${_debianrel}.debian.tar.xz"  # Debian patches.
  "01_adapt-for-y2025.patch"  # Very old codebase needs more fixups.
  "02_adapt-for-y2025.patch"  # Fixups for 'isdnlog/tools'.
  "config.in"                 # Tries to activate as many features as possible. Some do not build (needs old linux ISDN headers, or some other older software).
)
sha256sums=(
  "f9b534d32ff3729e2254f380f64894bf04d51a49a5e9ab32bc8f9fa9cce6abf8" # Upstream source
  "96d2b8e22eaded6d4a4bd06893d9c31ee2743132996d232929143e1eda5be530" # Debian patches
  "e3ae5011c25eefefcbd963779fe5ef075e6ec24910082c948fadfd606a007b12" # 01_adapt-for-y2025.patch
  "591e35a4f5e03f9c57143d8225565476140c8ed9ad05dbc80389c9ebeba1112a" # 02_adapt-for-y2025.patch
  "80d1c87d676932683ff978c33ba960378ef15eeaeb229059dc42fe8bfc3d6cec" # config.in
)
backup=(
  "etc/isdn/caller.conf"
  'etc/isdn/callerid.conf'
  'etc/isdn/capi.conf'
  "etc/isdn/isdn.conf"
  "etc/isdnlog/isdnlog.conf"
  "etc/vbox/vboxd.conf"
  "etc/vbox/vboxgetty.conf"
)
options+=('!lto' 'emptydirs')
#options+=('!strip')
#options+=('debug') # 2025-01-12: Adding 'debug' options results in linking failure: '/usr/bin/ld: /tmp/ccZgFu9a.o: in function `getDest': ../dest.c:238:(.text+0x772): undefined reference to `formatNumber'' in 'isdnlog/tools/dest'. So, for debugging, add '!strip' instead and '-fno-stack-protector -fno-omit-frame-pointer -D_FORTIFY_SOURCE=0 -Og -fno-lto -gdwarf-5 -ggdb3 -gno-strict-dwarf -g3 -gpubnames -grecord-gcc-switches -fno-eliminate-unused-debug-symbols -fvar-tracking -fvar-tracking-assignments -fdebug-types-section' to the CFLAGS below.

_CFLAGSADDITIONS="-std=gnu11 -w -Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=int-to-pointer-cast -Wno-error=int-conversion -Wno-error=incompatible-pointer-types"
#_CFLAGSADDITIONS+=" -fno-omit-frame-pointer -D_FORTIFY_SOURCE=0 -Og -fno-lto -gdwarf-5 -ggdb3 -gno-strict-dwarf -g3 -gpubnames -grecord-gcc-switches -fno-eliminate-unused-debug-symbols -fvar-tracking -fvar-tracking-assignments -fdebug-types-section"
ACLOCAL_PATH="`aclocal --print-ac-dir`"
export ACLOCAL_PATH
PERL_USE_UNSAFE_INC=1
export PERL_USE_UNSAFE_INC

prepare() {
  cd "${srcdir}"

  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS} -std=gnu++14"
  export CFLAGS
  export CXXFLAGS
  MAKEFLAGS="-j1"
  export MAKEFLAGS

  _tclver="$(pacman -Qqi tcl | grep -E '^Version[[:space:]]*:' | awk -F: '{print $2}' | tr -d '[:space:]' | awk -F. '{print $1"."$2}')"
  sed "s|%%TCLVER%%|${_tclver}|g" config.in > config

  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  cat "${srcdir}/debian/patches/series" | while read _patch; do
    printf '%s\n' "   > Applying patch '${_patch}' ..."
    patch -Np1 --follow-symlinks -i "${srcdir}/debian/patches/${_patch}"
  done

  for _patch in 01_adapt-for-y2025.patch 02_adapt-for-y2025.patch; do
    printf '%s\n' "   > Applying patch '${_patch}' ..."
    patch -Np1 --follow-symlinks -i "${srcdir}/${_patch}"
  done

  cd eurofile
  ln -sv ../gpl-2.0.txt COPYING.authlib # 'COPYING.authlib' needs to be present, otherwise eurofile configuration aborts with missing source file 'COPYING.authlib'.
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  cp "${srcdir}/config" .config


  ## Very old codebase needs fixups.
  _automake_fixup() {
    local _olddir="`pwd`"
    if [ "$#" -ge 1 ]; then
      cd "$1"
    fi
    _cwdbase="$(basename "`pwd`")"
    printf '%s\n' "   > Fixing things in '${_cwdbase}' ..."
    autoupdate
    aclocal
    if [ -e "Makefile.am" ] || [ "${_cwdbase}" == "vbox" ] ; then
      automake --add-missing
    fi
    if [ "${_cwdbase}" != "isdnctrl" ] && [ "${_cwdbase}" != "isdnlog" ]; then
      autoreconf --install
      autoreconf -f
    fi

    cd "${_olddir}"
  }

  local _tofix
  for _tofix in eicon act2000 FAQ avmb1 capifax capiinfo capiinit eurofile hisax icn iprofd isdnctrl isdnlog loop rcapid vbox; do  # Do NOT fixup 'ipppstats', otherwise it will not configure anymore.
    _automake_fixup "${_tofix}"
  done

  echo "e" | make config # Pipe "e" to stdin to exit the dialogue automatically and continue configuration.  ## vbox needs it's fixup after general config

  ## 'capiinfo' does not get build automatically, so do it manually.
  cd capiinfo
    ./configure \
      --prefix=/usr \
      --bindir=/usr/bin \
      --sbindir=/usr/bin \
      --sysconfdir=/etc \
      --localstatedir=/var \
      --infodir=/usr/share/info \
      --mandir=/usr/share/man
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  ## 'isdnlog/tools' do not get build automatically (since 'isdnlog' is not configured since it does not build), so do it manually.
  cd isdnlog/tools
    local _tool
    for _tool in cdb dest zone; do
      pushd "${_tool}" > /dev/null
        ./configure \
          --prefix=/usr \
          --bindir=/usr/bin \
          --sbindir=/usr/bin \
          --sysconfdir=/etc \
          --localstatedir=/var \
          --infodir=/usr/share/info \
          --mandir=/usr/share/man
      popd > /dev/null
    done
  cd "${srcdir}/${pkgbase}-${_upstreamver}"
}

build() {
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS
  MAKEFLAGS="-j1"  # Otherwise build / linking of 'vbox' randomly fails due to race conditions.
  export MAKEFLAGS

  make
  ## 'Mini-FAQ' and 'capiinfo' do not get build automatically, so do it manually.
  make -C Mini-FAQ
  make -C capiinfo
  ## 'isdnlog/tools' do not get build automatically (since 'isdnlog' is not configured since it does not build), so do it manually.
  make -C isdnlog/tools all country holiday
  make -C isdnlog/tools/cdb all
  make -C isdnlog/tools/dest all alldata
  make -C isdnlog/tools/zone all at AT AT-1001 AT-1002 AT-1004 AT-1007 AT-1012 AT-1024 AT-1066 AT-pta cdb ch CH CH-10741 country de DE DE-dtag defaultzone nl NL NL-kpn mkzonedb zone zonefiles
}

package_isdnutils() {
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS
  MAKEFLAGS="-j1"
  export MAKEFLAGS

  install -dvm755 "${pkgdir}/usr/sbin" # Need to create this manually for the next step, other 'vbox' installation fails.
  make DESTDIR="${pkgdir}" install

  ## 'capiinfo' does not get installed automatically, so do it manually.
  make -C capiinfo DESTDIR="${pkgdir}" install

  ## 'isdnlog/tools' do not get build automatically (since 'isdnlog' is not configured since it does not build), so do it manually.
  install -Dvm755 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/bin" isdnlog/tools/{rate-at,country,holiday}
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools"     isdnlog/tools/{ChangeLog,NEWS}
  install -Dvm644 -t "${pkgdir}/usr/share/isdn/"                                      isdnlog/{*.dat,*.cdb}
  ### cdb:
  install -Dvm755 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/bin"     isdnlog/tools/cdb/{cdbdump,cdbget,cdbstats,cdbtest}
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/lib"     isdnlog/tools/cdb/{libfreecdb.a,libfreecdbmake.a}
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/include" isdnlog/tools/cdb/{freecdb.h,freecdbmake.h}
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb"         isdnlog/tools/cdb/debian/changelog
  local _manfile
  for _manfile in cdbget.1 cdbstats.1 cdbtest.1 cdbdump.1 cdbmake.1; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/share/man/man1" isdnlog/tools/cdb/"${_manfile}"
    gzip -9 "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/share/man/man1/${_manfile}"
  done
  for _manfile in cdb_hash.3 cdb_seek.3; do
    install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/share/man/man3" isdnlog/tools/cdb/"${_manfile}"
    gzip -9 "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/cdb/share/man/man3/${_manfile}"
  done
  ### dest:
  install -Dvm644 -t "${pkgdir}/usr/share/isdn"                                         isdnlog/tools/dest/{{airports,cities}.dat,dest.cdb}
  install -Dvm755 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/dest"  isdnlog/tools/dest/{dest,makedest,testdest,pp_rate}
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/dest"  isdnlog/tools/dest/{{airports,cities}.dat,dest.cdb}
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/dest"  isdnlog/tools/dest/{ChangeLog,README.*}
  ### zone:
  install -Dvm755 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/zone"  isdnlog/tools/zone/{compzone,ddb,mkzonedb,redzone,zone}
  install -dvm755 "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/zone"
  cp -rv isdnlog/tools/zone/{at,be,ch,cn,de,lu,nl,us}  "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/zone"/
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils/isdnlog/tools/zone"  isdnlog/tools/zone/ChangeLog

  ## 'isdn_cause' is a script which is just provided; needs manual install.
  install -Dvm755 scripts/isdncause "${pkgdir}/usr/bin/isdn_cause"
  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/Mini-FAQ" Mini-FAQ/isdn-faq.{txt,html}

  ## Fixup stuff:
  install -dvm755 "${pkgdir}/usr/share/doc/isdn4linux"
  mv -v "${pkgdir}/usr/doc"/vbox "${pkgdir}/usr/share/doc/isdn4linux"/
  rmdir "${pkgdir}/usr/doc"
  mv -v "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"/
  rmdir "${pkgdir}/usr/sbin"
  chmod 0644 "${pkgdir}/etc/vbox"/{vboxd.conf,vboxgetty.conf}
  chmod 0755 "${pkgdir}/usr/bin"/{divertctrl,iprofd,isdnctrl,vboxbeep,vboxd,vboxgetty}
  install -dvm755 "${pkgdir}/usr/share/doc/isdn4linux/isdnutils"
  rmdir "${pkgdir}/var/run" # Already provided by package 'filesystem'
  rmdir "${pkgdir}/var/lock" # Already provided by package 'filesystem'

  install -Dvm644 -t "${pkgdir}/etc/isdn"  "${srcdir}/debian"/{callerid,capi}.conf
  install -Dvm755 "${srcdir}/debian"/vboxmail.enhanced "${pkgdir}/usr/bin/vboxmail"  # Enhanced drop-in replacement for 'vboxmail'.
  ln -svr "${pkgdir}/usr/bin/vboxmail" "${pkgdir}/etc/isdn/vboxmail"

  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils"     NEWS README "${srcdir}/debian"/{HOWTO,README.HiSax,README.MPPP,README.multiple-ipppd,changelog}
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"          gpl-2.0.txt lgpl-2.1.txt "${srcdir}/debian"/copyright
  # install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"          LEGAL.ipppcomp      # 'ipppcomp' is not built or installed, so no license note for it needed.
  # install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/ipppcomp" ipppcomp/README.LZS # 'ipppcomp' is not built or installed, so no license note for it needed.
}
