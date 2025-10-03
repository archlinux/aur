# Maintainer:
# Contributor: Timo Wilken <timo.21.wilken+aur@gmail.com>

## options
: ${_widgets:=qt6}
: ${_install_path:=opt}

_pkgname="notparadoxlauncher"
pkgname="$_pkgname"
pkgver=1.3.1
pkgrel=4
pkgdesc="Alternative for Paradox Launcher (${_widgets^^})"
url="https://github.com/shusaura85/notparadoxlauncher"
license=('MIT')
arch=('x86_64')

case "${_widgets::1}" in
  g)
    depends=("${_widgets}")
    ;;
  q)
    depends=("${_widgets}pas")
    ;;
esac

makedepends=('lazarus')

install="$_pkgname.install"

_pkgsrc="$pkgname-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('475db848596d4c05db8e628a69e1477092291d962fe92e2972525e2c848262a2')

build() (
  shopt -s nullglob
  mkdir -p build

  local _laz_opts=(
    --build-all
    --cpu="$CARCH"
    --lazarusdir="/usr/lib/lazarus"
    --os=linux
    --primary-config-path=build
    --widgetset="$_widgets"
  )

  for i in "$_pkgsrc"/linux-src/*-src/bootstrapper*.lpi; do
    local _compiler_opts='--opt="-O3 -Sa -CX -XX -Cg -k-pie -k--sort-common -k--as-needed -k-z -krelro -k-z -know"'
    lazbuild "${_laz_opts[@]}" "$_compiler_opts" "$i"
  done

  for i in "$_pkgsrc"/linux-src/*-src/launcher*.lpi; do
    local _compiler_opts='--opt="-O3 -Sa -CX -XX -k--sort-common -k--as-needed -k-z -krelro -k-z -know"'
    lazbuild "${_laz_opts[@]}" "$_compiler_opts" "$i"
  done
)

package() {
  install -Dm755 -t "$pkgdir/$_install_path/$_pkgname/" \
    "$_pkgsrc"/linux-src/launcher-src/output/launcher \
    "$_pkgsrc"/linux-src/bootstrapper-src/output/bootstrapper-v2

  install -Dm644 "$_pkgsrc"/LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/notparadoxlauncher" << END
#!/usr/bin/env sh
exec "/$_install_path/$_pkgname/launcher"
END
}
