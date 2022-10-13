# Maintainer: Moses Narrow <moe_narrow@skycoin.com>
pkgname=plot-git
_pkgname=${pkgname/-git/}
_githuborg=annacrombie
pkgdesc="plot on the command line"
#https://github.com/annacrombie/plot
_pkgpath="github.com/${_githuborg}/${_pkgname}"
pkgver=0.5.1
pkgrel=2
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

build() {
cd ${srcdir}/${_pkgname}
meson build
meson compile -C build
}

package() {
_msg2 "installing files"
install -Dm755 ${srcdir}/${_pkgname}/build/lib/libplot.so ${pkgdir}/usr/lib/libplot.so
install -Dm755 ${srcdir}/${_pkgname}/build/cli/plot ${pkgdir}/usr/bin/${_pkgname}
install -Dm755 ${srcdir}/${_pkgname}/include/plot/plot.h ${pkgdir}/usr/include/plot/plot.h
install -Dm755 ${srcdir}/${_pkgname}/include/plot/file_input.h ${pkgdir}/usr/include/plot/file_input.h
install -Dm644 ${srcdir}/${_pkgname}/LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}

_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
