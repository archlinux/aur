# Maintainer: dreieck
# Previous maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Jouke Witteveen <j.witteveen@gmail.com>

_pkgname='netcfg'
pkgname='netcfg-git'
pkgver=4.0.rg54f4656
pkgrel=2
pkgdesc="Network configuration and profile scripts (install only if you really know that you want this instead of netctl). Includes patch to make wifi-menu work, OpenRC and systemd initscripts."
url='https://github.com/GNU-Pony/netcfg/'
arch=(any)
license=(BSD)

install='netcfg.install'

backup=(
  'etc/iftab'
  'etc/conf.d/netcfg'
)

groups=("base")

depends=(
  "bash>=4.0"
  'coreutils'
  'dhcpcd'
  'findutils'
  'grep'
  'iproute2'
  'sed'
)

makedepends=(
  "auto-auto-complete" # For generating shell auto-completion.
  "gzip" # For compressing manpages.
  "texinfo" # For generating info manual.
  "texman" # For generating manpages.
)

optdepends=(
    'bridge-utils: for bridge connections.'
    'dialog: for the menu based profile and wifi selectors.'
    'dhclient: for DHCPv6.'
    'ifenslave: for bond connections.'
    'ifplugd: for automatic wired connections through net-auto-wired.'
    'wireless_tools: for interface renaming through net-rename.'
    'wpa_actiond: for automatic wireless connections through net-auto-wireless.'
    'wpa_supplicant: for wireless networking support.'
)

provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-openrc=${pkgver}"
  "${_pkgname}-systemd=${pkgver}"
)

replaces=(
  "${_pkgname}<=${pkgver}"
)

conflicts=(
  "netctl"
  "${_pkgname}"
)

_source_base="https://github.com/GNU-Pony/${_pkgname}"

source=(
  "${_pkgname}-master.zip::${_source_base}/archive/master.zip" # NOTE: We download as a .zip-file such that we can have a checksum. We do it here for security, knowing that we don't download a fixed version and that we need to update the sha256sum when a new commit has been done. Although, this project does not seem to update often.
  "netcfg.openrc"
  "netcfg.conf"
  "netcfg.bash-completion_extended"
  "netcfg.zsh-completion_extended"
  "newer-wpasupplicant.patch"
  "Makefile.deduplicate-examples.patch"
  "${install}"
)

sha256sums=(
  "0ac7179314e73596fcd371de402af61291113fec66f2de2f25ed93d98803bfa7"
  "4a21fb2a8eed541ff23ef93e8150607074d40f248fa923fcede27102ed2944da"
  "0525757fb59b9174f2c3bbc9828bb4590f89144f0506cadf13dafa0b76ec3e14"
  "a353438378891f711902f13d4df5e19dfcde756b453bb865c0f6660e3c1bc68f"
  "11573dbda8cc38968b2f4a7a58ebf71dc2094d2b925dca3026a8c33614643a9c"
  "14ed9b1d7072b6fee27094a4b35c6d35ad793766a432febfb613451f4af2214c"
  "1d10981f419c580f7a47150502acccf61139477e3abeae7bfcc3eec384787222"
  "07c16d4de52acc97abe2633b5a3cf077bac6924159b47474c93d936816846468"
)

_upk_base="${_pkgname}-master"

pkgver() {
  _unpackeddir="${srcdir}/${_upk_base}"
  cd "${_unpackeddir}"
  
  _ver="$(cat CHANGELOG | grep -Ei 'version[[:space:]]+[0-9\.]*' | head -n 1 | grep '' | awk '{print $2}')"
  
  _rev="$(git ls-remote --exit-code "${_source_base}.git" "refs/heads/master" | head -c 7)"
  
  if [ -z "${_ver}" ]; then
    echo "$0: Error: Could not determine version." > /dev/stderr
    false
    return 1
  fi
  
  if [ -z "${_rev}" ]; then
    echo "$0: Error: Could not determine SVN revision." > /dev/stderr
    false
    return 1
  else
    _rev="g${_rev}"
  fi
  
  echo "${_ver}.r${_rev}"
}

prepare() {
  _unpackeddir="${srcdir}/${_upk_base}"
  cd "${_unpackeddir}"
  
  for _patch in "${srcdir}"/*.patch; do
    msg "Applying patch '${_patch}' ..."
    patch -p1 < "${_patch}"
  done
}

build() {
  _unpackeddir="${srcdir}/${_upk_base}"
  cd "${_unpackeddir}"
  
  make
}

package() {
  _unpackeddir="${srcdir}/${_upk_base}"
  cd "${_unpackeddir}"
  
  ### Core, manpages, info pages. We don't do 'install-daemon', which would be the sysvinit initscripts, since sysvinit is not really supported.
  make DESTDIR="${pkgdir}" install-conf install-lib install-hook install-script install-doc
  
  ### systemd.
  make DESTDIR="${pkgdir}" install-systemd
  # Compatibility.
  ln -s "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/net-profiles.service"
  
  ### Remove /usr/lib/network/hooks/initscripts, since it would source files which are not available, resulting in error.
  rm -f "${pkgdir}/usr/lib/network/hooks/initscripts" || true
  
  ### Install own version of conf.d (overwrite installed by Makefile).
  install -D -m644 "${srcdir}/netcfg.conf" "${pkgdir}/etc/conf.d/netcfg"
  
  ### OpenRC initscript.
  install -D -m755 "${srcdir}/netcfg.openrc" "${pkgdir}/etc/init.d/netcfg"
  
  ### License.
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  
  ### /usr/share/doc/-Documentation.
  _docdir="${pkgdir}/usr/share/doc/${_pkgname}"
  mkdir -p "${_docdir}"
  chmod 755 "${_docdir}"
  install -m 644 AUTHORS CHANGELOG CONTRIBUTING "${_docdir}"
  install -m 644 README "${_docdir}/README.make"
  
  ### Shell Completion.
  #install -D -m644 netcfg.bash-completion "$pkgdir/usr/share/bash-completion/completions/netcfg"
  #install -D -m644 netcfg.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_netcfg" # Yes!, the '_' in front is intended.
  install -D -m644 "${srcdir}/netcfg.bash-completion_extended" "$pkgdir/usr/share/bash-completion/completions/netcfg"
  install -D -m644 "${srcdir}/netcfg.zsh-completion_extended" "$pkgdir/usr/share/zsh/site-functions/_netcfg" # Yes!, the '_' in front is intended.
}


# _list_examples() {
#   ### Helper-function help to manually generate the 'EXAMPLES'-variable in the Makefile.
#   _unpackeddir="${srcdir}/${_upk_base}"
#   cd "${_unpackeddir}"
# 
#   ls -1 extra/examples/* | sort -n | while read line; do echo "              ${line}  \\"; done
# }
