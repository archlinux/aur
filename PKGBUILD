# Maintainer: Max Harmathy <harmathy@secure.mailbox.org>
# Contributor: Arturo Penen <apenen@gmail.com>

# SPDX-License-Identifier: 0BSD

pkgname=ghorg
pkgver=1.11.6
pkgrel=1
pkgdesc='allows you to quickly clone all of an orgs, or users repos into a single directory.'
arch=('x86_64')
url='https://github.com/gabrie30/ghorg'
license=('Apache-2.0')
depends=('glibc')
makedepends=('go')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('187dd7de0b57b2e92002471730ab26082bb52e4f15f53c1807e513c91d5f472b')

build() {
  cd $pkgname-$pkgver
  local ld_flags=(
    -linkmode=external
  )
  local go_flags=(
    -buildmode=pie
    -trimpath
    "-ldflags=${ld_flags[*]}"
    -mod=readonly
    -modcacherw
  )
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  go build "${go_flags[@]}"
}

package() {
  install -Dm 755 "$pkgname-$pkgver/ghorg" "$pkgdir/usr/bin/ghorg"

  install -dm 755 "$pkgdir/usr/share/bash-completion/completions"
  "$pkgdir/usr/bin/$pkgname" completion bash > "$pkgdir/usr/share/bash-completion/completions/$pkgname"

  install -dm 755 "$pkgdir/usr/share/zsh/site-functions"
  "$pkgdir/usr/bin/$pkgname" completion zsh >  "$pkgdir/usr/share/zsh/site-functions/_$pkgname"

  install -dm 755 "$pkgdir/usr/share/fish/completions"
  "$pkgdir/usr/bin/$pkgname" completion fish > "$pkgdir/usr/share/fish/completions/$pkgname.fish"
}
