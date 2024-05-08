# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.21.1
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache-2.0')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git' 'rebar3')
source=("elixir-ls-$pkgver.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v$pkgver.tar.gz")
sha256sums=('711fdcd404e451b2be0fd90db00e1fe4c26f396000f79559d7fc9308f3ebaaa0')
b2sums=('82d34f9d1619ce6bc7c26d3c1e585425c418b033de4bd99b0491ad56a83075bf24ac8f7c62f574db496ea5bd5695b7ce8a89793edfcbc1281a2489bed02af22c')

build() {
  cd "$pkgname-$pkgver"

  export MIX_ENV=prod
  export MIX_HOME="$srcdir/mix-cache"

  # Fetch hex+rebar for deps.get to work
  mix local.hex --force
  mix local.rebar --force rebar3 /usr/bin/rebar3

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
