# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.1.13
pkgrel=1
pkgdesc='A tool to help create Talos clusters in your GitOps repository'
arch=(x86_64)
url='https://budimanjojo.github.io/talhelper'
license=(BSD-3-Clause)
depends=(glibc)
makedepends=(git go)
optdepends=(
  'talosctl: apply generated configuration'
  'sops: manage secrets'
)
options=(!lto)
source=("$pkgname::git+https://github.com/budimanjojo/talhelper#tag=v$pkgver")
sha512sums=('4852ffbe57a9d597be1d10ba85a65537df5dccd291f54f72c99e6e031223915a7e734c9d3844307d6f8216a387e0afb99dd249143415a75e7fe85d291b5887b5')
b2sums=('ad403dfc8383c144f5bbb2df43a77d0c552f2bfa5d74f0b50f5bca0a7ba9a914206775c9df12beda47952eb1d4910592d2b5dd8360162ce31c4aa0a3d2f0ce71')

prepare() {
  cd "$pkgname"

  # create directory for build output
  mkdir build

  # download dependencies
  export GOPATH="${srcdir}"
  go mod download
}

build() {
  cd "$pkgname"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOPATH="${srcdir}"

  go build -v \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-compressdwarf=false \
    -linkmode external \
    -extldflags '${LDFLAGS}' \
    -X github.com/budimanjojo/talhelper/cmd.version=$pkgver" \
    -o build \
    .

  # generate shell completions
  cd build
  ./talhelper completion bash > completion.bash
  ./talhelper completion fish > completion.fish
  ./talhelper completion zsh > completion.zsh
}

package() {
  cd "$pkgname"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/talhelper

  # shell completions
  install -vDm644 build/completion.bash "$pkgdir/usr/share/bash-completion/completions/talhelper"
  install -vDm644 build/completion.fish "$pkgdir/usr/share/fish/vendor_completions.d/talhelper.fish"
  install -vDm644 build/completion.zsh "$pkgdir/usr/share/zsh/site-functions/_talhelper"

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
