# Maintainer: 9M2PJU <9m2pju@gmail.com>
# Builds ZapFast Plus from the tagged source. Update pkgver, the source hash
# and .SRCINFO (makepkg --printsrcinfo > .SRCINFO) on every release.
pkgname=zapfast-plus
pkgver=0.23.0
pkgrel=1
pkgdesc="Personal ZapFast fork with GB-inspired privacy, productivity, media and interface options"
arch=('x86_64' 'aarch64')
url="https://github.com/lucasapolinarioo/zapfast-plus"
license=('MIT' 'GPL-2.0-only')
install="${pkgname}.install"
depends=('alsa-lib' 'libpipewire' 'libglvnd' 'libxkbcommon' 'libxkbcommon-x11' 'wayland' 'libx11' 'libxcb' 'libxcursor' 'libxi' 'libxrandr')
makedepends=('cargo' 'cmake' 'perl' 'clang')
# The right-to-left layout tests need one of the fonts they look for.
checkdepends=('ttf-liberation')
optdepends=('org.freedesktop.secrets: archive encryption key storage'
            'noto-fonts-emoji: colour emoji in messages and reactions'
            'xdg-desktop-portal: the file picker for attachments')
# The binary, launcher entry and state folder are the ones ZapFast uses, so
# only one of the names may be installed.
provides=('zapfast')
conflicts=('zapfast' 'zapfast-bin' 'zapfast-git' 'zapfast-plus-bin' 'zapfast-plus-git')
# !lto because ring compiles its own C and Arch's default CFLAGS put LTO
# objects in the archive, which lld then cannot resolve: the link fails on
# undefined ring_core_* symbols.
options=('!debug' '!lto')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/lucasapolinarioo/zapfast-plus/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('b0b04b26d11756852179e0bc764207df9d1029013f28e402a520705863573e4a')

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # Cargo.toml's rust-version is the oldest compiler that builds ZapFast Plus.
  # Check it before fetching, so an older stable fails at once and says how
  # to update, rather than after every crate has downloaded.
  local need have
  need=$(sed -n 's/^rust-version = "\(.*\)"$/\1/p' Cargo.toml)
  have=$(rustc --version 2>/dev/null | cut -d' ' -f2)
  if [[ -n "${need}" && -n "${have}" && "$(vercmp "${have}" "${need}")" -lt 0 ]]; then
    error "ZapFast Plus needs Rust ${need} or newer, but rustc is ${have}."
    plain "With rustup, run: rustup update stable"
    plain "With Arch's rust package, update the system: pacman -Syu"
    return 1
  fi
  # whatsapp-rust is a git dependency pinned to a commit; the lockfile
  # names it, so this fetches it along with everything else.
  cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  export CARGO_TARGET_DIR=target
  # Generated bindings inside glutin carry the path they were built at, which
  # ends up in the binary and makes makepkg warn about a reference to $srcdir.
  # Appended rather than assigned, so the distro's own flags survive.
  export RUSTFLAGS="${RUSTFLAGS:-} --remap-path-prefix=${srcdir}=/"
  cargo build --frozen --release
}

check() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  export RUSTUP_TOOLCHAIN=stable
  # The demo feature carries the headless layout test of every screen,
  # which needs no display and talks to nothing.
  cargo test --frozen --features demo
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  install -Dm755 "target/release/zapfast" "${pkgdir}/usr/bin/zapfast"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 "THIRD-PARTY-NOTICES.md" "${pkgdir}/usr/share/licenses/${pkgname}/THIRD-PARTY-NOTICES.md"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${pkgname}/README.md"
  install -Dm644 "packaging/applications/zapfast.desktop" \
    "${pkgdir}/usr/share/applications/zapfast.desktop"
  install -Dm644 "packaging/icons/zapfast.svg" \
    "${pkgdir}/usr/share/icons/hicolor/scalable/apps/zapfast.svg"
  install -Dm644 "contrib/omarchy/zapfast.json.tpl" \
    "${pkgdir}/usr/share/zapfast/omarchy/zapfast.json.tpl"
  install -Dm755 "contrib/omarchy/zapfast-theme" \
    "${pkgdir}/usr/share/zapfast/omarchy/zapfast-theme"
}
