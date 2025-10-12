# Maintainer: furudbat <hircreacc@gmail.com>
pkgname=wpets
pkgver=3.2.1
pkgrel=1
pkgdesc="A Wayland overlay that displays an animated virtual pet reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/furudbat/wayland-vpets"
license=('MIT')
depends=('wayland' 'glibc' 'systemd-libs')
makedepends=('gcc' 'cmake' 'make' 'wayland-protocols' 'pandoc-cli' 'systemd')
keywords=('wayland' 'virtual-pet' 'overlay' 'bongo-cat' 'cat' 'wpets' 'desktop-toy' 'bongo' 'bongocat-keyboard' 'cat' 'vpet' 'screenmate')
source=("wayland-vpets-$pkgver.tar.gz::https://github.com/furudbat/wayland-vpets/archive/v$pkgver.tar.gz")
sha256sums=('ded601d5d293528fe207ca3d313a0ac098110d04879e322e6be83b0d7b8717c2')

build() {
    cd "$srcdir/wayland-vpets-$pkgver"
	cmake -S . -B build -DCMAKE_BUILD_TYPE=Release -DFEATURE_LAZY_LOAD_ASSETS=ON -DFEATURE_MULTI_VERSIONS=ON
	cmake --build build
	cmake --build build --target manpages
	cd build && cpack
}

package() {
    cd "$srcdir/wayland-vpets-$pkgver"

    # Install the binary
    install -Dm755 build/bongocat "$pkgdir/usr/bin/${pkgname}"
    install -Dm755 build/bongocat-dm-classic "$pkgdir/usr/bin/${pkgname}-dm-classic"
    install -Dm755 build/bongocat-dm "$pkgdir/usr/bin/${pkgname}-dm"
    install -Dm755 build/bongocat-ms-agent "$pkgdir/usr/bin/${pkgname}-ms-agent"
    install -Dm755 build/bongocat-pkmn "$pkgdir/usr/bin/${pkgname}-pkmn"
    install -Dm755 build/bongocat-all "$pkgdir/usr/bin/${pkgname}-all"

    # Install example configuration
    install -Dm644 bongocat.conf "$pkgdir/usr/share/${pkgname}/bongocat.conf.example"
    install -Dm644 examples/clippy.bongocat.conf "$pkgdir/usr/share/${pkgname}/clippy.bongocat.conf.example"
    install -Dm644 examples/digimon.bongocat.conf "$pkgdir/usr/share/${pkgname}/digimon.bongocat.conf.example"
    install -Dm644 examples/pokemon.bongocat.conf "$pkgdir/usr/share/${pkgname}/pokemon.bongocat.conf.example"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 build/bongocat.1 "$pkgdir/usr/share/man/man1/${pkgname}.1"
    install -Dm644 build/bongocat.5 "$pkgdir/usr/share/man/man5/${pkgname}.5"
    install -Dm644 build/bongocat-dm-classic.1 "$pkgdir/usr/share/man/man1/${pkgname}-dm-classic.1"
    install -Dm644 build/bongocat-dm-classic.5 "$pkgdir/usr/share/man/man5/${pkgname}-dm-classic.5"
    install -Dm644 build/bongocat-dm.1 "$pkgdir/usr/share/man/man1/${pkgname}-dm.1"
    install -Dm644 build/bongocat-dm.5 "$pkgdir/usr/share/man/man5/${pkgname}-dm.5"
    install -Dm644 build/bongocat-ms-agent.1 "$pkgdir/usr/share/man/man1/${pkgname}-ms-agent.1"
    install -Dm644 build/bongocat-ms-agent.5 "$pkgdir/usr/share/man/man5/${pkgname}-ms-agent.5"
    install -Dm644 build/bongocat-pkmn.1 "$pkgdir/usr/share/man/man1/${pkgname}-pkmn.1"
    install -Dm644 build/bongocat-pkmn.5 "$pkgdir/usr/share/man/man5/${pkgname}-pkmn.5"
    install -Dm644 build/bongocat-all.1 "$pkgdir/usr/share/man/man1/${pkgname}-all.1"
    install -Dm644 build/bongocat-all.5 "$pkgdir/usr/share/man/man5/${pkgname}-all.5"

    # Install find_input_devices.sh
    install -Dm755 scripts/find_input_devices.sh "$pkgdir/usr/bin/${pkgname}-find-devices"
}
