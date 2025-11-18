# Maintainer: Engdyn <git@engdyn.de>

pkgname=obamify-git
_pkgname=obamify
pkgver=1.3.r12.g764aa3b
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
    'a94d236f938d0b4997d498ef4243833181464f48495358917d6eb24da4fa356d2006576fd5691783fd6f9eca3d2e24fcb7516d3b6d9e37ee1dd0dbdc59e89f2f'
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
