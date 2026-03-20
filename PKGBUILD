# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.1.7
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
options=('!lto')
source=("$pkgname::git+https://github.com/budimanjojo/talhelper#tag=v$pkgver")
sha512sums=('6fc2c4d66644d50317fc201cf3fcd4a8088de7840348bc4ab41e81174194a383452961d6eb9c73c7d4a005769ef750510f40d92959e361ed18dcd15539616faa')
b2sums=('4410339b3dad3a02c6a6073242a3d33792577b25894510dda3b334d2a2e9cf0485cf441a54e347e1b52147905e21154605c76d0d681fa59accc847c03c7269fc')

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
