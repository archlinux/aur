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
pkgver=2.0.14.r3354.08f530bd
pkgrel=2
epoch=1
pkgdesc='Psiphon Tunnelling Proxy'
arch=('x86_64')
url="https://github.com/Psiphon-Labs/psiphon-tunnel-core"
license=('GPL')
makedepends=('go-pie' 'perl')
depends=('glibc')
source=("git+$url.git"
        "psiphon.conf"
        "psiphon.service")
backup=('etc/psiphon.conf' 'usr/lib/systemd/user/psiphon.service')
md5sums=('SKIP'
         'c1ec9a446e89495501b8375d2682aa49'
         'a6d6b01633a39325abbdb3597c50a4cc')

pkgver() {
  cd $_pkgname
  TAG=$(git describe --tags $(git rev-list --tags --max-count=1) | sed 's/^v//')
  COMMIT=$(git rev-parse --short HEAD)
  REVISION=$(git rev-list --count HEAD)
  printf "%s.r%s.%s" "$TAG" "$REVISION" "$COMMIT"
}

build() {
  cd "$_pkgname/ConsoleClient"

  # this fixes build in current go version, official package is built with go 1.14
  go env -w GO111MODULE=off
  
  
  # Copied from the README file
  EXE_BASENAME="psiphon-tunnel-core"
  BUILDINFOFILE="${EXE_BASENAME}_buildinfo.txt"
  BUILDDATE=$(date --iso-8601=seconds)
  BUILDREPO=$(git config --get remote.origin.url)
  BUILDREV=$(git rev-parse --short HEAD)
  GOVERSION=$(go version | perl -ne '/go version (.*?) / && print $1')
  # DEPENDENCIES=$(echo -n "{" && go list -f '{{range $dep := .Deps}}{{printf "%s\n" $dep}}{{end}}' | xargs go list -f '{{if not .Standard}}{{.ImportPath}}{{end}}' | xargs -I pkg bash -c 'cd $GOPATH/src/pkg && echo -n "\"pkg\":\"$(git rev-parse --short HEAD)\","' | sed 's/,$/}/')
  DEPENDENCIES=$(echo -n "{" && GOOS=$1 go list -tags "${BUILD_TAGS}" -f '{{range $dep := .Deps}}{{printf "%s\n" $dep}}{{end}}' | GOOS=$1 xargs go list -tags "${BUILD_TAGS}" -f '{{if not .Standard}}{{.ImportPath}}{{end}}' | xargs -I pkg bash -c 'cd $GOPATH/src/$0 && if echo -n "$0" | grep -vEq "^github.com/Psiphon-Labs/psiphon-tunnel-core/" ; then echo -n "\"$0\":\"$(git rev-parse --short HEAD)\"," ; fi' pkg | sed 's/,$//' | tr -d '\n' && echo -n "}")
  

  LDFLAGS="\
-X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.buildDate=$BUILDDATE \
-X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.buildRepo=$BUILDREPO \
-X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.buildRev=$BUILDREV \
-X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.goVersion=$GOVERSION \
-X github.com/Psiphon-Labs/psiphon-tunnel-core/psiphon/common/buildinfo.dependencies=$DEPENDENCIES \
-s -w
"
  echo -e "${BUILDDATE}\n${BUILDREPO}\n${BUILDREV}\n" > $BUILDINFOFILE

  echo "Variables for ldflags:"
  echo " Build date: ${BUILDDATE}"
  echo " Build repo: ${BUILDREPO}"
  echo " Build revision: ${BUILDREV}"
  echo " Go version: ${GOVERSION}"
  echo " Dependencies: ${DEPENDENCIES}"
  echo ""
	
  
  if [ ! -d bin ]; then
    mkdir bin
  fi
  
  echo "...Building linux-x86_64"
  GOOS=linux GOARCH=amd64 go build -v -x -ldflags "$LDFLAGS" -tags "${BUILD_TAGS}" -trimpath -buildmode=pie -o $_pkgname
  RETVAL=$?
  if [ $RETVAL != 0 ]; then
    echo "....gox failed, exiting"
    exit $RETVAL
  fi
  unset RETVAL

  # TODO: Figure out how to do the stripping?
  # https://wiki.archlinux.org/index.php/Go_package_guidelines#Flags_and_build_options

}

package() {
  cd $_pkgname/ConsoleClient/
  install -Dm755 $_pkgname "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 "$srcdir/psiphon.conf" "$pkgdir/etc/psiphon.conf"
  install -Dm644 "$srcdir/psiphon.service" "$pkgdir/usr/lib/systemd/user/psiphon.service"
}
