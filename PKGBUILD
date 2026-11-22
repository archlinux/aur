# Maintainer: Konstantin Nikiforov <the.konstantin.nikiforov@yandex.ru>

# Upstream has no tagged releases yet, so this tracks the default branch.
pkgname=git-cow-worktree-git
pkgver=r4.0f6852c
pkgrel=1
pkgdesc='Drop-in replacement for git worktree add using copy-on-write reflinks'
arch=(x86_64 aarch64)
url='https://github.com/josharian/git-cow-worktree'
license=(MIT)
depends=(git)
makedepends=(go)
provides=(git-cow-worktree)
conflicts=(git-cow-worktree)
source=("git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/git-cow-worktree"
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$srcdir/git-cow-worktree"
  export CGO_ENABLED=0
  go build \
    -buildvcs=false \
    -mod=readonly \
    -modcacherw \
    -trimpath \
    -ldflags='-s -w' \
    -o git-cow-worktree .
}

check() {
  cd "$srcdir/git-cow-worktree"
  export CGO_ENABLED=0
  # The e2e suite asserts that clones keep the source mtime, which FICLONE
  # does not do on Linux; run only the filesystem-independent tests here.
  go test -buildvcs=false -mod=readonly \
    -run '^(TestParseArgsCompatibility|TestPathCanonicalizationResolvesSymlink)$' \
    ./...
}

package() {
  cd "$srcdir/git-cow-worktree"
  install -Dm755 git-cow-worktree "$pkgdir/usr/bin/git-cow-worktree"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
