# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.17.1
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git' 'rebar3')
source=("elixir-ls-$pkgver.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v$pkgver.tar.gz")
sha256sums=('5fcbbb8a35448f12086ada4942cdb2f10338a5c95b0fa2b8471b5cbdf257812e')
b2sums=('ff4963a6e267828ff251da2779293337a191223fad9bd665dd9a30241fe6af43bae69c5b8305defe5d4deca139f0fdd27323e8d045b29c7fc646a2815c3fcf5e')

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
  mix elixir_ls.release -o "$pkgdir"/usr/lib/$pkgname

  install -dm0755 "$pkgdir"/usr/bin

  echo -e "#!/bin/sh\nexec /usr/lib/$pkgname/language_server.sh" > "$pkgdir"/usr/bin/elixir-ls
  echo -e "#!/bin/sh\nexec /usr/lib/$pkgname/debugger.sh" > "$pkgdir"/usr/bin/elixir-ls-debug

  chmod +x "$pkgdir"/usr/bin/*
}
