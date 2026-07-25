# Maintainer: furudbat <hircreacc@gmail.com>
pkgname=wpets-git
pkgver=r493.2ca7ba7
pkgrel=1
pkgdesc="A Wayland overlay that displays an animated virtual pet reacting to keyboard input"
arch=('x86_64' 'aarch64')
url="https://github.com/furudbat/wayland-vpets"
license=('MIT')

depends=('wayland' 'glibc' 'systemd-libs')
makedepends=('git' 'cmake' 'pandoc')

provides=('wpets')
conflicts=('wpets')

source=("git+https://github.com/furudbat/wayland-vpets.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/wayland-vpets"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/wayland-vpets"

  cmake -S . -B build \
    -DCMAKE_BUILD_TYPE=Release \
    -DFEATURE_LAZY_LOAD_ASSETS=ON \
    -DFEATURE_MULTI_VERSIONS=ON \
    -DSKIP_CPM=ON \
    -DGENERATE_PROTOCOLS=OFF \
    -Wno-author \
    -DCMAKE_C_FLAGS="${CFLAGS:-} -ffile-prefix-map=$srcdir=." \
    -DCMAKE_CXX_FLAGS="${CXXFLAGS:-} -ffile-prefix-map=$srcdir=."


  cmake --build build --parallel "$(nproc)"
  cmake --build build --target manpages --parallel "$(nproc)"
}

package() {
  cd "$srcdir/wayland-vpets"

  # Binaries
  install -Dm755 build/bongocat "$pkgdir/usr/bin/wpets"
  #install -Dm755 build/bongocat-dm-classic "$pkgdir/usr/bin/wpets-dm-classic"
  install -Dm755 build/bongocat-dm "$pkgdir/usr/bin/wpets-dm"
  install -Dm755 build/bongocat-ms-agent "$pkgdir/usr/bin/wpets-ms-agent"
  install -Dm755 build/bongocat-pkmn "$pkgdir/usr/bin/wpets-pkmn"
  install -Dm755 build/bongocat-all "$pkgdir/usr/bin/wpets-all"
  #install -Dm755 build/bongocat-dm-colored "$pkgdir/usr/bin/wpets-dm-colored"
  #install -Dm755 build/bongocat-dm-colored-all "$pkgdir/usr/bin/wpets-dm-all"
  #install -Dm755 build/bongocat-neko "$pkgdir/usr/bin/wpets-neko"

  # Configs
  install -Dm644 bongocat.conf.example "$pkgdir/usr/share/wpets/bongocat.conf.example"
  install -Dm644 examples/clippy.bongocat.conf "$pkgdir/usr/share/wpets/clippy.bongocat.conf.example"
  install -Dm644 examples/digimon.bongocat.conf "$pkgdir/usr/share/wpets/digimon.bongocat.conf.example"
  install -Dm644 examples/pokemon.bongocat.conf "$pkgdir/usr/share/wpets/pokemon.bongocat.conf.example"
  install -Dm644 examples/cpu-digimon.bongocat.conf "$pkgdir/usr/share/wpets/cpu-digimon.bongocat.conf.example"
  install -Dm644 examples/moving-digimon.bongocat.conf "$pkgdir/usr/share/wpets/moving-digimon.bongocat.conf.example"
  install -Dm644 examples/neko.bongocat.conf "$pkgdir/usr/share/wpets/neko.bongocat.conf.example"

  # Docs
  install -Dm644 README.md "$pkgdir/usr/share/doc/wpets/README.md"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # cleanup manpages
  rm -rf stage/*
  mkdir -p stage
  for f in build/*.1 build/*.5; do
    [ -e "$f" ] || continue
    sed \
      -e "s|$srcdir||g" \
      -e "s|/build/|/|g" \
      < "$f" > "stage/$(basename "$f")"
  done

  # manpages
  install -Dm644 stage/bongocat.1 "$pkgdir/usr/share/man/man1/wpets.1"
  install -Dm644 stage/bongocat.5 "$pkgdir/usr/share/man/man5/wpets.5"
  #install -Dm644 stage/bongocat-dm-classic.1 "$pkgdir/usr/share/man/man1/wpets-dm-classic.1"
  #install -Dm644 stage/bongocat-dm-classic.5 "$pkgdir/usr/share/man/man5/wpets-dm-classic.5"
  install -Dm644 stage/bongocat-dm.1 "$pkgdir/usr/share/man/man1/wpets-dm.1"
  install -Dm644 stage/bongocat-dm.5 "$pkgdir/usr/share/man/man5/wpets-dm.5"
  install -Dm644 stage/bongocat-ms-agent.1 "$pkgdir/usr/share/man/man1/wpets-ms-agent.1"
  install -Dm644 stage/bongocat-ms-agent.5 "$pkgdir/usr/share/man/man5/wpets-ms-agent.5"
  install -Dm644 stage/bongocat-pkmn.1 "$pkgdir/usr/share/man/man1/wpets-pkmn.1"
  install -Dm644 stage/bongocat-pkmn.5 "$pkgdir/usr/share/man/man5/wpets-pkmn.5"
  install -Dm644 stage/bongocat-all.1 "$pkgdir/usr/share/man/man1/wpets-all.1"
  install -Dm644 stage/bongocat-all.5 "$pkgdir/usr/share/man/man5/wpets-all.5"
  install -Dm644 stage/bongocat-find-devices.1 "$pkgdir/usr/share/man/man1/wpets-find-devices.1"

  # Helper script
  install -Dm755 scripts/find_input_devices.sh "$pkgdir/usr/bin/wpets-find-devices"
}
