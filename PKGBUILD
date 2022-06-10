# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

pkgname=elixir-ls
pkgver=0.10.0
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git' 'rebar3')
source=("elixir-ls-${pkgver}.tar.gz::https://github.com/elixir-lsp/elixir-ls/archive/v${pkgver}.tar.gz")
cksums=('1856170449')
sha256sums=('cba5b9afb46228c7472e2e2ecc5d7fd99a29e778ce3e726db1dd9f702a68bbbd')
b2sums=('0d4df72073d4044b158e379516f124cf8377ed4d4234b2b195a0cb7802bfd7e03ea373f4b28a6302ebc1f4e08cc79e1cb3db61d480013f1fa7620343a2d7692e')

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
