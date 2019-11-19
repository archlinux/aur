# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>

pkgname=dgraph-git
pkgver=1.1.0.r150.g1ee42ef40
pkgrel=1
pkgdesc='Fast, transactional, distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE' 'custom:DCL')
makedepends=('go' 'git')
provides=('dgraph')
conflicts=('dgraph' 'dgraph-bin')
source=("$pkgname::git+$url#branch=master"
        'dgraph.service'
        'dgraph-zero.service')
sha256sums=('SKIP'
            '94449db0bbd30aca993dbc6486fbec615e2cada7cd3d91e6b99d6a426a5d7ace'
            '402c5a022615f47d26db47f375f242638d04abbed3bfd22f86067f8f19031f83')

pkgver() {
  cd "$srcdir/$pkgname"
  # cuts off 'v' prefix and uses most recent un-annotated tag reachable from the
  #   last commit
  # see https://wiki.archlinux.org/index.php/VCS_package_guidelines#Git
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  # the upstream repo provides a Makefile, but this PKGBUILD ignores it so that
  #   further build options can be specified, as seen below
  # see https://wiki.archlinux.org/index.php/Go_package_guidelines#Building and
  #   `go help build`
  # enables PIE security mode, without having to target go-pie as a dependency
  # strips build paths from binary for reproducible builds
  # passes flags to go tool link
  # see `go tool link --help`
  # surrounding an option with single quotes ensures that it will be passed
  #   as a single argument regardless of any spaces
  # '-X' options mark the binary so that it reports proper version information
  # '-extldflags' passes options to the external linking tool to enable RELRO, without
  #   overwriting default linker flags
  cd "$srcdir/$pkgname"/dgraph
    go build -v \
    -o dgraph \
    -buildmode=pie \
    -trimpath \
    -ldflags "-X 'github.com/dgraph-io/dgraph/x.dgraphVersion=$(git rev-parse --short HEAD)' \
              -X 'github.com/dgraph-io/dgraph/x.gitBranch=$(git rev-parse --abbrev-ref HEAD)' \
              -X 'github.com/dgraph-io/dgraph/x.lastCommitSHA=$(git log -1 --format=%ci)' \
              -X 'github.com/dgraph-io/dgraph/x.lastCommitTime=$(git describe --abbrev=0)' \
              -extldflags '-Wl,-z,relro,-z,now'" \
    .
  strip -x dgraph
}

package() {
  install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" "$srcdir/$pkgname"/{LICENSE*,licenses/*}
  install -Dm755 "$srcdir/$pkgname/dgraph/dgraph" "$pkgdir/usr/bin/dgraph"
  install -Dm644 dgraph.service "$pkgdir/usr/lib/systemd/system/dgraph.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
}

# vim:set ts=2 sw=2 et:
