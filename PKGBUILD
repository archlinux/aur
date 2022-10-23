# Maintainer: Moses Narrow <moe_narrow@skycoin.com>
pkgname=plot-git
_pkgname=${pkgname/-git/}
_githuborg=annacrombie
provides=("$_pkgname")
conflicts=("$_pkgname")
pkgdesc="plot on the command line"
#https://github.com/annacrombie/plot
_pkgpath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.5.1
pkgrel=3
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' )
url="https://${_pkgpath}"
license=('MIT')
makedepends=('git' 'meson' 'pkgconfig' 'cmake' 'scdoc')
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
_version=${_version##*/}
_version=${_version%%-*}
_version=${_version//v/}
if [[ ${_version} == "" ]] ; then
	_version="0.0.1"
fi
echo ${_version}
}

build () {
	arch-meson _build "${_pkgname}"
	meson compile -C _build
	#create the exmple script
	echo -e "#!/bin/bash
	plot -d10 -f -p \"avg:5|roc:5\" \
	-c l -i \"/sys/class/net/$(ifconfig -a | head -n1 | awk -v FS=':' '{print $1}')/statistics/rx_packets:r\" \
	-c r -i \"/sys/class/net/$(ifconfig -a | head -n1 | awk -v FS=':' '{print $1}')/statistics/tx_packets:r\" " | tee ${_pkgname}net.sh
}

package () {
	_msg2 "installing files"
	meson install -C _build --destdir="${pkgdir}"
	install -Dm644 ${srcdir}/${_pkgname}/LICENSE $pkgdir/usr/share/licenses/$_pkgname/LICENSE
	install -Dm644 ${srcdir}/${_pkgname}/README.md $pkgdir/usr/share/doc/$_pkgname/README.md
	_msg2 "installing example command: 'plotnet'"
	install -Dm755 ${srcdir}/${_pkgname}net.sh $pkgdir/usr/bin/${_pkgname}net
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
