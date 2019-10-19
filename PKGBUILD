# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Rudi [KittyCash] <rudi@skycoinmail.com>
pkgname=cx
pkgname1=cx
projectname=skycoin
githuborg=skycoinproject
pkgdesc="CX Skycoin Blockchain Programming Language"
pkgver=0.7.1
pkggopath="github.com/${githuborg}/${pkgname1}"
pkgrel=2
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=('git' 'go' 'gcc' 'glade' 'xorg-server-xvfb' 'libxinerama' 'libxcursor' 'libxrandr' 'libglvnd' 'libglade' 'mesa' 'libxi' 'cairo' 'perl' 'pango')
source=("${url}/archive/v${pkgver}.tar.gz"
"https://raw.githubusercontent.com/0pcom/skycoin_archlinux_packages/master/key")
sha256sums=('5659cc64d4caa359da4ba68ef2729b2b87e477ce11a9dfe1a751e9a48acf7c6a'
'41c0a4a42ae64479b008392053f4a947618acd6bb9c3ed2672dafdb2453caa14')

export GOOS=linux
export GOPATH="${srcdir}"

export CGO_ENABLED=1

case "$CARCH" in
x86)      export GOARCH="386" GO386="387" ;;
x86_64)   export GOARCH="amd64" ;;
arm*)     export GOARCH="arm" ;;
armel)    export GOARCH="arm" GOARM="5" ;;
armhf)    export GOARCH="arm" GOARM="6" ;;
armv7)    export GOARCH="arm" GOARM="7" ;;
armv8)    export GOARCH="arm64" ;;
aarch64)  export GOARCH="arm64" ;;
mips)     export GOARCH="mips" ;;
mips64)   export GOARCH="mips64" ;;
mips64el) export GOARCH="mips64le" ;;
mipsel)   export GOARCH="mipsle" ;;
*)        return 1 ;;
	esac


prepare() {
	gpg --import key
	#verify PKGBUILD signature
	gpg --verify ../PKGBUILD.sig ../PKGBUILD
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  mkdir -p ${srcdir}/go/src/${pkggopath//${pkgname1}/} "${srcdir}"/go/bin
  ln -rTsf ${srcdir}/${pkgname1}-${pkgver} ${srcdir}/go/src/${pkggopath}
  cd ${srcdir}/go/src/${pkggopath}/
	#Lines 58 & 59 of the Makefile will try to install debian dependancies if they are not omitted
	sed '58s/.*/#&/' Makefile > Makefile1
	mv Makefile1 Makefile
	sed '59s/.*/#&/' Makefile > Makefile1
	mv Makefile1 Makefile
}

build() {
  export GOPATH=${srcdir}/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
	#  cp -b Makefile ${srcdir}/go/src/${pkggopath}/Makefile
  cd ${srcdir}/go/src/${pkggopath}
	make install-gfx-deps
  make build-full
	go install \
	  -gcflags "all=-trimpath=${GOPATH}" \
	  -asmflags "all=-trimpath=${GOPATH}" \
	  -ldflags "-extldflags ${LDFLAGS}" \
	  -v ./cmd/...
}

package() {
	msg2 'installing CX'
	options=(!strip staticlibs)
	#make dirs
	mkdir -p ${pkgdir}/usr/bin
	mkdir -p ${pkgdir}/usr/lib/${projectname}/go/bin
	mkdir -p ${pkgdir}/usr/lib/${projectname}/go/src/github.com/${projectname}/
	mkdir -p ${pkgdir}/usr/lib/${projectname}/${pkgname1}/
	msg2 'installing binaries'
	#^MAKE DEPENDANCIES ARE IN GOBIN; GET ONLY CX & NEWCOIN
	install -Dm755 ${srcdir}/go/bin/newcoin ${pkgdir}/usr/lib/${projectname}/go/bin/newcoin
	ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/newcoin ${pkgdir}/usr/bin/newcoin
	chmod 755 ${pkgdir}/usr/bin/newcoin
	install -Dm755 ${srcdir}/go/bin/${pkgname1} ${pkgdir}/usr/lib/${projectname}/go/bin/${pkgname1}
	ln -rTsf ${pkgdir}/usr/lib/${projectname}/go/bin/${pkgname1} ${pkgdir}/usr/bin/${pkgname1}
	chmod 755 ${pkgdir}/usr/bin/${pkgname1}

}
