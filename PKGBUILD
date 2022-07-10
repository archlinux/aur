# Maintainer: Björn Bidar <AUR+bjorn.bidar@thaodan.de>
_pkgname=matrix2051
pkgname=${_pkgname}-git
pkgver=r201.6fec00a
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
        "$_pkgname.service")
sha256sums=('SKIP'
            '5128741e60eef8466ef1346c8a076c283044c960343bbe7c0a687e64afa92100'
            '6ff305586f96e9c9c32da16488c9904c24b3a8e30864e9bc996ceb250126b728')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$srcdir/$_pkgname"
  patch -p1 -i ../0001-Do-not-include-Erlang-runtime.patch
}

build() {
  cd "$srcdir/$_pkgname"

  export MIX_ENV=prod
  export MIX_HOME=/usr/bin
  export MIX_ARCHIVES="$srcdir/mix/archives"

  mix local.hex --force

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
