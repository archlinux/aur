## Maintainer: Moses Narrow <moe_narrow@skycoin.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${FORK:-$_projectname}
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
_pkggopath=github.com/${_githuborg}/${_pkgname}
pkgver='1.3.13'
pkgrel='3'
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url=https://${_pkggopath}
license=('license-free')
makedepends=("git" "go" "musl" "kernel-headers-musl")
[[ ${REBUILDUI} == "1" ]] && makedepends=(${makedepends[@]} "npm")
install=skywire.install
_script=("skywire-autoconfig")
_desktop=("skywire.desktop" "skywirevpn.desktop")
_icon=("skywirevpn.png" "skywire.png")
_service=("skywire.service" "skywire-autoconfig.service")
_source=("skywire-bin::git+https://aur.archlinux.org/skywire-bin")
source=("skywire-${_tag_ver}.tar.gz::${url}/archive/refs/tags/${_tag_ver}.tar.gz"
"${_source[@]}"
"https://raw.githubusercontent.com/skycoin/skywire/develop/dmsghttp-config.json"
"all_servers.json"::"https://dmsgd.skywire.skycoin.com/dmsg-discovery/all_servers"
)
sha256sums=('e05e46b2315e4dea3b843425004e0e501f999b727265f434a60cd3874e2216e9'
'SKIP'
'SKIP'
'SKIP'
)
_binary=("skywire-cli" "skywire-visor")
_appbinary=("skychat" "skysocks" "skysocks-client" "vpn-client" "vpn-server")

prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p "${srcdir}/go/src/github.com/${_githuborg}/" "${srcdir}"/go/bin "${srcdir}"/go/apps || true
[[ -d "${srcdir}/${pkgname}" ]] && rm -rf "${srcdir:?}/${pkgname}"
ln -rTsf "${srcdir}/${_pkgname}-${pkgver}${_rc}" "${srcdir}/go/src/${_pkggopath}"
ln -rTsf "${srcdir}/${_pkgname}-${pkgver}${_rc}" "${srcdir}/${_pkgname}"
cd "${srcdir}/go/src/${_pkggopath}/" || exit
}

build() {
export GOPATH="${srcdir}/go"
export GOBIN="${GOPATH}/bin"
export _GOAPPS="${GOPATH}/apps"
export GOOS=linux
export CGO_ENABLED=1  #default anyways
#use musl-gcc for static compilation
export CC=musl-gcc
if [[ ${REBUILDUI} == "1" ]] ;then
make build-ui
else
  _msg2 'Not rebuilding UI. Export REBUILDUI=1 to recompile the UI'
fi
_build
}
#_build function - used in build variants
_build() {
cd "${srcdir}/${pkgname}-${pkgver}${_rc}" || exit
local _version="v${pkgver}"
#binary versioning
DMSG_BASE="github.com/skycoin/dmsg"
BUILDINFO_PATH="${DMSG_BASE}/buildinfo"
BUILDINFO_VERSION="${BUILDINFO_PATH}.version=${_version}"
BUILDINFO="${BUILDINFO_VERSION} ${BUILDINFO_DATE} ${BUILDINFO_COMMIT}"
#create the skywire binaries
cd "${srcdir}"/go/src/${_pkggopath} || exit
_cmddir="${srcdir}"/go/src/${_pkggopath}/cmd
#static compilation with 'musl' avoids glibc runtime deps which cause binary to fail if correct glibc / libc6 is not found on the system
_msg2 "building app binaries"
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS "${_cmddir}"/apps/...
_msg2 "building skywire binaries"
cd "${_cmddir}"/skywire-visor || exit
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN "${_cmddir}"/skywire-visor/... "${_cmddir}"/skywire-cli/...
#binary transparency
cd "$GOBIN" || exit
_msg2 'binary sha256sums'
sha256sum $(ls)
cd "$_GOAPPS" || exit
sha256sum $(ls)

#the dmsghttp-config.json must match the current dmsg servers on the production deployment
#https://dmsgd.skywire.skycoin.com/dmsg-discovery/all_servers
#fix the dmsghttp-config.json
if command -v jq &> /dev/null ; then
_msg2 'updating dmsghttp-config.json'
cat dmsghttp-config.json | jq --argjson updated_servers "$(cat all_servers.json | grep -Ev "availableSessions|version|sequence|timestamp|signature" | tr -d '\n' | sed 's/,\s*}/}/g' | jq '.')"   '.prod.dmsg_servers = $updated_servers' | tee dmsghttp-config.json
fi
[[ -f "${srcdir}/all_servers.json" ]] && rm "${srcdir}/all_servers.json"
}

