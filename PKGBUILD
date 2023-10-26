# Maintainer:

_pkgname="thorium-reader"
pkgname="$_pkgname"
pkgver=2.3.0
pkgrel=1
pkgdesc="Cross-platform desktop reading app based on the Readium Desktop toolkit"
url="https://github.com/edrlab/thorium-reader"
license=('MIT')
arch=('any')

depends=(
  'bash'
  'electron'
)
makedepends=(
  'gendesk'
  'git'
  'nodejs'
  'npm'
)

if [ x"$pkgname" == x"$_pkgname" ] ; then
  # normal package
  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git#tag=v${pkgver%%.r*}")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }

else
  # git package
  provides+=("$_pkgname")
  conflicts+=("$_pkgname")

  _pkgsrc="$_pkgname"
  source+=("$_pkgsrc"::"git+$url.git")
  sha256sums+=('SKIP')

  pkgver() {
    cd "$_pkgsrc"
    git describe --long --tags --exclude='*[a-z][a-z]*' | sed -E 's/^v//;s/([^-]*-g)/r\1/;s/-/./g'
  }
fi

source+=("$_pkgname.sh")
sha256sums+=('74bc28848d52be2dc78414b3fdb25b19e1064a40fa05103bb544b1d7c1b6546a')

prepare() {
  gendesk -q -f -n --categories "Utility" --pkgname="$_pkgname" --name="Thorium Reader" --exec="$_pkgname"
}
build() {
  cd "$_pkgsrc"
  npm ci
  npm run package:pack-only
}
package() {
  install -Dm755 "${srcdir:?}/$_pkgname.sh" "${pkgdir:?}/usr/bin/$_pkgname" 
  install -Dm644 "${srcdir:?}/$_pkgsrc/release/linux-unpacked/resources/app.asar" -t "${pkgdir:?}/usr/lib/$_pkgname/"
  install -Dm644 "${srcdir:?}/$_pkgsrc/resources/icon.png" "${pkgdir:?}/usr/share/pixmaps/$_pkgname.png"
  install -Dm644 "${srcdir:?}/$_pkgname.desktop" -t "${pkgdir:?}/usr/share/applications/"
  install -Dm644 "${srcdir:?}/$_pkgsrc/LICENSE" -t "${pkgdir:?}/usr/share/licenses/$pkgname"
}
