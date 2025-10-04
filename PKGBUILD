# Maintainer: Daniël Nazarkin <aur.danicatgames@pm.me>

pkgname=roblox-blink
pkgver=0.18.4
pkgrel=2
pkgdesc="An IDL compiler written in Luau for ROBLOX buffer networking"
arch=('x86_64' 'aarch64')
url="https://github.com/1Axen/blink"
license=('MIT')
depends=('glibc' 'gcc-libs' 'lune')
makedepends=('darklua')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz"
        "blink.sh")
sha256sums=('7598bd536e0637967bfea094ec9a2ac8ac48b622842499be4a6a41c9e47087e1'
            'e40872fac25beeff47d68563842fe7c97f33836c8b8ac44b8585f15f84d1b9b4')

build() {
    cd "blink-$pkgver"

    darklua process --config build/.darklua.json src/CLI/init.luau release/blink.luau
    
    # lune build release/blink.luau --output release/blink --target "linux-x86_64"
    #
    # lune build seems to just create a standalone lune executable that runs
    # `lune run blink.luau` and requires the luau file in the same folder?
    # cant get it to work nicely, it keeps dropping into a lune shell instead of blink.
    #
    # just requiring lune as a runtime dependency until i work out a better solution
}

package() {
    cd "blink-$pkgver"

    install -Dm644 release/blink.luau "$pkgdir/usr/share/blink/blink.luau"
    install -Dm755 ../blink.sh "$pkgdir/usr/bin/blink"
    
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
