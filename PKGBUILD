# Submitter: Andy Weidenbaum <archbaum@gmail.com>
# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
_projectname=golang
pkgname=gomobile
_pkgname=${pkgname#go}
_githuborg=${FORK:-$_projectname}
pkgver=20240203
pkgrel=1
pkgdesc="Tool for building and running mobile apps written in Go"
arch=( 'i686' 'x86_64' 'aarch64' 'armv8' 'armv7' 'armv7l' 'armv7h' 'armv6h' 'armhf' 'armel' 'arm' 'riscv64' )
makedepends=("git" "go")
_pkggopath=github.com/${_githuborg}/${_pkgname}
url=https://${_pkggopath}
license=('custom:BSD')
options=('!strip' '!emptydirs')
source=("git+${url}.git#branch=${BRANCH:-master}")
sha256sums=('SKIP')

pkgver() {
_version=$(git ls-remote --tags --refs --sort="version:refname" ${url}.git | tail -n1)
[[ $_version != "" ]] && _version=${_version##*/} && _version=${_version%%-*} && _version=${_version//v/} && echo ${_version} && return
[[ $_version == "" ]] && echo "$(date +%Y%m%d)" && return

}
prepare() {
# https://wiki.archlinux.org/index.php/Go_package_guidelines
mkdir -p ${srcdir}/go/src/github.com/${_githuborg}/ ${srcdir}/go/bin
ln -rTsf ${srcdir}/${_pkgname} ${srcdir}/go/src/${_pkggopath}
}


build() {
GOPATH="${srcdir}/go"
GOBIN="${GOPATH}/bin"
cd "${srcdir}"/go/src/${_pkggopath} || exit
_cmddir="${srcdir}"/go/src/${_pkggopath}/cmd
go mod init || true
 go mod tidy || true
 go mod vendor || true
_msg2 "building gomobile binaries"
pwd
go build -trimpath --ldflags="" --ldflags "-s -w -buildid=" -o $GOBIN/ $GOPATH/src/github.com/golang/mobile/cmd/gomobile
go build -trimpath --ldflags="" --ldflags "-s -w -buildid=" -o $GOBIN/ $GOPATH/src/github.com/golang/mobile/cmd/gobind
}

package() {
	GOPATH="${srcdir}/go"
	GOBIN="${GOPATH}/bin"
  _msg2 'Installing license...'
  install -Dm 644 "$srcdir/mobile"/{LICENSE,PATENTS} \
          -t "$pkgdir/usr/share/licenses/gomobile"

  _msg2 'Installing documentation...'
  for _doc in CONTRIB* README.md; do
    install -Dm 644 "$srcdir/mobile"/$_doc \
            -t "$pkgdir/usr/share/doc/gomobile"
  done
  cp -dpr --no-preserve=ownership "$srcdir/mobile/doc" \
    "$pkgdir/usr/share/doc/gomobile"

  _msg2 'Installing...'
  install -Dm 755 "${GOBIN}"/{gomobile,gobind} -t "$pkgdir/usr/bin"

  _msg2 'Cleaning up pkgdir...'
  find "$pkgdir" -type d -name .git -exec rm -r '{}' +
  find "$pkgdir" -type f -name .gitignore -exec rm -r '{}' +
}
_msg2() {
(( QUIET )) && return
local mesg=$1; shift
printf "${BLUE}  ->${ALL_OFF}${BOLD} ${mesg}${ALL_OFF}\n" "$@"
}