package() {
#declare the _pkgdir and systemd directory
_pkgdir="${pkgdir}"
_systemddir="usr/lib/systemd/system"
_skywirebin="skywire-bin/"
_package
if command -v tree &> /dev/null ; then
_msg2 'package tree'
  tree -a ${pkgdir}
fi
}
#_package function - used in build variants
_package() {
_dir="opt/skywire"
_apps="${_dir}/apps"
_bin="${_dir}/bin"
_scriptsdir="${_dir}/scripts"
_msg2 'creating dirs'
mkdir -p "${_pkgdir}/usr/bin"
mkdir -p "${_pkgdir}/${_dir}/bin"
mkdir -p "${_pkgdir}/${_dir}/apps"
mkdir -p "${_pkgdir}/${_dir}/local/custom"
mkdir -p "${_pkgdir}/${_dir}/scripts"
mkdir -p "${_pkgdir}/${_systemddir}"
_msg2 'installing binaries'
for _i in "${_binary[@]}" ; do
  _msg3 ${_i}
	install -Dm755 "${GOBIN}/${_i}" "${_pkgdir}/${_bin}/"
	ln -rTsf "${_pkgdir}/${_bin}/${_i}" "${_pkgdir}/usr/bin/${_i}"
done
_msg2 'installing app binaries'
for _i in "${_appbinary[@]}" ; do
  _msg3 ${_i}
  install -Dm755 "${_GOAPPS}/${_i}" "${_pkgdir}/${_apps}/${_i}"
	ln -rTsf "${_pkgdir}/${_apps}/${_i}" "${_pkgdir}/usr/bin/${_i}"
done
_msg2 'Installing scripts'
for _i in "${_script[@]}" ; do
  _msg3 ${_i}
  install -Dm755 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/${_scriptsdir}/${_i}"
  ln -rTsf "${_pkgdir}/${_scriptsdir}/${_i}" "${_pkgdir}/usr/bin/${_i}"
done
_msg2 'Symlink skywire-visor to skywire'
ln -rTsf "${_pkgdir}/${_bin}/${_pkgname}-visor" "${_pkgdir}/usr/bin/${_pkgname}"
_msg2 'installing dmsghttp-config.json'
install -Dm644 "${srcdir}/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json" || install -Dm644 "${srcdir}/skywire/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json" || install -Dm644 "${srcdir}/skywire-${_pkgver}/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json"
#make sure the dmsghttp-config will get redownloaded on subsequent builds
[[ -f "${srcdir}/dmsghttp-config.json" ]] && rm "${srcdir}/dmsghttp-config.json"
_msg2 'Installing systemd services'
for _i in "${_service[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/${_systemddir}/${_i}"
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/etc/skel/.config/systemd/user/${_i}"
done
_msg2 'installing desktop files and icons'
mkdir -p "${_pkgdir}/usr/share/applications/" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
for _i in "${_desktop[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/usr/share/applications/${_i}"
done
for _i in "${_icon[@]}" ; do
  _msg3 ${_i}
  install -Dm644 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/${_i}"
done

}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF} ${mesg}${ALL_OFF}\n" "$@"
}
