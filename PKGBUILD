# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.25.0
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache-2.0')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git')
source=("elixir-ls-$pkgver.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v$pkgver.tar.gz")
sha256sums=('43cc1ee3b99adff6af93d3ad49959041875b8d1eee8cc517b4b1a65d583f857c')
b2sums=('60569dc56b1f000f83c303c5096249058e0996e7618eb696a4f118e446ea00c84a2a0c10c6a51bfd65b1616f4c11c71af6eb3e5c4c03d63ede72feda0d7090e9')

build() {
  cd "$pkgname-$pkgver"

  export MIX_ENV=prod
  export MIX_HOME="$srcdir/mix-cache"

  mix deps.get
  mix compile
}

package() {
  cd "$pkgname-$pkgver"

  export MIX_ENV=prod

  install -dm0755 "$pkgdir"/usr/lib/$pkgname
  mix elixir_ls.release2 -o "$pkgdir"/usr/lib/$pkgname

  install -dm0755 "$pkgdir"/usr/bin

  echo -e "#!/bin/sh\nexec /usr/lib/$pkgname/language_server.sh" > "$pkgdir"/usr/bin/elixir-ls
  echo -e "#!/bin/sh\nexec /usr/lib/$pkgname/debugger.sh" > "$pkgdir"/usr/bin/elixir-ls-debug

  chmod +x "$pkgdir"/usr/bin/*
}
