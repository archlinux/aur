# Maintainer: Björn Bidar <AUR+bjorn.bidar@thaodan.de>
_pkgname=matrix2051
pkgname=${_pkgname}-git
pkgver=r259.e16d5a5
pkgrel=1
pkgdesc="A Matrix gateway for IRC, join from your favorite IRC client"
arch=('any')
url="https://github.com/progval/matrix2051"
license=('GPL')
groups=('elixir')
depends=('erlang-nox' 'bash')
makedepends=('elixir' 'git' 'rebar3')
source=(git+"$url.git"
        0001-Do-not-include-Erlang-runtime.patch
        https://github.com/progval/matrix2051/compare/pantalaimon.patch
        "$_pkgname.service")
sha256sums=('SKIP'
            '5128741e60eef8466ef1346c8a076c283044c960343bbe7c0a687e64afa92100'
            'd06e59ebe8e26c109a26b028a28acae35e97c17ec0269252037b9e547fa7090f'
            '6ff305586f96e9c9c32da16488c9904c24b3a8e30864e9bc996ceb250126b728')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i ../0001-Do-not-include-Erlang-runtime.patch
  patch -p1 -i ../pantalaimon.patch
}

build() {
  cd "$srcdir/$_pkgname"
  #export IGNORE_MISSING_DEPS="TRUE"

  export MIX_ENV=prod
  export MIX_HOME="$srcdir/mix/home"
  export MIX_ARCHIVES="$srcdir/mix/archives"

  export REBAR_DEPS_PREFER_LIBS="TRUE"
  export ERL_LIBS="/usr/lib/erlang/lib/" ;

  mix local.hex --force
  mix local.rebar --force rebar3 /usr/bin/rebar3

  mix deps.get --only prod
  mix release --path build
}

package() {
  cd "$srcdir/$_pkgname"

  local fullname_pkgdir="$pkgdir"/usr/lib/$_pkgname

  install -dm755 "$fullname_pkgdir"
  mv build/* "$fullname_pkgdir"

  install -Dm644 "../$_pkgname.service" \
          "$pkgdir/usr/lib/systemd/system/$_pkgname.service"

  find "$fullname_pkgdir" -name \*.bat -delete
}

# vim:set ts=2 sw=2 et:
