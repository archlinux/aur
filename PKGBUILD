# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.0.24
pkgrel=1
pkgdesc='A tool to help create Talos clusters in your GitOps repository'
arch=('x86_64')
url='https://budimanjojo.github.io/talhelper'
license=('BSD-3-Clause')
depends=('glibc')
makedepends=('git' 'go')
optdepends=(
  'talosctl: apply generated configuration'
  'sops: manage secrets'
)
options=('!lto')
source=("$pkgname::git+https://github.com/budimanjojo/talhelper#tag=v$pkgver")
sha512sums=('4cf55b40893b1c43921a9806acf7ed0f49c095a5e98bb0c7577c64af8663c250c33c2cda870912057d7bc8f82e9c0ce0dd3910abb2a3be12f8eaa080f9ed74d7')
b2sums=('4d68c74bfe7e8d60216a13b694c6dea5ce32abb47894c9356f5b944b2d3a78f2825d2d0a1b4c02f1d25f88e1fc0f419eeea81bf0057265d826c23285e23086cb')

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
