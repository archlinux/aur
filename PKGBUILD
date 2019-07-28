# Maintainer: Kyle Westhaus <kwesthaus+aur at gmail dot com>
# Maintainer: Kevin Orr <kevinorr54+aur at gmail dot com>
# Contributor: Kaley Main <kaleypoole17 at gmail dot com>
# Contributor: John Trengrove <john at retrofilter dot com>

pkgname=dgraph-git
pkgver=1.0.12.rc3.r628.gcf7c1e630
pkgrel=1
pkgdesc='Fast, transactional, distributed graph database'
arch=('x86_64')
url='https://github.com/dgraph-io/dgraph'
license=('APACHE' 'custom:DCL')
makedepends=('go' 'git')
provides=('dgraph')
conflicts=('dgraph' 'dgraph-bin')
source=("$pkgname::git+$url"
        'dgraph.service'
        'dgraph-zero.service')
sha256sums=('SKIP'
            '94449db0bbd30aca993dbc6486fbec615e2cada7cd3d91e6b99d6a426a5d7ace'
            '402c5a022615f47d26db47f375f242638d04abbed3bfd22f86067f8f19031f83')

prepare() {
  # sets up a fresh temporary go path and symlinks the source repo to appear under
  #   the proper directory structure to avoid dependency manager weirdness
  # see https://wiki.archlinux.org/index.php/Go_package_guidelines#Old_Go_projects_(for_Go_%3C1.11)
  mkdir -p "$srcdir/tmpgopath/src/github.com/dgraph-io/"
  ln -rTsf "$srcdir/$pkgname" "$srcdir/tmpgopath/src/github.com/dgraph-io/dgraph"
}

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
  cd "$srcdir"
  # enables PIE security mode, without having to target go-pie as a dependency
  # strips build paths from binary for reproducible builds
  # passes flags to go tool link
  # see `go tool link --help`
  # surrounding an option with single quotes ensures that it will be passed
  #   as a single argument regardless of any spaces
  # '-X' options mark the binary so that it reports proper version information
  # '-extldflags' passes options to the external linking tool to enable RELRO, without
  #   overwriting default linker flags
  GOPATH="$(pwd)/tmpgopath" go install \
    -buildmode=pie \
    -gcflags "all=-trimpath=$PWD" \
    -asmflags "all=-trimpath=$PWD" \
    -ldflags "-X github.com/dgraph-io/dgraph/x.lastCommitSHA=$(git --git-dir ./$pkgname/.git rev-parse --short HEAD) -X 'github.com/dgraph-io/dgraph/x.lastCommitTime=$(git --git-dir ./$pkgname/.git log -1 --format=%ci)' -X github.com/dgraph-io/dgraph/x.dgraphVersion=$(git --git-dir ./$pkgname/.git describe --always --tags) -X github.com/dgraph-io/dgraph/x.gitBranch=$(git --git-dir ./$pkgname/.git rev-parse --abbrev-ref HEAD) -extldflags '$LDFLAGS -Wl,-z,relro,-z,now'" \
    -v "./tmpgopath/src/github.com/dgraph-io/dgraph/dgraph/..."
}

package() {
  cd "$srcdir"
  install -Dm644 "$pkgname/licenses/DCL.txt" "$pkgdir/usr/share/licenses/$pkgname/DCL.txt"
  for binary in dgraph; do
    install -Dm755 "tmpgopath/bin/$binary" "$pkgdir/usr/bin/$binary"
  done
  install -Dm644 dgraph.service "$pkgdir/usr/lib/systemd/system/dgraph.service"
  install -Dm644 dgraph-zero.service "$pkgdir/usr/lib/systemd/system/dgraph-zero.service"
  install -d "$pkgdir/var/lib/dgraph/data"
}

# vim:set ts=2 sw=2 et:
