# Maintainer: George Rawlinson <george@rawlinson.net.nz>

pkgname=prometheus-nextcloud-exporter
_pkgname=nextcloud-exporter
pkgver=0.6.1
pkgrel=1
pkgdesc='Prometheus exporter for Nextcloud metrics'
arch=('x86_64')
url='https://github.com/xperimental/nextcloud-exporter'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
backup=("etc/$_pkgname.yml")
options=('!lto')
_commit='98d4d4607e9d020dc19b8c21e1401b6b27a5d3a8'
source=(
  "$pkgname::git+$url.git#commit=$_commit"
  'sysusers.conf'
  "$_pkgname.yml"
)
b2sums=('SKIP'
        '059b6235912cd7b94dfa0cf611e82fef572af3f76c268be821cc07d10a8e2752881497bc24ead48a6a7f2940b732a0d783c1193302eab943a594673bbbaa65fd'
        '1399770f51b195caef7303f71a4971e0be2361b5b638d5c88ed11a86dc260792fce0fa24e5140f2c0b2e655170bb52d6bfece6665c8a33ae00d367072e78a92b')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create folder for build output
  mkdir build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -buildmode=pie \
    -trimpath \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.Version=$pkgver \
    -X main.GitCommit=$_commit" \
    -o build \
    .
}

check() {
  cd "$pkgname"
  go test ./...
}

package() {
  # config
  install -vDm644 -t "$pkgdir/etc" "$_pkgname.yml"

  cd "$pkgname"

  # systemd integration
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_pkgname.conf"
  install -vDm644 "contrib/$_pkgname.service" -t "$pkgdir/usr/lib/systemd/system"

  # binary
  install -Dm755 -t "$pkgdir/usr/bin" "build/$_pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" ./*.md

  # license
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
