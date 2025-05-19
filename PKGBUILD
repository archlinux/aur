# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.0.25
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
sha512sums=('c44f7c3e5b17e941d0666bf5c266719c99a655dc4ba9d2f0db814f07d625c2194b4f8a4578ea3307b9fd9edaff2e66a1d6f0bf0f8f0015409b3d217206e01d81')
b2sums=('549299405ca4df735f5d247aed7c3c40ba49d2ea5eb8e13453f5b2cbfba140e43f57b48f5f42199939377de262fefa7e5b45ba7516d2cb942ed919094ed724a8')

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
