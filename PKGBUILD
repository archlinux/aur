# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.0.16
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
sha512sums=('c80f3ad4450b197acaf0dcf154251ef53bef3d337af3e912ef7443fc424adb235eacd8509ef3688417fe74f669908db84948167bd2dc8970914b5fe3f3b6c51e')
b2sums=('4f9673a7643a9193fde9ff5f8dd2594d24ba70abde538215710ccbacc57c2f210ba270f91a2369ca59464d06e564b7e8eef7e38559c43c616b047946a648a718')

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
