# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.24.0
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache-2.0')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git' 'rebar3')
source=("elixir-ls-$pkgver.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v$pkgver.tar.gz")
sha256sums=('32e8efb543b4cc790ec6d618901e3cf64759f6a3ebe3e44dd5858bf275af42e1')
b2sums=('5e57757ba69bae9f52bd78ab961a95e607c9157360b759555720769a020a49badc7817f985368068c19e7b2f4e451233984e81e4a4b4bc28c06304933758ab27')

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
