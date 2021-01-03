# Maintainer: KokaKiwi <kokakiwi@kokakiwi.net>

_pkgname=elixir-ls
pkgname=elixir-ls-git
pkgver=0.6.2.r27.ga696d94
pkgrel=1
pkgdesc='A frontend-independent Language Server Protocol for Elixir'
url='https://github.com/elixir-lsp/elixir-ls'
license=('Apache')
arch=('any')
depends=('elixir' 'erlang-nox')
makedepends=('git')
provides=('elixir-ls')
conflicts=('elixir-ls')
source=("${_pkgname}::git://github.com/elixir-lsp/elixir-ls.git")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "${_pkgname}"

  export MIX_ENV=prod
  export MIX_HOME="${srcdir}/mix-cache"

  # Fetch hex+rebar for deps.get to work
  mix local.hex --force
  mix local.rebar --force

  mix deps.get
  mix compile
}

package() {
  cd "${_pkgname}"

  export MIX_ENV=prod

  install -dm0755 "${pkgdir}"/usr/lib/${_pkgname}
  mix elixir_ls.release -o "${pkgdir}"/usr/lib/${_pkgname}

  install -dm0755 "${pkgdir}"/usr/bin

  echo -e "#!/bin/sh\nexec /usr/lib/${_pkgname}/language_server.sh" > "${pkgdir}"/usr/bin/elixir-ls
  echo -e "#!/bin/sh\nexec /usr/lib/${_pkgname}/debugger.sh" > "${pkgdir}"/usr/bin/elixir-ls-debug

  chmod +x "${pkgdir}"/usr/bin/*
}
