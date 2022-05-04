 # Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
_projectname=skycoin
pkgname=skywire
_pkgname=${pkgname}
_githuborg=${_projectname}
pkgdesc="Skywire Mainnet Node implementation. Skycoin.com"
_pkggopath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.6.0
pkgrel=3
#pkgrel=3
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkggopath}"
license=()
makedepends=('git' 'go' 'musl' 'kernel-headers-musl') #disable signature check pending fixes#  'skycoin-keyring')
install=skywire.install
_scripts=${_pkgname}-scripts
source=("${url}/archive/refs/tags/v${pkgver}.tar.gz"
"${_scripts}.tar.gz"
)
sha256sums=('f1c6ae2dbe36cda0767855ac1b8676751358ca782e2c3d8ee16ba9b0de9b2bc3'
            '791c5157f794248a67c3aba25084f1472f0422dd2cfaaa889da293c1de4c7c3f')
prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin ${srcdir}/go/apps
ln -rTsf ${srcdir}/${pkgname}-${pkgver} ${srcdir}/go/src/${_pkggopath}
cd ${srcdir}/go/src/${_pkggopath}/
}

build() {
export GOPATH=${srcdir}/go
export GOBIN=${GOPATH}/bin
export _GOAPPS=${GOPATH}/apps
export GOOS=linux
export CGO_ENABLED=1  #default anyways
#use musl-gcc for static compilation
export CC=musl-gcc

cd "${srcdir}/${pkgname}-${pkgver}"
local _version="v${pkgver}"

DMSG_BASE="github.com/skycoin/dmsg"
BUILDINFO_PATH="${DMSG_BASE}/buildinfo"
BUILDINFO_VERSION="${BUILDINFO_PATH}.version=${_version}"
BUILDINFO=${BUILDINFO_VERSION} ${BUILDINFO_DATE} ${BUILDINFO_COMMIT}

#create the skywire binaries
cd ${srcdir}/go/src/${_pkggopath}
_cmddir=${srcdir}/go/src/${_pkggopath}/cmd
#static compilation with 'musl' avoids glibc runtime deps
#which cause binary to fail if correct glibc / libc6 is not found on the system
cd ${_cmddir}/apps
_app=$(ls)
for _i in ${_app}; do
_msg2 "building ${_i} binary"
cd ${_cmddir}/apps/${_i}
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $_GOAPPS .
done
_msg2 "building skywire-visor binary"
cd ${_cmddir}/skywire-visor
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
_msg2 "building skywire-cli binary"
cd ${_cmddir}/skywire-cli
go build -trimpath --ldflags="" --ldflags "${BUILDINFO} -s -w -linkmode external -extldflags '-static' -buildid=" -o $GOBIN .
#binary transparency
cd $GOBIN
_msg2 'binary sha256sums'
sha256sum $(ls)
cd $_GOAPPS
sha256sum $(ls)
}

package() {
  _msg2 'creating dirs'
  _pkgdir=${pkgdir}
#create directory trees or the visor might make them with weird permissions
_skydir="opt/skywire"
_skyapps="${_skydir}/apps"
_skybin="${_skydir}/bin"
_skyscripts="${_skydir}/scripts"
_systemddir="usr/lib/systemd/system"
mkdir -p ${_pkgdir}/usr/bin
mkdir -p ${_pkgdir}/${_skydir}/bin
mkdir -p ${_pkgdir}/${_skydir}/apps
mkdir -p ${_pkgdir}/${_skydir}/local
mkdir -p ${_pkgdir}/${_skydir}/scripts

_msg2 'installing binaries'
_binaries=("${_pkgname}-cli" "${_pkgname}-visor")
for i in ${_binaries[@]}; do
_msg3 "${i}"
 install -Dm755 ${GOBIN}/${i} ${_pkgdir}/${_skybin}/${i}
 ln -rTsf ${_pkgdir}/${_skybin}/${i} ${_pkgdir}/usr/bin/${i}
done
_msg2 'installing app binaries'
_apps=${srcdir}/apps
_appbinaries=$( ls "${_GOAPPS}" )
for i in ${_appbinaries}; do
  _msg3 "${i}"
  install -Dm755 ${_GOAPPS}/${i} ${_pkgdir}/${_skyapps}/${i}
  ln -rTsf ${_pkgdir}/${_skyapps}/${i} ${_pkgdir}/usr/bin/${i}
done

_msg2 'installing scripts'
_scripts1=${srcdir}/${_scripts}/${_pkgname}
_skywirescripts=$( ls ${_scripts1} )
for i in ${_skywirescripts}; do
  _install2 ${_scripts1}/${i} ${_skyscripts}
done

ln -rTsf ${_pkgdir}/usr/bin/${_pkgname}-visor ${_pkgdir}/usr/bin/${_pkgname}

install -Dm644 ${srcdir}/dmsghttp-config.json ${_pkgdir}/${_skydir}/dmsghttp-config.json

#install the system.d services
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}.service ${pkgdir}/${_systemddir}/${_pkgname}.service
install -Dm644 ${srcdir}/${_scripts}/systemd/${_pkgname}-visor.service ${pkgdir}/${_systemddir}/${_pkgname}-visor.service

#desktop integration
install -Dm644 "${srcdir}"/${_scripts}/desktop/com.skywire.Skywire.desktop ${_pkgdir}/usr/share/applications/com.skywire.Skywire.desktop
install -Dm644 "${srcdir}"/${_scripts}/desktop/skywire.png ${_pkgdir}/${_skydir}/icon.png
ln -rTsf ${_pkgdir}/${_skydir}/icon.png ${_pkgdir}/usr/share/icons/hicolor/48x48/apps/skywire.png
}


_install2() {
_binname="${1##*/}"
_binname="${_binname%%.*}"
install -Dm755 ${1} ${pkgdir}/${2}/${_binname}
ln -rTsf ${pkgdir}/${2}/${_binname} ${pkgdir}/usr/bin/${_binname}
chmod +x ${pkgdir}/usr/bin/${_binname}
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
