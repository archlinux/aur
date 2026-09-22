# Maintainer: Carmine Paolino <carmine@paolino.me>
pkgname=spotifast
pkgver=0.9.1
pkgrel=1
pkgdesc="Native Spotify client"
arch=('x86_64' 'aarch64')
url="https://github.com/crmne/spotifast"
license=('MIT')
install="${pkgname}.install"
depends=('dbus' 'alsa-lib' 'libpulse' 'libglvnd' 'libxkbcommon' 'wayland' 'libx11')
makedepends=('cargo' 'cmake' 'clang')
optdepends=('libxkbcommon-x11: keyboard handling in X11 sessions'
            'pipewire-pulse: PipeWire as the PulseAudio server')
provides=("fastpotify=$pkgver")
conflicts=('fastpotify' 'fastpotify-bin' 'fastpotify-git' 'spotifast-bin' 'spotifast-git')
replaces=('fastpotify')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which lld then cannot resolve: the link fails on
# undefined ring_core_* symbols.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::${url}/releases/download/v${pkgver}/spotifast-v${pkgver}-source.tar.gz")
sha256sums=('b3743d88758fd467312faa6c0ce1489e05c02182238504d88167afcfd52ad189')

# GitHub archives use the repository name; older releases used Fastpotify.
_source_dir() {
  if [[ -d "${srcdir}/spotifast-${pkgver}" ]]; then
    printf '%s\n' "${srcdir}/spotifast-${pkgver}"
  else
    printf '%s\n' "${srcdir}/fastpotify-${pkgver}"
  fi
}

prepare() {
  cd "$(_source_dir)"
  export RUSTUP_TOOLCHAIN=stable
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "$(_source_dir)"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Generated bindings inside glutin carry the path they were built at, which
  # ends up in the binary and makes makepkg warn about a reference to $srcdir.
  # Appended rather than assigned, so the distro's own flags survive.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release
}

check() {
  cd "$(_source_dir)"
  export RUSTUP_TOOLCHAIN=stable
  # The demo feature carries the headless render test, which lays out every
  # page without a display and talks to nothing.
  cargo test --frozen --features demo
}

package() {
  cd "$(_source_dir)"

  local binary=spotifast
  [[ -f "target/release/$binary" ]] || binary=fastpotify
  install -Dm755 "target/release/$binary" "${pkgdir}/usr/bin/spotifast"
  ln -s spotifast "${pkgdir}/usr/bin/fastpotify"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  # Historical releases retain their matching launcher/window identity.
  local desktop=spotifast
  if [[ ! -f "packaging/applications/spotifast.desktop" ]]; then
    desktop=fastpotify
  fi
  install -Dm644 "packaging/applications/${desktop}.desktop" \
    "${pkgdir}/usr/share/applications/${desktop}.desktop"
  install -Dm644 "packaging/icons/${desktop}.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/${desktop}.svg"
  # Older release fixtures predate the optional integration.
  if [[ -d contrib/omarchy ]]; then
    install -Dm644 contrib/omarchy/spotifast.json.tpl "${pkgdir}/usr/share/spotifast/omarchy/spotifast.json.tpl"
    install -Dm755 contrib/omarchy/spotifast-theme "${pkgdir}/usr/share/spotifast/omarchy/spotifast-theme"
  fi
}
