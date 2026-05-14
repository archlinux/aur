# Maintainer: Engdyn <aur [cat] engdyn [dog] de>

pkgname=obamify-git
_pkgname=obamify
pkgver=1.3.r20.g3689559
pkgrel=1
pkgdesc='revolutionary new technology that turns any image into obama'
arch=('any')
url='https://github.com/Spu7Nix/obamify'
license=('MIT')
provides=('obamify')
makedepends=(
    'git'
    'cargo'
    )
depends=(
    'mesa'
    'vulkan-icd-loader'
    'xdg-desktop-portal-impl'
    )
optdepends=('vulkan-driver')
options=('!debug')
source=(
    'git+https://github.com/Spu7Nix/obamify.git'
    'obamify.desktop'
    )
b2sums=(
    'SKIP'
    '2bb737fe256a1716b81516e81dce26be3c53d580f80d2b2fd4eb5ef1e1435c6cf515524f2c4e39d886000439c9d3ac722ad0930372dba2a0440595de7075686e'
    )

pkgver() {
  cd "$srcdir/$_pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd "$srcdir/$_pkgname"
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$srcdir/$_pkgname"
    cargo build --frozen --release --all-features --target-dir target
}

package() {
    cd "$srcdir/$_pkgname"
    install -Dm755 "target/release/$_pkgname" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 "$srcdir/$_pkgname.desktop" "$pkgdir/usr/share/applications/$_pkgname.desktop"
    install -Dm644 "assets/linux/icon.png" "$pkgdir/usr/share/pixmaps/$_pkgname.png"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}
