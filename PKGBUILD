# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
pkgname=skywire-bin
_pkgname=${pkgname/-bin/}
_githuborg=skycoin
pkgdesc="Skywire: Building a new Internet. Skycoin.com"
pkgver='1.3.18'
pkgrel='2'
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' 'riscv64' )
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
"https://raw.githubusercontent.com/skycoin/skywire/develop/services-config.json")
#"all_servers.json"::"https://dmsgd.skywire.skycoin.com/dmsg-discovery/all_servers")

source=("${_source[@]}")
sha256sums=('9257dc9cf98b382049b500f646c0005950077cedb83abbb62984983e4dda0874'
            '40c80ccce9e89ae559050b943be1f09d905476c614a72d74fac2a58c821ac058'
            '00da5a9afdf5a8c7033978d2074039ba1ff7bc7a7221fbd278eb1270bdeb8eae'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            'bf2876b7c41b204452cca141600af39e5a4e17486e9f09e20069d8f4316e6063'
            '8519d027325dcb34877bb5b0fb0c3c035d7589c0046b53935e2b949d436c4be3'
            'd1bbd2b6d141cee8499fe2ae0c8429325d2d80ea895cce3db2db11f0629cc740'
            'e3a1a975138e6778a1e3ea47e98da94088c7c2d945295cd4ccbd0c992d6346c6')
sha256sums_x86_64=('6c0428fa382e2e15e20d621a5caffd82a7b6c1dbfd81128d8fe8c843de4c6621')
sha256sums_aarch64=('6d019918d17974411a78c2dc206df1247354508dd06fff77a06ee9dec276b594')
sha256sums_armv8=('6d019918d17974411a78c2dc206df1247354508dd06fff77a06ee9dec276b594')
sha256sums_armv7=('1966483079876c45efc31bf222b5876181b57d11f4c8b3255e325ccf2590237a')
sha256sums_armv7l=('1966483079876c45efc31bf222b5876181b57d11f4c8b3255e325ccf2590237a')
sha256sums_armv7h=('1966483079876c45efc31bf222b5876181b57d11f4c8b3255e325ccf2590237a')
sha256sums_arm=('273c4feb0f2127a786d31c334bd4bba60c9d811f3c2008533ca5f60c5b93bf0b')
sha256sums_riscv64=('5f8a60fc996f7b89c0df0c95c2128bbccaf8a0d63732ff0363caa90ac7e4f913')
#https://github.com/skycoin/skywire/releases/download/v1.3.17/skywire-v1.3.17-linux-amd64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.17/skywire-v1.3.17-linux-arm64.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.17/skywire-v1.3.17-linux-armhf.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.17/skywire-v1.3.17-linux-arm.tar.gz
#https://github.com/skycoin/skywire/releases/download/v1.3.17/skywire-v1.3.17-linux-riscv64.tar.gz
_binarchive=("${_pkgname}-deployment-${_tag_ver}-linux")
_release_url=("${url}/releases/download/${_tag_ver}/${_binarchive}")
source_x86_64=("${_release_url}-amd64.tar.gz")
source_aarch64=("${_release_url}-arm64.tar.gz")
source_armv8=( "${source_aarch64[@]}" )
source_arm=("${_release_url}-arm.tar.gz")
source_armv7=("${_release_url}-armhf.tar.gz")
source_armv7l=( "${source_armv7[@]}" )
source_armv7h=( "${source_armv7[@]}" )
source_riscv64=( "${_release_url}-riscv64.tar.gz" )

_binaryscript=("skywire-cli" "skywire-visor")
_appscript=("skychat" "skysocks" "skysocks-client" "vpn-client" "vpn-server")

build() {
  GOBIN="${srcdir}"
  _GOAPPS="${GOBIN}/apps"
  mkdir -p ${_GOAPPS}
  _msg2 'creating launcher scripts'
  for _i in "${_appscript[@]}" ; do
    _msg3 ${_i}
    echo -e '#!/bin/bash\n/opt/skywire/bin/skywire app '"${_i} "'$@' > "${_GOAPPS}/${_i}"
  done
  echo -e '#!/bin/bash\n/opt/skywire/bin/skywire cli $@' > "${GOBIN}/skywire-cli"
  echo -e '#!/bin/bash\n/opt/skywire/bin/skywire visor $@' > "${GOBIN}/skywire-visor"
}

package() {
GOBIN="${srcdir}"
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
_msg2 'installing scripts and binaries'
install -Dm755 "${GOBIN}/skywire" "${_pkgdir}/${_bin}/"
ln -rTsf "${_pkgdir}/${_bin}/skywire" "${_pkgdir}/usr/bin/skywire"
install -Dm755 "${GOBIN}/skywire-cli" "${_pkgdir}/${_bin}/"
ln -rTsf "${_pkgdir}/${_bin}/skywire-cli" "${_pkgdir}/usr/bin/skywire-cli"
install -Dm755 "${GOBIN}/skywire-visor" "${_pkgdir}/${_bin}/"
ln -rTsf "${_pkgdir}/${_bin}/skywire-visor" "${_pkgdir}/usr/bin/skywire-visor"
for _i in "${_appscript[@]}" ; do
  _msg3 ${_i}
  install -Dm755 "${_GOAPPS}/${_i}" "${_pkgdir}/${_apps}/${_i}"
	ln -rTsf "${_pkgdir}/${_apps}/${_i}" "${_pkgdir}/usr/bin/${_i}"
done
for _i in "${_script[@]}" ; do
  _msg3 ${_i}
  install -Dm755 "${srcdir}/${_skywirebin}${_i}" "${_pkgdir}/${_scriptsdir}/${_i}"
  ln -rTsf "${_pkgdir}/${_scriptsdir}/${_i}" "${_pkgdir}/usr/bin/${_i}"
done

_msg2 'installing dmsghttp-config.json'
install -Dm644 "${srcdir}/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json" || install -Dm644 "${srcdir}/skywire/dmsghttp-config.json" "${_pkgdir}/${_dir}/dmsghttp-config.json"
_msg2 'installing services-config.json'
install -Dm644 "${srcdir}/services-config.json" "${_pkgdir}/${_dir}/services-config.json" || install -Dm644 "${srcdir}/skywire/services-config.json" "${_pkgdir}/${_dir}/services-config.json"

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
