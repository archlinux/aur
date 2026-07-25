# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.1.15
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
sha512sums=('fcdeb6f51942861a61403ba19fdd0680ea502792a558959c70eeea8fc29b5118bbdf72b1edee4cbf1b971b0613465853982d2fb743815208586aa1e7d9bf21a7')
b2sums=('2a3eec3c35599ed0294c7673dca89f7d16842fe650f4bb0a611a542fb3bd1b3ffc10d0dce2df517f94edec54566e84295109a145483eff838753d07fe6e08141')

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
