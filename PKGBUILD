# Maintainer: Moses Narrow <moe_narrow@use.startmail.com>
# Maintainer: Steve Skydev <steve@skycoin.net>
pkgname=cx
pkgname1=cx
projectname=skycoin
pkgdesc="CX Skycoin Blockchain Programming Language"
pkgver=20190523.1206_048278b1
pkggopath="github.com/$projectname/$pkgname1"
pkgrel=1
arch=('any')
url="https://${pkggopath}"
license=()
makedepends=('git' 'go' 'gcc')
source=("git+${url}.git#branch=${BRANCH:-develop}"
"Makefile")
sha256sums=('SKIP'
'40183bcce33ecc8f9dda374532efe9a303ed1490a0cc03b9fc2db8982166db74')
validpgpkeys=('DE08F924EEE93832DABC642CA8DC761B1C0C0CFC')


export GOOS=linux
export GOPATH="$srcdir"
export GOROOT="$builddir"
export GOBIN="$GOROOT"/bin
export GOROOT_FINAL=/usr/lib/go

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

  pkgver() {
  	cd "$srcdir/$pkgname1"
  	local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
  	local count=$(git rev-list --count HEAD)
  	local commit=$(git rev-parse --short HEAD)
  	echo "$date.${count}_$commit"
  }

prepare() {
  # https://wiki.archlinux.org/index.php/Go_package_guidelines
  mkdir -p $srcdir/go/src/${pkggopath//$pkgname1/} "$srcdir"/go/bin
  ln -rTsf $srcdir/$pkgname1 $srcdir/go/src/$pkggopath
  cd $srcdir/go/src/$pkggopath/
  git checkout develop
  git submodule --quiet update --init --recursive

  export GOPATH="$srcdir"/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
}

build() {
  export GOPATH=$srcdir/go
  export GOBIN=${GOPATH}/bin
  export PATH=${GOPATH}/bin:${PATH}
  cp -b Makefile $srcdir/go/src/$pkggopath/Makefile
  cd $srcdir/go/src/$pkggopath
  make install


#  msg2 'creating cx chains setup script'
#  mkdir -p $srcdir/$pkgname1-scripts
#  cd $srcdir/$pkgname1-scripts
#  echo -e '#!/bin/bash \n #setup symlink for fiber.toml along GOPATH  \n export GOBIN=/usr/lib/skycoin/go/bin \n echo "export GOBIN=/usr/lib/skycoin/go/bin" \n export GOPATH=GOBIN=/usr/lib/skycoin/go \n echo "export GOPATH=GOBIN=/usr/lib/skycoin/go" \n sudo ln -s /usr/lib/skycoin/cx/fiber.toml /usr/lib/skycoin/go/src/github.com/skycoin/cx/fiber.toml \n echo "Running: skycoin-cli addressGen"  \n skycoin-cli addressGen  \n echo "edit /usr/lib/skycoin/cx/fiber.toml" \n echo "export SECRET_KEY=" \n echo "export PUBLIC_KEY=" \n echo "cx --blockchain --heap-initial 100 --stack-size 100 --secret-key $SECRET_KEY --public-key $PUBLIC_KEY counter-bc.cx" \n echo "cx --blockchain --heap-initial 100 --stack-size 100 --secret-key $SECRET_KEY --public-key $PUBLIC_KEY counter-bc.cx"' > $pkgname1-chaintest
#  chmod +x $pkgname1-chaintest
}

package() {
msg2 'installing CX'
options=(!strip staticlibs)
#make dirs
mkdir -p $pkgdir/usr/bin
mkdir -p $pkgdir/usr/lib/$projectname/go/bin
mkdir -p $pkgdir/usr/lib/$projectname/go/src/github.com/$projectname/
mkdir -p $pkgdir/usr/lib/$projectname/$pkgname1/
#install sources
cp -r $srcdir/$pkgname1 $pkgdir/usr/lib/$projectname/go/src/github.com/$projectname/$pkgname1
#install binary
msg2 'installing binaries'
cxbins="$srcdir"/go/bin
cxbin=$( ls $cxbins )
for i in $cxbin; do
  install -Dm755 $srcdir/go/bin/$i $pkgdir/usr/lib/$projectname/go/bin/$i
  ln -rTsf $pkgdir/usr/lib/$projectname/go/bin/$i $pkgdir/usr/bin/$i
  chmod 755 $pkgdir/usr/bin/$i
done
#install the scripts
#cxscripts=$( ls $srcdir/$pkgname1-scripts )
#for i in $cxscripts; do
#cp $srcdir/$pkgname1-scripts/$i $pkgdir/usr/bin/$i
#done
}
