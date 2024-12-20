# Maintainer: Rizwan Hasan <rizwan.hasan486@gmail.com>

pkgname=openvscode-server
pkgver=1.96.0
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
sha512sums_x86_64=('39cd1b40812308b3a663dc1c2b303a0cc8f84551852fee4a33e490ac646354c3e6f837752b3ffd36a523cda2b18ffcad7222d9518aaeb2c814f0fb74ddb1b7a8')
sha512sums_aarch64=('1b53139967c4803b5eadb6d083dc0c7512c853742b8fca85490b4d8c745d5bdd519127c32371aac902fcb0ef9e8dac65bf74bc72bb66dff2da78f348df3724cf')
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
