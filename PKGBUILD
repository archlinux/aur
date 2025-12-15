# Maintainer: furudbat <hircreacc@gmail.com>
pkgname=wpets-git
pkgver=3.6.1.4.g8641a7f
pkgrel=1
pkgdesc="A Wayland overlay that displays an animated virtual pet reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/furudbat/wayland-vpets"
license=('MIT')
depends=('wayland' 'glibc' 'systemd')
makedepends=('git' 'gcc' 'cmake' 'wayland-protocols' 'pandoc-cli')
#keywords=('wayland' 'virtual-pet' 'overlay' 'bongo-cat' 'cat' 'wpets' 'desktop-toy' 'bongo' 'bongocat-keyboard' 'cat' 'vpet' 'screenmate')

source=("git+https://github.com/furudbat/wayland-vpets.git")
sha256sums=('SKIP')

provides=('wpets')
conflicts=('wpets')

pkgver() {
  cd "$srcdir/wayland-vpets"
  git describe --long --tags --always | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/wayland-vpets"
	cmake -S . -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DFEATURE_LAZY_LOAD_ASSETS=ON -DFEATURE_MULTI_VERSIONS=ON \
        -Wno-dev
	cmake --build build --parallel "$(nproc)"
	cmake --build build --target manpages --parallel "$(nproc)"
}

package() {
    cd "$srcdir/wayland-vpets"

    # Install the binary
    install -Dm755 build/bongocat "$pkgdir/usr/bin/wpets"
    install -Dm755 build/bongocat-dm-classic "$pkgdir/usr/bin/wpets-dm-classic"
    install -Dm755 build/bongocat-dm "$pkgdir/usr/bin/wpets-dm"
    install -Dm755 build/bongocat-ms-agent "$pkgdir/usr/bin/wpets-ms-agent"
    install -Dm755 build/bongocat-pkmn "$pkgdir/usr/bin/wpets-pkmn"
    install -Dm755 build/bongocat-all "$pkgdir/usr/bin/wpets-all"

    # Install example configuration
    install -Dm644 bongocat.conf.example "$pkgdir/usr/share/wpets/bongocat.conf.example"
    install -Dm644 examples/clippy.bongocat.conf "$pkgdir/usr/share/wpets/clippy.bongocat.conf.example"
    install -Dm644 examples/digimon.bongocat.conf "$pkgdir/usr/share/wpets/digimon.bongocat.conf.example"
    install -Dm644 examples/pokemon.bongocat.conf "$pkgdir/usr/share/wpets/pokemon.bongocat.conf.example"
    install -Dm644 examples/cpu-digimon.bongocat.conf "$pkgdir/usr/share/wpets/cpu-digimon.bongocat.conf.example"
    install -Dm644 examples/moving-digimon.bongocat.conf "$pkgdir/usr/share/wpets/moving-digimon.bongocat.conf.example"
    install -Dm644 examples/neko.bongocat.conf "$pkgdir/usr/share/wpets/neko.bongocat.conf.example"

    # Install documentation
    install -Dm644 README.md "$pkgdir/usr/share/doc/wpets/README.md"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/wpets/LICENSE"
    install -Dm644 build/bongocat.1 "$pkgdir/usr/share/man/man1/wpets.1"
    install -Dm644 build/bongocat.5 "$pkgdir/usr/share/man/man5/wpets.5"
    install -Dm644 build/bongocat-dm-classic.1 "$pkgdir/usr/share/man/man1/wpets-dm-classic.1"
    install -Dm644 build/bongocat-dm-classic.5 "$pkgdir/usr/share/man/man5/wpets-dm-classic.5"
    install -Dm644 build/bongocat-dm.1 "$pkgdir/usr/share/man/man1/wpets-dm.1"
    install -Dm644 build/bongocat-dm.5 "$pkgdir/usr/share/man/man5/wpets-dm.5"
    install -Dm644 build/bongocat-ms-agent.1 "$pkgdir/usr/share/man/man1/wpets-ms-agent.1"
    install -Dm644 build/bongocat-ms-agent.5 "$pkgdir/usr/share/man/man5/wpets-ms-agent.5"
    install -Dm644 build/bongocat-pkmn.1 "$pkgdir/usr/share/man/man1/wpets-pkmn.1"
    install -Dm644 build/bongocat-pkmn.5 "$pkgdir/usr/share/man/man5/wpets-pkmn.5"
    install -Dm644 build/bongocat-all.1 "$pkgdir/usr/share/man/man1/wpets-all.1"
    install -Dm644 build/bongocat-all.5 "$pkgdir/usr/share/man/man5/wpets-all.5"

    # Install find_input_devices.sh
    install -Dm755 scripts/find_input_devices.sh "$pkgdir/usr/bin/wpets-find-devices"
}
