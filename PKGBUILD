# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=autobrr
pkgver=1.40.1
_commit='9227bdb5dc6d39ad1d423ea06f65cc544d437468'
pkgrel=1
pkgdesc='The modern download automation tool for torrents'
arch=('x86_64')
url='https://autobrr.com'
license=('GPL2')
depends=('glibc')
makedepends=(
  'git'
  'go'
  'nodejs'
)
optdepends=(
  'postgresql'
  'qbittorrent'
  'rtorrent'
  'transmission-cli'
  'deluge'
  'radarr'
  'sonarr'
  'lidarr'
)
options=('!lto')
source=(
  "$pkgname::git+https://github.com/autobrr/autobrr#commit=$_commit"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
b2sums=('9de18f9ffc29288ee539c4c2006fdf04d607113cd287ad3b1bdd509f63a637041503e486848dc70abd4360559683ec4920a5e648679930b35394f516c10dfe6a'
        '68956fdadf43c4c714b0867dd5840971472e5647d3fef81a9b6a371610e7dbf1665b19945812ea2731da8e66f063db4f7fcefb1a4e70c5a437ecfa164697d8f7'
        'bd63a8a0f66561c10c81c85f8488c4e89e6c65fda6fb21715c24f7d9c565f0da502dd6b6ab68df360620dcc5aa5cc3fcf3e9ede6f202b5ddde6d2c2d0765342d'
        '55e4ab4ad7434d8868fb90e764a541aacf0bbe9e5236fa17f0184252c494d9d77d6b16b6f8106e5eb5d8161f0f20dd464ab052a46de949d5e4a5f89c51e2fdab')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download go dependencies
  export GOPATH="${srcdir}"
  go mod download

  # setup corepack
  mkdir tmp-bin
  corepack enable --install-directory "$(pwd)/tmp-bin"
  export PATH="$(pwd)/tmp-bin:$PATH"

  # download node dependencies
  cd web
  pnpm install --frozen-lockfile
}

build() {
  cd "$pkgname"

  # ensure build date is reproducible
  local _build_date="$(date --utc --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y-%m-%d)"

  # build web app
  pushd web
  pnpm run build
  popd

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  # build binaries
  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags ${LDFLAGS} \
    -X main.version=$pkgver \
    -X main.commit=$_commit \
    -X main.date=$_build_date" \
    -o build \
    ./cmd/...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/*

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md
}
