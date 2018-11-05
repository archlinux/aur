# Maintainer:  Chris Severance aur.severach aATt spamgourmet dott com
# Maintainer:  Lone_Wolf <lonewolf@xs4all.nl>
# Contributor: Steven She <mintcoffee@gmail.com>
# Contributor: vbPadre <vbPadre@gmail.com>

# TODO: cndrvcups-common-lb and cndrvcups-lb should be a single split package

set -u
#if [ ! -z "${BUILDDIR:-}" ] && [ "${BUILDDIR// /}" != "${BUILDDIR}" ]; then
#  BUILDDIR="/tmp/makepkg.${USER// /}"
#fi
pkgbase='cndrvcups-lb'
pkgname="${pkgbase}"
#_pkgver='3.40'; _commonver='3.80'; _dl='8/0100002708/17'
#_pkgver='3.50'; _commonver='3.90'; _dl='8/0100007658/05'
_pkgver='3.60'; _commonver='4.00'; _dl='0/0100009240/02'

pkgver="${_pkgver}"
pkgrel='1'
pkgdesc='CUPS Canon UFR II LIPSLX CARPS2 printer driver for LBP iR MF ImageCLASS ImageRUNNER Laser Shot i-SENSYS ImagePRESS ADVANCE printers and copiers'
arch=('i686' 'x86_64')
# Direct links to the download reference go bad on the next version. We want something that will persist for a while.
url='https://www.canon-europe.com/support/products/imagerunner/imagerunner-1730i.aspx'
#url='https://www.usa.canon.com/internet/portal/us/home/support/details/printers/black-and-white-laser/mf212w/imageclass-mf212w'
license=('custom')
depends=("cndrvcups-common-lb>=${_commonver}") # >= makes upgrades easier
depends_i686=('gcc-libs')
depends_i686+=('libxml2')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
optdepends_i686=('libjpeg6-turbo: improves printing results for color imageRUNNER/i-SENSYS LBP devices')
optdepends_x86_64=("${optdepends_i686[@]/#/lib32-}")
makedepends=('autoconf' 'automake')
makedepends+=('gzip')
conflicts=('cndrvcups-lb-cpca')
options=('!emptydirs' '!strip')
options+=('!libtool')
install="${pkgname}.install"
_srcdir="${pkgbase}-${pkgver}"
source=(
  "http://gdlp01.c-wss.com/gds/${_dl}/linux-UFRII-drv-v${_pkgver//\./}-uken.tar.gz"
  '0000-cgnplp-po-Makefile-quote-spaces.patch'
  'how-to.txt'
)
md5sums=('a613792136de44958a9953814ef0e6b6'
         '638b9668916f5973df0dba0526ba803a'
         'e9b4391436a9ccf730a4f6e8adc74657')
sha256sums=('a5bf2c2d53049ad64acf2ed8b6dc954ff261c4b996ce1cc81471e5baaf5e40cd'
            'b2e4185c66d42facb57783d3d4b7d571b826b8af23d66f60574e0604b3bfd0b7'
            '62c4bfe3e4155e5e805b51eaa4b9dd3581ba029259c2817d9ebe66077aad7280')
sha512sums=('c8b2abb2d0e9ccf972241dda5154c0ddd1ba9cfe6c721c242c40c90cf29e8d0b2c6a559907318cd191232f699a42425cc4148aebcaab6aa111f1cb5439777ce7'
            'cc24afbc841125dc3556ada8fa2fc9b432f9b648efe18f0f6c659fdf916fe22d80f5524340877696e896d7f4a00206ba54c89943290c08377cbfaa6c9569fc00'
            '736e1785c443c4d129c8801a127410012889f46691259e8a7f6a54106a0647beb5b6267aabb78b3ed0a1c7a9d8ce216e159515d3aad425812e5be52c8b58e4ee')

prepare() {
  set -u
  bsdtar -xf "linux-UFRII-drv-v${_pkgver//\./}-uken/Sources/${_srcdir}-1.tar.gz"

  cd "${_srcdir}"

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
  grep -v '^%' | \
  sed -e '# Convert spec %{VAR} to shell ${VAR}' \
      -e 's:%{:${:g' \
      -e '# Add autoreconf before autogen lines' \
      -e '# Some autogen left out --prefix. More than one --prefix dont cause problems so we can add it to all of them.' \
      -e 's:^./autogen.sh\b:autoreconf -fi\n& --prefix=${_prefix}:g ' \
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
  #fi

  local _vars; _setvars
  env "${_vars[@]}" \
  RPM_BUILD_ROOT="${pkgdir}" \
  sh -e -u -x 'make.install.Arch'

  _fin

  set +u
}

_fin() {
  # grep -he '^*ModelName:' "${pkgdir}/usr/share/cups/model"/*.ppd | sort -u > "${startdir}/models.${_pkgver}.txt"

  # Compressing hinders package compression which results in a much larger package
  gzip "${pkgdir}/usr/share/cups/model"/*.ppd

  # according to Gentoo ebuild v2.90 c3pldrv dlopens the absolute path
  # /usr/lib/libcnlbcm.so
  if [ "${CARCH}" = 'x86_64' ]; then
    ln -s '../lib32/libcnlbcm.so' -t "${pkgdir}/usr/lib/"
  fi

  cd "${srcdir}/${_srcdir}"
  if [ "$(vercmp "${pkgver}" '3.50')" -lt 0 ]; then
    install -Dpm644 LICENSE-*.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
    install -Dpm644 "${srcdir}/linux-UFRII-drv-v340-uken/Documents/guide-ufr2-3.4xUK.tar.gz" -t "${pkgdir}/usr/share/doc/${pkgname}/"
  else
    local _lics=(
      $(find -type 'f' -name 'LICENSE*.txt')
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
}
set +u
