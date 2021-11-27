# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>

set -u
#if [ ! -z "${BUILDDIR:-}" ] && [ "${BUILDDIR// /}" != "${BUILDDIR}" ]; then
#  BUILDDIR="/tmp/makepkg.${USER// /}"
#fi
pkgbase='cndrvcups-common-lb'
pkgname="${pkgbase}"
# used this name to avoid conflict with the existing cndrvcups-common (no longer in AUR) which was wrong version for cndrvcups-lb
#_pkgname='cndrvcups-common'
#_pkgver='3.40'; _commonver='3.80'; _dl='8/0100002708/17'
#_pkgver='3.50'; _commonver='3.90'; _dl='8/0100007658/05'
#_pkgver='3.60'; _commonver='4.00'; _dl='0/0100009240/02'
#_pkgver='3.70'; _commonver='4.10'; _dl='8/0100007658/08'
_pkgver='3.70'; _commonver='4.10'; _dl='4/0100010264/01'

pkgver="${_commonver}"
pkgrel='2'
pkgdesc='common printer driver modules for Canon cndrvcups-lb package, built from source'
arch=('i686' 'x86_64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
#url='https://www.usa.canon.com/internet/portal/us/home/support/details/printers/black-and-white-laser/mf212w/imageclass-mf212w'
license=('custom')
license+=('GPL' 'MIT')
depends=('libglade')
depends_i686=('gcc-libs')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
makedepends=('autoconf' 'automake')
makedepends+=('glib2' 'gtk2')
options=('!emptydirs' '!strip')
options+=('staticlibs')
_srcdir="${pkgname%-lb}-${pkgver}"
source=(
  "https://gdlp01.c-wss.com/gds/${_dl}/linux-UFRII-drv-v${_pkgver//\./}-uken-07.tar.gz"
  '0000-cgnplp-po-Makefile-quote-spaces.patch'
  '0002-c3plmod_ipc-Makefile-quote-spaces.patch'
)
md5sums=('35d69e337c7043d1adc4f5a496126d88'
         '638b9668916f5973df0dba0526ba803a'
         'd3484478d650132ab6cf5f0a820b9286')
sha256sums=('ff16438de55c982d649cdb20e262a54b13569e2320ed3e75b9c4b000c7bbdd06'
            'b2e4185c66d42facb57783d3d4b7d571b826b8af23d66f60574e0604b3bfd0b7'
            '2a769d95f443ce6bbb4b52a2d1819a7dcacf855ac38a21fea056941bdf3f4b72')
sha512sums=('d7ae9cd31a42a4e8284d058654182ae091c1e4e4d2f62a8e3ca9a89893af5769a6c03dd2a6d11e767cb30b003facf20adcf00438d026c21125968cee687d5bea'
            'cc24afbc841125dc3556ada8fa2fc9b432f9b648efe18f0f6c659fdf916fe22d80f5524340877696e896d7f4a00206ba54c89943290c08377cbfaa6c9569fc00'
            '1f98bf1341e2ed188d48640c49aef5209564ad9249b78d44ee53378c4cb5a4153ddbe53813523e2790c4adb314cd9047364e147dfa659d981f0f7d657a0d34fc')

prepare() {
  set -u
  bsdtar -xf "linux-UFRII-drv-v${_pkgver//\./}-uken/Sources/${_srcdir}-1.tar.gz"

  cd "${_srcdir}"

  # It isn't easy to get sed to add LIBS at the right place of the soon to be generated make script
  # so we patch it directly into autogen.sh
  sed -e '2a export LIBS="-lgtk-x11-2.0 -lgobject-2.0 -lglib-2.0 -lgmodule-2.0"' -i 'cngplp/autogen.sh'

  local _specs=(cndrvcups-*.spec)
  if [ "${#_specs[@]}" -ne 1 ]; then
    echo 'Too many or too few spec files'
    set +u
    false
  fi

  # allgen.sh where available is not useful for packaging
  # Debian rules has some undesirable functionality
  # The spec file packages well and is easy to fix and convert to shell

  # Generate make from spec %setup, %build
  sed -n -e '/^%setup/,/^%install/ p' "${_specs[@]}" | \
  sed -e '# fix cwd transitioning from setup to build before grep removes all the spec %control lines' \
      -e 's:^%build:'"cd '${srcdir}/${_srcdir}' # &:g" | \
  grep -v '^%' | \
  sed -e '# Convert spec %{VAR} to shell ${VAR}' \
      -e 's:%{:${:g' \
      -e '# Add autoreconf before autogen lines' \
      -e '# Some autogen left out --prefix. More than one --prefix dont cause problems so we can add it to all of them.' \
      -e 's:^./autogen.sh\b:autoreconf -i\n& --prefix=${_prefix}:g ' \
    > 'make.Arch'

  # Generate make install from spec %install
  sed -n -e '/^%install/,/^%clean/ p' "${_specs[@]}" | \
  grep -v '^%' | \
  sed -e '# Convert spec %{VAR} to shell ${VAR}' \
      -e 's:%{:${:g' \
      -e '# Quote to handle path with spaces' \
      -e 's:${RPM_BUILD_ROOT}:"&":g' \
      -e '# ln -f hides problems so should be avoided' \
      -e 's:ln -sf :ln -s :g' \
    > 'make.install.Arch'

  set +u
}

_setvars() {
  declare -A _lib32dirs=([i686]='lib' [x86_64]='lib32')
  _vars=(
    _bindir='/usr/bin'
    libs32="/usr/${_lib32dirs[${CARCH}]}"
    _libdir='/usr/lib'
    _prefix='/usr'
    _includedir='/usr/include'
    locallibs='/usr/lib/'
  )
}

build() {
  set -u

  cd "${_srcdir}"
  local _vars; _setvars
  CFLAGS+=' -fcommon'
  # Bash does not recognize var assigments hidden by array expansion so we use env.
  env "${_vars[@]}" \
  sh -e -u -x 'make.Arch'

  set +u
}

package() {
  set -u
  cd "${_srcdir}"

  #if [ "${BUILDDIR// /}" != "${BUILDDIR}" ]; then
    set +u; msg2 'paths with spaces patch'; set -u
    # Fix a Makefile space quoting bug https://bbs.archlinux.org/viewtopic.php?id=241671
    # diff -pNau5 'cndrvcups-common-4.00/cngplp/po/Makefile'{.orig,} > '0000-cgnplp-po-Makefile-quote-spaces.patch'
    if [ ! -s 'cngplp/po/Makefile.orig' ]; then
      patch -Nbup1 -i "${srcdir}/0000-cgnplp-po-Makefile-quote-spaces.patch"
    fi

    # Make libtool compatible with spaces in paths
    local _libtools=(*/libtool)
    local _libtool
    for _libtool in "${_libtools[@]}"; do
      cp -n -p "${_libtool}"{,.Arch}
      sed -e '/^\s\+func_show_eval "\$install/ s: \(\$[^ "]\+\)": \\"\1\\"":g' \
          -e '/^\s\+func_show_eval "\$install/ s: \(\\\$[^ "]\+\)": \\"\1\\"":g' \
          -e '# These errors do not halt the build' \
          -e '/eval\b/ s:"(cd \([$\\][^ ]\+\) :"(cd \\"\1\\" :g' \
          -e '/eval\b/ s:'"'"'(cd \([$\\][^ ]\+\) :'"'"'(cd "\1" :g' \
          -e '# Not sure why single quote works here.' \
          -e '/^old_postinstall_cmds=.* \\\$oldlib/ s:\\\$oldlib:'"'&':g" \
          -e '/^old_postinstall_cmds=.* \\\$tool_oldlib/ s:\\\$tool_oldlib:'"'&':g" \
        "${_libtool}.Arch" > "${_libtool}"
    done

    # Fix a Makefile space quoting bug
    # diff -pNau5 'cndrvcups-common-4.00/c3plmod_ipc/Makefile'{.orig,} > '0002-c3plmod_ipc-Makefile-quote-spaces.patch'
    if [ ! -s 'c3plmod_ipc/Makefile.orig' ]; then
      patch -Nbup1 -i "${srcdir}/0002-c3plmod_ipc-Makefile-quote-spaces.patch"
    fi
  #fi

  local _vars; _setvars
  env "${_vars[@]}" \
  RPM_BUILD_ROOT="${pkgdir}" \
  sh -e -u -x 'make.install.Arch'

  _fin

  set +u
}

_fin() {
  # according to Gentoo ebuild v2.90 c3pldrv dlopens the absolute path
  # /usr/lib/libc3pl.so
  if [ "${CARCH}" = 'x86_64' ]; then
    ln -s '../lib32/libc3pl.so' -t "${pkgdir}/usr/lib/"
  fi

  cd "${srcdir}/${_srcdir}"
  if [ "$(vercmp "${pkgver}" '3.50')" -lt 0 ]; then
    install -Dpm644 LICENSE-* -t "${pkgdir}/usr/share/licenses/${pkgname}/"
  else
    local _lics=(
      $(find -type 'f' -name 'LICENSE.txt')
    )
    local _lic _licd _lico
    for _lic in "${_lics[@]}"; do
      _licd="$(dirname "${_lic}")"
      _licd="$(basename "${_licd}")"
      _lico="LICENSE.${_licd}.txt"
      echo "license ${_lico}"
      install -Dpm644 "${_lic}" "${pkgdir}/usr/share/licenses/${pkgname}/${_lico}"
    done
  fi
  install -Dpm644 README* -t "${pkgdir}/usr/share/doc/${pkgname}/"

  # The filter works in /usr/bin but it's expected in .../cups/filter/
  install -d "${pkgdir}/usr/lib/cups/filter/"
  ln -s '/usr/bin/c3pldrv' -t "${pkgdir}/usr/lib/cups/filter/"
}
set +u
