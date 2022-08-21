# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=autobrr
pkgver=1.5.0
pkgrel=1
pkgdesc='The modern download automation tool for torrents'
arch=('x86_64')
url='https://autobrr.com'
license=('unknown') # TODO open an issue to clarify this issue
depends=('glibc')
makedepends=('git' 'go' 'yarn')
optdepends=(
  'postgresql'
  'qbittorrent'
  'transmission-cli'
  'deluge'
  'radarr'
  'sonarr'
  'lidarr'
)
options=('!lto')
_commit='61741064c9dbcb1767520f9941205c0a2a53c888'
source=("$pkgname::git+https://github.com/autobrr/autobrr#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download go dependencies
  go mod download

  # download yarn dependencies
  cd web
  yarn install
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  # ensure build date is reproducible
  local _build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"

  # build web app
  pushd web
  yarn build
  popd

  # build binaries
  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags ${LDFLAGS} \
    -X main.version=$pkgver \
    -X main.commit=$_commit \
    -X main.date=$_build_date" \
    -o build \
    ./cmd/...
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
