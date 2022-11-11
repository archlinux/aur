#!/bin/bash
## Maintainer: Moses Narrow <moe_narrow@skycoin.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver='1.2.1'
pkgrel=2
_rc=''
#_rc='-pr1'
_pkgver="${pkgver}${_rc}"
_tag_ver="v${_pkgver}"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=('license-free')
makedepends=("git" "go" "musl" "kernel-headers-musl")
install=skywire.install
source=("skywire-${_tag_ver}.tar.gz::${url}/archive/refs/tags/${_tag_ver}.tar.gz"
"skywire-autoconfig::https://aur.archlinux.org/cgit/aur.git/plain/skywire-autoconfig?h=skywire-bin"
"skywire.desktop::https://aur.archlinux.org/cgit/aur.git/plain/skywire.desktop?h=skywire-bin"
"skywirevpn.desktop::https://aur.archlinux.org/cgit/aur.git/plain/skywirevpn.desktop?h=skywire-bin"
"skywirevpn.png::https://aur.archlinux.org/cgit/aur.git/plain/skywirevpn.png?h=skywire-bin"
"skywire.png::https://aur.archlinux.org/cgit/aur.git/plain/skywire.png?h=skywire-bin"
"skywire.service::https://aur.archlinux.org/cgit/aur.git/plain/skywire.service?h=skywire-bin"
"skywire-autoconfig.service::https://aur.archlinux.org/cgit/aur.git/plain/skywire-autoconfig.service?h=skywire-bin"
)
sha256sums=('56da81239baefeffd0bb607c4d1d3a1efc2e86e029471892970e531a9c269533'
            '08f0c625a3ae8810f0468a45aa2e463425ec307441f71f6ba48114bda2055316'
            'f0300bcde06b6818b637ccc23fa8206a40e67f63815781d265bd10d2cda93e65'
            '0c20dd44eca0266a3a10fab24c657295a833eba9f78c6b1cf06132b093ac3ba8'
            'ec24750a99f5cda8d8a8dc94743943218e1b2088c2b2c7dc1644ee78d954fe7e'
            'a6941680b5858ca3e0c85d9bf5824455a0c95524b61e42352462f2abbb750495'
            '19b74f7a9b245a96617f31d1fef7ce1e0231b2359d6525dd3f35d2b2a9d10d18'
            '55293e05c5d6c877397eb4c52123bb02e8bc92aeaf663ba70e1cfab318ce727c')

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
cd "${_cmddir}"/apps || exit
_app="$(ls)"
for _i in ${_app}; do
_msg2 "building ${_i} binary"
cd "${_cmddir}/apps/${_i}" || exit
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
done
_msg2 "building skywire-visor binary"
cd "${_cmddir}"/skywire-visor || exit
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
_msg2 "building skywire-cli binary"
cd "${_cmddir}"/skywire-cli || exit
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
#binary transparency
cd "$GOBIN" || exit
_msg2 'binary sha256sums'
sha256sum "$(ls)"
cd "$_GOAPPS" || exit
sha256sum "$(ls)"
}

package() {
#declare the _pkgdir and systemd directory
_pkgdir="${pkgdir}"
_systemddir="usr/lib/systemd/system"
_package
}
#_package function - used in build variants
#_package function - used in build variants
_package() {
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skybin="${_skydir}/bin"
_skyscripts="${_skydir}/scripts"
_msg2 'creating dirs'
mkdir -p "${_pkgdir}/usr/bin"
mkdir -p "${_pkgdir}/${_skydir}/bin"
mkdir -p "${_pkgdir}/${_skydir}/apps"
mkdir -p "${_pkgdir}/${_skydir}/local"
mkdir -p "${_pkgdir}/${_skydir}/scripts"
mkdir -p "${_pkgdir}/${_systemddir}"
_msg2 'installing binaries'
for _i in "${_binaries[@]}" ; do
	install -Dm755 "${GOBIN}/${_i}" "${_pkgdir}/${_skybin}/"
	ln -rTsf "${_pkgdir}/${_skybin}/${_i}" "${_pkgdir}/usr/bin/${_i}"
 done
_msg2 'installing app binaries'
install -Dm755 "${_GOAPPS}/"* "${_pkgdir}/${_skyapps}/"
for _i in "${_pkgdir}/${_skyapps}/"* ; do
	ln -rTsf "${_i}" "${_pkgdir}/usr/bin/${_i##*/}"
done
_msg2 'Installing scripts'
install -Dm755 "${srcdir}/skywire-autoconfig" "${_pkgdir}/${_skyscripts}/"
ln -rTsf "${_pkgdir}/${_skyscripts}/skywire-autoconfig" "${_pkgdir}/usr/bin/skywire-autoconfig"
_msg2 'Correcting symlink names'
ln -rTsf "${_pkgdir}/${_skybin}/${_pkgname}-visor" "${_pkgdir}/usr/bin/${_pkgname}"
_msg2 'installing dmsghttp-config.json'
install -Dm644 "${srcdir}/${_pkgname}/dmsghttp-config.json" "${_pkgdir}/${_skydir}/dmsghttp-config.json"
_msg2 'Installing systemd services'
install -Dm644 "${srcdir}/"*.service "${_pkgdir}/${_systemddir}/"
_msg2 'installing desktop files and icons'
mkdir -p "${_pkgdir}/usr/share/applications/" "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
install -Dm644 "${srcdir}/"*.desktop "${_pkgdir}/usr/share/applications/"
install -Dm644 "${srcdir}/"*.png "${_pkgdir}/usr/share/icons/hicolor/48x48/apps/"
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}

_msg3() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  -->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
