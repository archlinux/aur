# Maintainer: Leonid Lednev <leonidledn at gmail dot com>
_name='trufflehog'
pkgname="$_name-git"
pkgver=3.95.9.r10.g870880131
pkgrel=1
pkgdesc="Secrets scanner for repositories"
arch=('x86_64' 'aarch64')
url="https://trufflesecurity.com/$_name"
license=('AGPL-3.0-only')
provides=("$_name")
conflicts=("$_name")
depends=(
  'glibc'
)
makedepends=(
  'git'
  'go>=1.25.0'
)
source=("git+https://github.com/trufflesecurity/$_name")
b2sums=('SKIP')

prepare() {
  cd "$_name"
  export GOPATH="$srcdir"
  go mod download -modcacherw
}

pkgver() {
  cd "$_name"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_name"
  sed -i "s/dev/$pkgver/" pkg/version/version.go
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export GOPATH="$srcdir"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"
  go build -ldflags "-compressdwarf=false -linkmode external"
  ./trufflehog --completion-script-bash > "$_name-c.bash"
  ./trufflehog --completion-script-zsh > "$_name-c.zsh"
}

package() {
  cd "$_name"
  install -Dm0755 -t "$pkgdir/usr/bin/" "$_name"
  install -Dm0644 -t "$pkgdir/usr/share/man/man1/" "docs/man/$_name.1"
  install -Dm0644 "$_name-c.bash" "$pkgdir/usr/share/bash-completion/completions/$_name"
  install -Dm0644 "$_name-c.zsh" "$pkgdir/usr/share/zsh/site_functions/_$_name"
}

# vim: ts=2 sw=2 et:
