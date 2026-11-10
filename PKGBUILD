# Maintainer: Marco Russo <tray-kebab-uneven@duck.com>
# Maintainer: Matthew Johnston <warmwaffles@gmail.com>
pkgname=expert-git
pkgver=r1233.e284a781
pkgrel=1
pkgdesc="Official Elixir Language Server Protocol implementation"
arch=('x86_64')
url="https://expert-lsp.org/"
license=('Apache-2.0')
depends=('erlang' 'elixir')
makedepends=('git')
provides=("${pkgname}")
conflicts=("${pkgname}")
options=(!strip)
source=('expert::git+https://github.com/elixir-lang/expert.git')
sha256sums=('SKIP')

# Expert/engine start without a system EPMD (see upstream justfile).
_erl_flags='-start_epmd false -epmd_module Elixir.Forge.EPMD'

pkgver() {
  cd "$srcdir/expert"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/expert"

  # Keep Hex/Rebar out of the builder's homedir.
  export MIX_HOME="$srcdir/mix-home"
  export HEX_HOME="$srcdir/hex-home"
  mix local.hex --force --if-missing
  mix local.rebar --force --if-missing

  (cd apps/forge && mix deps.get)
  (cd apps/engine && elixir --erl "$_erl_flags" -S mix deps.get)
  (cd apps/expert && elixir --erl "$_erl_flags" -S mix deps.get)
}

build() {
  cd "$srcdir/expert/apps/expert"

  export MIX_HOME="$srcdir/mix-home"
  export HEX_HOME="$srcdir/hex-home"
  export MIX_ENV=prod

  # Plain Mix release (not the burrito-wrapped binary).
  mix release plain --overwrite
}

package() {
  cd "$srcdir/expert"

  # Install the full release tree as a private helper under libexec, then
  # expose the upstream launcher on PATH:
  #
  #   /usr/libexec/expert/          plain Mix release (bin/, lib/, releases/, ...)
  #   /usr/libexec/expert/bin/start_expert
  #   /usr/bin/expert               -> ../libexec/expert/bin/start_expert
  local _release=apps/expert/_build/prod/rel/plain

  install -d "$pkgdir/usr/libexec" "$pkgdir/usr/bin"
  cp -a "$_release" "$pkgdir/usr/libexec/expert"
  ln -sf ../libexec/expert/bin/start_expert "$pkgdir/usr/bin/expert"
}
