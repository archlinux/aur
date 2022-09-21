# Contributor: Modelmat <modelmat@outlook.com.au>
# Maintainer: Modelmat <modelmat@outlook.com.au>
# Comaintainer: gilcu3 <gilcu3 [at] gmail [dot] com>

# Usage:
#  This package provides a configuration file in /etc/psiphon.conf
#  as well as systemd user service, `psiphon.service`. The service
#  will crash (probably a bug) as the `DataStoreDirectory` option
#  is empty.
#
#  However, if it is not set it will store temporary files in the
#  current working directory, which will fail for a user-service
#  (does not have write permissions for its directory). Hence, it
#  it advised that you set it to a writeable directory.
#
#  If it is necessary to have per-user configuration files, it is
#  advised to create them in `~/.config/systemd/user/` to override
#  the system-wide user service. 
#
#  This application also installs `/usr/bin/psiphon-tunnel-core`.

_pkgname=psiphon-tunnel-core
pkgname="$_pkgname-git"
GOVERSION=go1.17.13
pkgver=2.0.27.r3653.6826fe87
pkgrel=1
epoch=3
pkgdesc='Psiphon Tunnelling Proxy'
arch=($CARCH)
url="https://github.com/Psiphon-Labs/psiphon-tunnel-core"
license=('GPL3')
makedepends=('go-pie' 'perl' 'git')
depends=('glibc')
source=("git+$url.git"
        "psiphon.conf"
        "psiphon.service"
        "make.bash.patch"
        "https://storage.googleapis.com/golang/${GOVERSION}.linux-amd64.tar.gz")
backup=('etc/psiphon.conf' 'usr/lib/systemd/user/psiphon.service')
sha256sums=('SKIP'
            'c2c414831ad29bdeecd00313c473fbaa448f4750e70df1c10e863870bde179aa'
            'd0227e69cac62480951e9c83747d43fccd7bdd18224652428ab20369b84173aa'
            '681e9b7e8f32061028061a80c9663f11e2e8d396478c7067706e5ae3db121dc2'
            '4cdd2bc664724dc7db94ad51b503512c5ae7220951cac568120f64f8e94399fc')

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

prepare(){
  cd "$srcdir/${_pkgname}"
  patch --strip=1 --input=../make.bash.patch
}

# This follows the docker file in https://github.com/Psiphon-Labs/psiphon-tunnel-core/blob/master/ConsoleClient/Dockerfile
build() {
  cw=$(pwd)
  export GOPATH=$cw/home/go
  mkdir -p $GOPATH
  export GOROOT=$cw/go
  mkdir -p $GOROOT
  export PATH=$GOROOT/bin:$GOPATH/bin:$PATH
  export CGO_ENABLED=1
  
  go get -u github.com/pwaller/goupx
  
  mkdir -p "${GOPATH}/src/github.com/Psiphon-Labs"
  ln -sf  "../../../../../$_pkgname/" "${GOPATH}/src/github.com/Psiphon-Labs/psiphon-tunnel-core"
  
  cd "$_pkgname/ConsoleClient"
  ./make.bash linux

}

package() {
  cd $_pkgname/ConsoleClient/
  install -Dm755 "bin/linux/$_pkgname-x86_64" "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/psiphon.conf" "$pkgdir/etc/psiphon.conf"
  install -Dm644 "$srcdir/psiphon.service" "$pkgdir/usr/lib/systemd/user/psiphon.service"
}
