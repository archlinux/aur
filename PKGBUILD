# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.0.21
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
sha512sums=('77b3e372355578bb44ac65e73ef1c430b4d8e1891b84028735cf68758158feaf32696cc2de804e99d476511b4b8fb7dd7915730e2bc09cde3278257aeefdf7d8')
b2sums=('50338e0576f083b571232a11b35344cf3a13394547f2c1877c68e292accebe5a3a1b5eb0c681ea7b5d0f532b0ee82d696b17947be3f067ce03b5b94abee67437')

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
