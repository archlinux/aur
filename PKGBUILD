# Maintainer: dreieck
# Previous maintainer: Mattias Andrée <`base64 -d`(bWFhbmRyZWUK)@member.fsf.org>
# Previous maintainer: Jouke Witteveen <j.witteveen@gmail.com>

_pkgname='netcfg'
pkgname="${_pkgname}-git"
epoch=0
pkgver=4.0.r563_20130808_54f4656
pkgrel=2
pkgdesc="[WARNING: DEPRECATED! Install only if you really know that you want to use 'netcfg'. Upstream is no longer maintained since ~2013.] Network configuration and profile scripts. Includes patch to make wifi-menu work, OpenRC and systemd initscripts."
url='https://github.com/GNU-Pony/netcfg/'
arch=('any')
license=('BSD')
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
  "git" # For downloading the source.
  "gzip" # For compressing manpages.
  "texinfo" # For generating info manual.
  "texman" # For generating manpages.
)
optdepends=(
    'bridge-utils: For bridge connections.'
    'dialog: For the menu based profile and wifi selectors.'
    'dhclient: For alternative DHCP client.'
    'ifenslave: For bond connections.'
    'ifplugd: For automatic wired connections through net-auto-wired.'
    'netcfg-wireguard: For wireguard support.'
    'wireless_tools: For interface renaming through net-rename.'
    'wpa_actiond: For automatic wireless connections through net-auto-wireless.'
    'wpa_supplicant: For wireless networking support.'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-openrc=${pkgver}"
  "${_pkgname}-systemd=${pkgver}"
)
conflicts=(
  "netctl"
  "${_pkgname}"
)
_source_base="https://github.com/GNU-Pony/${_pkgname}"
source=(
  "${_pkgname}::git+${_source_base}.git"
  "netcfg.openrc"
  "netcfg.conf"
  "netcfg.bash-completion_extended"
  "netcfg.zsh-completion_extended"
  "newer-wpasupplicant.patch"
  "Makefile.deduplicate-examples.patch"
  "${install}"
)
sha256sums=(
  "SKIP"
  "4a21fb2a8eed541ff23ef93e8150607074d40f248fa923fcede27102ed2944da"
  "0525757fb59b9174f2c3bbc9828bb4590f89144f0506cadf13dafa0b76ec3e14"
  "a353438378891f711902f13d4df5e19dfcde756b453bb865c0f6660e3c1bc68f"
  "11573dbda8cc38968b2f4a7a58ebf71dc2094d2b925dca3026a8c33614643a9c"
  "14ed9b1d7072b6fee27094a4b35c6d35ad793766a432febfb613451f4af2214c"
  "1d10981f419c580f7a47150502acccf61139477e3abeae7bfcc3eec384787222"
  "07c16d4de52acc97abe2633b5a3cf077bac6924159b47474c93d936816846468"
)
options=(
  'emptydirs'
)

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(head -n1 CHANGELOG | awk '{print $2}')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -n 1 --format=tformat:%ci | awk '{print $1}' | tr -d '-')"
  _hash="$(git rev-parse --short=7 HEAD)"

  if [ -z ${_ver} ]; then
    error "Failed to determine build version. Aborting."
    return 11
  fi
  if [ -z ${_rev} ]; then
    error "Failed to determine commit count. Aborting."
    return 12
  fi
  if [ -z ${_date} ]; then
    error "Failed to determine latest commit date. Aborting."
    return 13
  fi
  if [ -z ${_hash} ]; then
    error "Failed to determine git hash. Aborting."
    return 14
  fi

  printf "%s" "${_ver}.r${_rev}_${_date}_${_hash}"
}

prepare() {
  cd "${srcdir}/${_pkgname}"

  for _patch in "${srcdir}"/*.patch; do
    msg "Applying patch '${_patch}' ..."
    patch -Np1 < "${_patch}"
  done
}

build() {
  cd "${srcdir}/${_pkgname}"

  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  ### Core, manpages, info pages. We don't do 'install-daemon', which would be the sysvinit initscripts, since sysvinit is not really supported.
  make DESTDIR="${pkgdir}" install-conf install-lib install-hook install-script install-doc

  ### systemd.
  make DESTDIR="${pkgdir}" install-systemd
  # Compatibility.
  ln -sv "${_pkgname}.service" "${pkgdir}/usr/lib/systemd/system/net-profiles.service"

  ### Remove /usr/lib/network/hooks/initscripts, since it would source files which are not available, resulting in error.
  rm -f "${pkgdir}/usr/lib/network/hooks/initscripts" || true

  ### Install own version of conf.d (overwrite installed by Makefile).
  install -v -D -m644 "${srcdir}/netcfg.conf" "${pkgdir}/etc/conf.d/netcfg"

  ### OpenRC initscript.
  install -v -D -m755 "${srcdir}/netcfg.openrc" "${pkgdir}/etc/init.d/netcfg"

  ### License.
  install -v -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  ### /usr/share/doc/-Documentation.
  _docdir="${pkgdir}/usr/share/doc/${_pkgname}"
  mkdir -p "${_docdir}"
  chmod 755 "${_docdir}"
  install -v -m 644 AUTHORS CHANGELOG CONTRIBUTING "${_docdir}"
  install -v -m 644 README "${_docdir}/README.make"

  ### Shell Completion.
  #install -v -D -m644 netcfg.bash-completion "$pkgdir/usr/share/bash-completion/completions/netcfg"
  #install -v -D -m644 netcfg.zsh-completion "$pkgdir/usr/share/zsh/site-functions/_netcfg" # Yes!, the '_' in front is intended.
  install -v -D -m644 "${srcdir}/netcfg.bash-completion_extended" "$pkgdir/usr/share/bash-completion/completions/netcfg"
  install -v -D -m644 "${srcdir}/netcfg.zsh-completion_extended" "$pkgdir/usr/share/zsh/site-functions/_netcfg" # Yes!, the '_' in front is intended.
}


# _list_examples() {
#   ### Helper-function help to manually generate the 'EXAMPLES'-variable in the Makefile.
#   cd "${srcdir}/${_pkgname}"
#
#   ls -1 extra/examples/* | sort -n | while read line; do echo "              ${line}  \\"; done
# }
