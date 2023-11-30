# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.3.13'
pkgrel='4'
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
provides=( 'skywire' )
conflicts=( 'skywire' )
license=('license-free')
install=skywire.install
backup=("opt/${_pkgname}/{users.db,skywire.json,local}")
_script=("skywire-autoconfig")
_desktop=("skywire.desktop" "skywirevpn.desktop")
_icon=("skywirevpn.png" "skywire.png")
_service=("skywire.service" "skywire-autoconfig.service")
_source=("${_script[@]}"
"${_desktop[@]}"
"${_icon[@]}"
"${_service[@]}"
"${_key[@]}"
"https://raw.githubusercontent.com/skycoin/skywire/develop/dmsghttp-config.json"
"all_servers.json"::"https://dmsgd.skywire.skycoin.com/dmsg-discovery/all_servers"
)
source=("${_source[@]}")
sha256sums=('9257dc9cf98b382049b500f646c0005950077cedb83abbb62984983e4dda0874'
            '40c80ccce9e89ae559050b943be1f09d905476c614a72d74fac2a58c821ac058'
            '00da5a9afdf5a8c7033978d2074039ba1ff7bc7a7221fbd278eb1270bdeb8eae'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            'fee14fb95e02a6c74626e9c89def7c1137192c5c23470a05c750cd97f3d3f0dd'
            '8519d027325dcb34877bb5b0fb0c3c035d7589c0046b53935e2b949d436c4be3'
            'SKIP'
            'SKIP')
sha256sums_x86_64=('6308d9680242c8ea6a89f677388907b34d2c5806752688b1a1c947e4851f318f')
sha256sums_aarch64=('ff8734ea5121beff521acf2bd1340457887085a2504aaf8449f44c3d89910bb0')
sha256sums_armv8=('ff8734ea5121beff521acf2bd1340457887085a2504aaf8449f44c3d89910bb0')
sha256sums_armv7=('6696c4c5f43ac375a6d9e1c26e644d832d0dfa28ff865c1f2bb15793e96fc562')
sha256sums_armv7l=('6696c4c5f43ac375a6d9e1c26e644d832d0dfa28ff865c1f2bb15793e96fc562')
sha256sums_armv7h=('6696c4c5f43ac375a6d9e1c26e644d832d0dfa28ff865c1f2bb15793e96fc562')
sha256sums_arm=('1b12fcde401350b98f20cd4e47ce3227caf166e865647a84d815b668495ad78c')
#https://github.com/skycoin/skywire/releases/download/v1.3.11/skywire-v1.3.11-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.3.11-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.3.11-linux-armhf.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.2.1/skywire-v1.3.11-linux-arm.tar.gz
_binarchive=("${_pkgname}-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( "${source_aarch64[@]}" )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=("${_release_url}-armhf.tar.gz")
source_armv7l=( "${source_armv7[@]}" )
source_armv7h=( "${source_armv7[@]}" )
_binary=("skywire-cli" "skywire-visor")
_appbinary=("skychat" "skysocks" "skysocks-client" "vpn-client" "vpn-server")

build() {
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
GOBIN="${srcdir}/"
_GOAPPS="${GOBIN}/apps"
#declare the _pkgdir and systemd directory
_pkgdir="${pkgdir}"
_systemddir="usr/lib/systemd/system"
_skywirebin=""
_package
}
#_package function - used in build variants
_package() {
_dir="opt/skywire"
_apps="${_dir}/apps"
_bin="${_dir}/bin"
_scriptsdir="${_dir}/scripts"
_msg2 'creating dirs'
mkdir -p "${_pkgdir}/usr/bin"
#mkdir -p "${_pkgdir}/etc/logrotate.d"
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
install -Dm644 "${srcdir}/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json" || install -Dm644 "${srcdir}/skywire/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json"
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
if command -v tree &> /dev/null ; then
_msg2 'package tree'
  tree -a ${_pkgdir}
fi
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
