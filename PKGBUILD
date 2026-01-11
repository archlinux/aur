# Maintainer:
# Contributor: tarball <bootctl@gmail.com>
# Contributor: Brody <archfan at brodix dot de>

_pkgname="netbird-ui"
pkgname="$_pkgname"
pkgver=0.62.2
pkgrel=1
pkgdesc="GUI for the Netbird client"
url="https://github.com/netbirdio/netbird"
arch=('x86_64')
license=('BSD-3-Clause')

depends=(
  'libglvnd'
  'libx11'
  'libxcursor'
  'libxi'
  'libxinerama'
  'libxrandr'
)
makedepends=(
  'go'
)

_pkgsrc="netbird-$pkgver"
_pkgext="tar.gz"
source=("$_pkgsrc.$_pkgext"::"$url/archive/refs/tags/v$pkgver.$_pkgext")
sha256sums=('f37b7db0a2d85886e5550cef64fb34da26e2868f5f8201671bd5673332019dc5')

build() {
  export GOPATH="${srcdir}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export GOFLAGS="-buildmode=pie -ldflags=-linkmode=external -trimpath -mod=readonly -modcacherw"

  cd "$_pkgsrc/client/ui"
  go build -o "build/$_pkgname"
}

package() {
  install -Dm644 "$_pkgsrc/LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"

  cd "$_pkgsrc/client/ui"
  install -Dm755 build/$_pkgname -t "$pkgdir/usr/bin/"

  install -Dm644 assets/netbird.png "$pkgdir/usr/share/pixmaps/netbird.png"

  install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/$_pkgname.desktop" << END
[Desktop Entry]
Name=Netbird
Exec=$_pkgname
Comment=$pkgdesc
Icon=netbird
Type=Application
Terminal=false
Categories=Utility;
Keywords=netbird;
END
}
