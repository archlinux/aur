# shellcheck disable=SC2034 # unused var
# shellcheck disable=SC2154 # var referenced but not assigned
# shellcheck disable=SC2164 # cd might fail

# Maintainer: Štěpán Němec <stepnem@smrk.net>

# there is already a package named 'forge' in the extra
# repository; 'git-pkgs-forge' is the name used by brew
# (macOS), let's follow suit
pkgname=git-pkgs-forge
_cmdname=forge
pkgver=0.10.0
pkgrel=1
pkgdesc='CLI for working with git forges (GitHub, GitLab, Gitea/Forgejo, Bitbucket Cloud, Gerrit, Tangled)'
arch=(x86_64)
url=https://github.com/git-pkgs/forge
license=(MIT)
depends=(glibc)
makedepends=(go)
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('fb221afbe54cbd8dcfbe5a476df0b6aa93bea83e23455ac8eaca3b7b0eedd33c')

build() {
  cd "$_cmdname-$pkgver"
  export CGO_ENABLED=1 # -linkmode=external (which Arch wants) needs this :-(
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
  go build -o "$_cmdname" ./cmd/forge
}

check() {
  cd "$_cmdname-$pkgver"
  go test ./...
}

package() {
  cd "$_cmdname-$pkgver"
  install -Dm755 "$_cmdname" "$pkgdir/usr/bin/$_cmdname"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
