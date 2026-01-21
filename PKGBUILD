# Contributor: Lex Black <autumn-wind@web.de>
# Contributor: Vincent Nascone <vincent@arch.nascone.net>

_name=miniflux
pkgname=miniflux-git
pkgver=2.2.16.r28.g2fa8995
pkgrel=1
pkgdesc='Minimalist and opinionated feed reader (Git version)'
arch=(x86_64)
url='https://miniflux.app'
license=(Apache-2.0)
depends=(glibc)
makedepends=(git go)
optdepends=('postgresql: for local PostgreSQL instance')
conflicts=('miniflux')
provides=('miniflux')
backup=(etc/miniflux.conf)
source=(
  "$_name::git+https://github.com/miniflux/v2.git"
  sysusers.conf
)
sha512sums=('SKIP'
            '4a51cccf15f37da66c56e4721171ab858b894f4f74f3210fb275b437fc7fa99cce21a8a98703462e07163ce3f9ea35d8e2a9f8b5ad147cb819092a037c42c17e')
b2sums=('SKIP'
        '6c1bbc5bebb319d921c9f511a156c4e578811319423e99cead87f2044e6269abf38654733376b83f8dbb7432c816f795918935bae741529d7395f249027b2932')


pkgver() {
  cd $_name
  git describe --tags --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

prepare() {
  cd "$_name"

  # revert unnecessary change to systemd unit file
  git revert --no-commit 527c5f49cbe851b53b87c25dd19e8b4760aa7032

  # create directory for build output
  mkdir -p build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "$_name"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  # ensure build date is reproducible
  local BUILD_DATE=$(git show --no-patch --format=%cd --date=format:%Y-%m-%d-%H:%M:%S)

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}' \
    -X miniflux.app/v2/internal/version.Version=${pkgver} \
    -X miniflux.app/v2/internal/version.Commit=$(git rev-parse HEAD) \
    -X miniflux.app/v2/internal/version.BuildDate=${BUILD_DATE}" \
    -o build \
    .
}

#check() {
#  cd "$_name"
#  go test -v -race -count=1 ./...
#}

package() {
  cd "$_name"

  # binary
  install -vDm755 "build/$_name.app" "$pkgdir/usr/bin/$_name"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/man/man1" "$_name.1"
  install -vDm644 -t "$pkgdir/usr/share/doc/$_name" *.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$_name" LICENSE

  # systemd integration
  install -vDm644 -t "$pkgdir/usr/lib/systemd/system" "packaging/systemd/$_name.service"
  install -vDm644 "$srcdir/sysusers.conf" "$pkgdir/usr/lib/sysusers.d/$_name.conf"
  install -vDm600 -t "$pkgdir/etc" "packaging/$_name.conf"
}
