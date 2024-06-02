# Maintainer:
# Contributor: Timo Wilken <timo.21.wilken+aur@gmail.com>

## options
: ${_widgets:=qt6}
: ${_install_path:=opt}

## basic info
_pkgname="notparadoxlauncher"
pkgname="$_pkgname"
pkgver=1.3.1
pkgrel=3
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

build() {
  mkdir -p build
  for i in "$_pkgsrc"/linux-src/*-src/*.lpi; do
    lazbuild "$i" \
      --build-all \
      --lazarusdir="/usr/lib/lazarus" \
      --widgetset="$_widgets" \
      --os=linux --cpu="$CARCH" \
      --primary-config-path=build
  done
}

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
