# Maintainer: Gina White <ginabythebay@gmail.com>

_exename=cloud-sql-proxy
pkgname=cloud-sql-proxy-git
pkgver=0.1.1
pkgrel=1
pkgdesc="The Cloud SQL Proxy allows a user with the appropriate permissions to connect to a Second Generation Cloud SQL database without having to deal with IP whitelisting or SSL certificates manually."
arch=('x86_64' 'i686')
url="https://github.com/GoogleCloudPlatform/cloudsql-proxy"
license=('Apache')
makedepends=('go' 'git')
depends=('glibc')
options=('!strip' '!emptydirs')
_gogeturl="github.com/GoogleCloudPlatform/cloudsql-proxy/cmd/cloud_sql_proxy"
_gourl="github.com/GoogleCloudPlatform/cloudsql-proxy"

build() {
  export GOROOT=/usr/lib/go

  rm -rf build
  mkdir -p build/go
  cd build/go

  for f in "$GOROOT/"*; do
    ln -s "$f"
  done

  rm pkg
  mkdir pkg
  cd pkg

  for f in "$GOROOT/pkg/"*; do
    ln -s "$f"
  done

  platform=`for f in "$GOROOT/pkg/"*; do echo \`basename $f\`; done|grep linux`

  rm -f "$platform"
  mkdir "$platform"
  cd "$platform"

  for f in "$GOROOT/pkg/$platform/"*.h; do
    ln -s "$f"
  done

  export GOROOT="$srcdir/build/go"
  export GOPATH="$srcdir/build"

  go get -fix "$_gogeturl"

  # Prepare executable
  if [ -d "$srcdir/build/src" ]; then
    cd "$srcdir/build/src/$_gogeturl"
    go build -o "$srcdir/build/$pkgname"
  else
    echo 'Old sources for a previous version of this package are already present!'
    echo 'Build in a chroot or uninstall the previous version.'
    return 1
  fi
}

package() {
  # Package license (if available)
  for f in LICENSE COPYING; do
    if [ -e "$srcdir/build/src/$_gourl/$f" ]; then
      install -Dm644 "$srcdir/build/src/$_gourl/$f" \
        "$pkgdir/usr/share/licenses/$pkgname/$f"
    fi
  done

  # Package executables
  if [ -e "$srcdir/build/$pkgname" ]; then
    install -Dm755 "$srcdir/build/$pkgname" \
      "$pkgdir/usr/bin/$_exename"
  fi
}

# vim:set ts=2 sw=2 et: