# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=talhelper
pkgver=3.1.9
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
sha512sums=('b9fb5f915a5ed5d3388774a650c97b210caf1d92843c8d323b9249e0f6c361a4784c0ecbe9e3bbce6c96dca8cdf36bf01082f50e1b7cf22d53ab1bcc8b3f5f9a')
b2sums=('f36d400985e534081e89477b37e13c142dd32f61801bc8567c967ed5f64c9d0b86d4c3f9b533f055a3a5205db20f1ed5693746748cd4435310590bc0ebfdda49')

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
