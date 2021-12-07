# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.9.0
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git' 'rebar3')
source=("elixir-ls-${pkgver}.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v${pkgver}.tar.gz")
cksums=('4293902885')
sha256sums=('eaa2f5fd4ab9e497889e25419e4409cfaf808daca06259718668a71de8616e3f')
b2sums=('00cfd57adb19dd2f6a75eec45497069497f290bc1980478a8786de67548298317bcc53ca59cfb10ad718e67a57701183287a92057925865552cfef4618158ad5')

build() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod
  export MIX_HOME="${srcdir}/mix-cache"

  # Fetch hex+rebar for deps.get to work
  mix local.hex --force
  mix local.rebar --force rebar3 /usr/bin/rebar3

  mix deps.get
  mix compile
}

package() {
  cd "${pkgname}-${pkgver}"

  export MIX_ENV=prod

  install -dm0755 "${pkgdir}"/usr/lib/${pkgname}
  mix elixir_ls.release -o "${pkgdir}"/usr/lib/${pkgname}

  install -dm0755 "${pkgdir}"/usr/bin

  echo -e "#!/bin/sh\nexec /usr/lib/${pkgname}/language_server.sh" > "${pkgdir}"/usr/bin/elixir-ls
  echo -e "#!/bin/sh\nexec /usr/lib/${pkgname}/debugger.sh" > "${pkgdir}"/usr/bin/elixir-ls-debug

  chmod +x "${pkgdir}"/usr/bin/*
}
