# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=mergestat
pkgver=0.5.7
pkgrel=1
pkgdesc='Query git repositories with SQL'
arch=('x86_64')
url='https://app.mergestat.com/w/public'
license=('MIT')
depends=('glibc')
makedepends=('git' 'go' 'cmake')
options=('!lto')
_commit='5b6c920656fd8bcad1d41b361756d6f3606aaa12'
source=(
  "$pkgname::git+https://github.com/mergestat/mergestat.git#commit=$_commit"
  'git2go::git+https://github.com/libgit2/git2go.git'
  'libgit2::git+https://github.com/libgit2/libgit2'
)
b2sums=('SKIP'
        'SKIP'
        'SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

prepare() {
  cd "$pkgname"

  # initialise submodules
  git submodule init
  git config submodule.git2go.url "$srcdir/git2go"
  git submodule update
  pushd git2go
  git submodule init
  git config submodule.vendor/libgit2.url "$srcdir/libgit2"
  git submodule update
  popd

  # append to various flags instead of overriding them
  sed -i Makefile -e 's/FLAGS =/FLAGS +=/g'

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  # compile static libgit2 via git2go
  export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:$(pwd)/git2go/static-build/install/lib/pkgconfig"
  make libgit2

  make

  # generate shell completions
  for shell in bash fish zsh; do
    ./.build/mergestat completion "$shell" > ".build/$shell.completion"
  done
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" .build/mergestat

  # shared library
  install -vDm644 -t "$pkgdir/usr/lib" .build/libmergestat.so

  # shell completions
  install -vDm644 .build/bash.completion "$pkgdir/usr/share/bash-completion/completions/$pkgname"
  install -vDm644 .build/fish.completion "$pkgdir/usr/share/fish/vendor_completions.d/$pkgname.fish"
  install -vDm644 .build/zsh.completion "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
