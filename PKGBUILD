# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=openvscode-server
pkgver=1.96.4
pkgrel=1
pkgdesc="Run upstream VS Code on a remote machine with access through a modern web browser from any device, anywhere."
arch=("x86_64" "aarch64")
url="https://github.com/gitpod-io/openvscode-server"
license=(MIT)
depends=(glibc)
source=(
    "$pkgname.service"
    "$pkgname-user.service"
    "LICENSE.txt::https://github.com/gitpod-io/openvscode-server/raw/refs/tags/$pkgname-v$pkgver/LICENSE.txt"
)
source_x86_64=(
    "${url}/releases/download/$pkgname-v$pkgver/$pkgname-v$pkgver-linux-x64.tar.gz"
)
source_aarch64=(
    "${url}/releases/download/$pkgname-v$pkgver/$pkgname-v$pkgver-linux-arm64.tar.gz"
)
sha512sums=('f4d3ed99ff61b4b985868a8ae15f8380228a74b7a6575c133a888a5a755b1990eb09e49bde21ddf9b984ccdc516b6e44dd949fcc70ff85f27cfd9a5c09f85398'
    'c53e25a6d07b4354e95c35bffd2d50d1b03733af2a17fa782c8ca93c229b1bb2732010a7c24df5a9bc1ff8453e2bcb648cc3c99734761f56f23b23a85dc0746d'
    'ebf285213f872a762be375aa3048d73fa98e71935fd2b1d2b3463deb1e4392f04be8a4ba1f8b00836d3415b88a31f6fc7c71c10f28e97df6a55f26631fc149ca')
sha512sums_x86_64=('b1cf7ed86533d7e979773a5945b92a9c118f62367edc6782a3aa81c6209b1f6a76ba1364d2d72f47e70ebc6da1d605cd3e4230d32c323b520a41940b302445d7')
sha512sums_aarch64=('10efd1b630def1993dde55f375fc411bce24c88427bc53271b160530e4c568db99afa22d5d59767829e9f08b835eea88693ef3238bef6409b5df68febf16c9c6')
package() {
    if [[ ${CARCH} == x86_64 ]]; then
        release_name=$pkgname-v$pkgver-linux-x64
    else
        release_name=$pkgname-v$pkgver-linux-arm64
    fi

    # Copying to opt
    mkdir -p "$pkgdir/opt"
    cp -ar "$release_name" "$pkgdir/opt/$pkgname"

    # Creating Linker
    mkdir -p "$pkgdir/usr/bin"
    ln -s "/opt/$pkgname/bin/$pkgname" "$pkgdir/usr/bin/$pkgname"

    # Systemd service
    mkdir -p "$pkgdir/usr/lib/systemd/system"
    cp -aL "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"

    mkdir -p "$pkgdir/usr/lib/systemd/user"
    cp -aL "$pkgname-user.service" "$pkgdir/usr/lib/systemd/user/$pkgname-user.service"

    # License
    mkdir -p "$pkgdir/usr/share/licenses"
    cp -aL "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname.txt"
}
