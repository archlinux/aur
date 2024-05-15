# Maintainer: Ritchie Frodomar <alkalinethunder@gmail.com>

_pkgname='hypermicmonitor'
pkgname="${_pkgname}-git"
pkgver=r3.c8e25b1
pkgrel=1
pkgdesc='Command-line tool for controlling Mic Monitoring on HyperX headsets.'
arch=('x86_64')
url="https://github.com/acidiclight/hypermicmonitor"
license=('MIT')
depends=(
  'hidapi'
)
makedepends=(
  'dotnet-sdk'
  'git'
)
provides=($_pkgname)
conflicts=($_pkgname)
source=("${_pkgname}::git+${url}.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

package () {
  cd "${srcdir}/${_pkgname}"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
  install -Dm644 70-hypermicmonitor-hid.rules "$pkgdir/etc/udev/rules.d/70-hypermicmonitor-hid.rules"

  dotnet publish --self-contained -r linux-x64 -o "$pkgdir/opt/$_pkgname"

  mkdir "$pkgdir/usr/bin/"
  ln -s "/opt/$_pkgname/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
}
