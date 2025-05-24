# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.28.1
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache-2.0')
arch=('any')
depends=(
  'elixir'
  'erlang-core' 'erlang-asn1' 'erlang-public_key' 'erlang-ssl'
  'erlang-parsetools'
)
makedepends=('git')
source=("elixir-ls-$pkgver.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v$pkgver.tar.gz")
sha256sums=('ff5bffe0b633c629bffc15a1715289be1e5c1746631f1ada1f1e77c8c34ec2e2')
b2sums=('938b45c9122294da8d8c0b86bad13e51a4fe95e7b5f1e35119f7bb85e6165aa4a07d65ea53de5e26493f82401284bfbbe60b0f417657220aca733b51d193b10e')

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
