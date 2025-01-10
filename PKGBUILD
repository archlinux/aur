# Maintainer:  dreieck

pkgbase=isdnutils
pkgname=(
  "isdnutils"
)
_debianver=dfsg1
_debianrel=10
_upstreamver=3.25
pkgver="${_upstreamver}+${_debianver}.${_debianrel}"
pkgrel=1
pkgdesc=""
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
  "coreutils"
  "gcc"
  "groff"           # for 'troff'.
  "imake"           # for 'xmkmf'.
  "linuxdoc-tools"  # for 'sgml2html' and 'sgml2txt'.
  "make"
  "ncurses"
  "perl"
  "tcl"
)
optdepends=(
  "bash: For 'vboxmail' and 'vboxplay'"${pkgdir}/usr/man/man${_manno}"."
  "libxcrypt: For 'vbox'."
  "ncurses: For 'vbox'."
  "perl: For 'isdn_cause'."
  "tcl: For 'vboxgetty'."
)
source=(
  "http://deb.debian.org/debian/pool/main/i/isdnutils/isdnutils_${_upstreamver}+${_debianver}.orig.tar.bz2"
  "http://deb.debian.org/debian/pool/main/i/isdnutils/isdnutils_${_upstreamver}+${_debianver}-${_debianrel}.debian.tar.xz"
  "01_adapt-for-y2025.patch"
  "config.in"  # Tries to activate as many features as possible. Some do not build (needs old linux ISDN headers, or some other older software).
)
sha256sums=(
  "f9b534d32ff3729e2254f380f64894bf04d51a49a5e9ab32bc8f9fa9cce6abf8" # Upstream source
  "96d2b8e22eaded6d4a4bd06893d9c31ee2743132996d232929143e1eda5be530" # Debian patches
  "e3ae5011c25eefefcbd963779fe5ef075e6ec24910082c948fadfd606a007b12" # 01_adapt-for-y2025.patch
  "80d1c87d676932683ff978c33ba960378ef15eeaeb229059dc42fe8bfc3d6cec" # config.in
)
backup=(
  "etc/isdn/isdn.conf"
  "etc/isdn/caller.conf"
  "etc/isdnlog/isdnlog.conf"
  "etc/vbox/vboxd.conf"
  "etc/vbox/vboxgetty.conf"
)
options+=('!lto' 'emptydirs')

_CFLAGSADDITIONS="-std=gnu11 -w -Wno-error=implicit-int -Wno-error=implicit-function-declaration -Wno-error=int-to-pointer-cast -Wno-error=int-conversion -Wno-error=incompatible-pointer-types"

prepare() {
  cd "${srcdir}"

  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
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

  for _patch in 01_adapt-for-y2025.patch; do
    printf '%s\n' "   > Applying patch '${_patch}' ..."
    patch -Np1 --follow-symlinks -i "${srcdir}/${_patch}"
  done

  cd eurofile
  ln -sv ../gpl-2.0.txt COPYING.authlib # 'COPYING.authlib' needs to be present, otherwise eurofile configuration aborts with missing source file 'COPYING.authlib'.
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  cp "${srcdir}/config" .config

  echo "e" | make config # Pipe "e" to stdin to exit the dialogue automatically and continue configuration.

  cd capiinfo
  printf '%s\n' "   > Fixing things in '$(basename "`pwd`")' ..."
  aclocal
  automake --add-missing
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  cd vbox
  printf '%s\n' "   > Fixing things in '$(basename "`pwd`")' ..."
  aclocal
  automake --add-missing
  autoreconf -f
  ./configure
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  cd rcapid
  printf '%s\n' "   > Fixing things in '$(basename "`pwd`")' ..."
  aclocal
  automake --add-missing
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  cd capifax
  printf '%s\n' "   > Fixing things in '$(basename "`pwd`")' ..."
  aclocal
  automake --add-missing
  autoreconf -f
  ./configure
  cd "${srcdir}/${pkgbase}-${_upstreamver}"
}

build() {
  cd "${srcdir}/${pkgbase}-${_upstreamver}"

  CFLAGS+=" ${_CFLAGSADDITIONS}"
  CXXFLAGS+=" ${_CFLAGSADDITIONS}"
  export CFLAGS
  export CXXFLAGS
  MAKEFLAGS="-j1"
  export MAKEFLAGS

  make -C vbox || true # Might fail on the first runs.
  make -C vbox || true # Might fail on the first runs.
  make -C vbox || true # Might fail on the first runs.
  make

  make -C Mini-FAQ
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
  install -Dvm755 scripts/isdncause "${pkgdir}/usr/bin/isdn_cause"
  install -Dvm755 -t "${pkgdir}/usr/share/doc/isdn4linux/Mini-FAQ" Mini-FAQ/isdn-faq.{txt,html}

  ## Fixup stuff:
  for _manbin in "vbox" "vboxcnvt" "vboxctrl" "vboxplay" "vboxbeep" "autovbox" "rmdtovbox" "vboxmode" "vboxtoau"; do
    mv -v "${pkgdir}/usr/man/${_manbin}" "${pkgdir}/usr/bin"/
  done
  for _manno in 1 5 8; do
    install -dvm755 "${pkgdir}/usr/share/man/man${_manno}"
    mv -v "${pkgdir}/usr/man/man${_manno}"/* "${pkgdir}/usr/share/man/man${_manno}"/
    rmdir "${pkgdir}/usr/man/man${_manno}"
  done
  rmdir "${pkgdir}/usr/man"
  mv -v "${pkgdir}/usr/sbin"/* "${pkgdir}/usr/bin"/
  rmdir "${pkgdir}/usr/sbin"
  chmod 0644 "${pkgdir}/etc/vbox"/{vboxd.conf,vboxgetty.conf}
  chmod 0755 "${pkgdir}/usr/bin"/{divertctrl,iprofd,isdnctrl,vboxbeep,vboxd,vboxgetty}
  install -dvm755 "${pkgdir}/usr/share/doc/isdn4linux/isdnutils"
  mv -v "${pkgdir}/usr/share/doc/vbox" "${pkgdir}/usr/share/doc/isdn4linux/isdnutils"/
  rmdir "${pkgdir}/var/run" # Already provided by package 'filesystem'

  install -Dvm644 -t "${pkgdir}/usr/share/doc/isdn4linux/isdnutils"     NEWS README
  install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"          gpl-2.0.txt lgpl-2.1.txt
  # install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}"          LEGAL.ipppcomp      # 'ipppcomp' is not built or installed, so no license note for it needed.
  # install -Dvm644 -t "${pkgdir}/usr/share/licenses/${pkgname}/ipppcomp" ipppcomp/README.LZS # 'ipppcomp' is not built or installed, so no license note for it needed.
}
