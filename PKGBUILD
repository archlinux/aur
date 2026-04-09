# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.8.1
_tag="v$pkgver"
pkgrel=1
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (binary version)"
arch=('x86_64')
url="https://github.com/Firstp1ck/Pacsea"
license=('MIT')
options=('!strip')
depends=('pacman' 'curl' 'bash' 'sudo' 'coreutils' 'grep' 'xdg-utils')
optdepends=(
    'paru: AUR package installation'
    'yay: alternative AUR helper'
    'wl-clipboard: clipboard support on Wayland'
    'xclip: clipboard support on X11'
    'reflector: update Arch mirrors'
    'pacman-mirrors: Manjaro mirrorlist'
    'rate-mirrors: Artix mirror rating'
    'alacritty: run external commands in a terminal'
    'kitty: run external commands in a terminal'
    'ghostty: run external commands in a terminal'
    'xterm: run external commands in a terminal'
    'gnome-terminal: run external commands in a terminal'
    'konsole: run external commands in a terminal'
    'xfce4-terminal: run external commands in a terminal'
    'tilix: run external commands in a terminal'
    'mate-terminal: run external commands in a terminal'
    'neovim: external editor'
    'vim: external editor'
    'emacs: external editor'
    'helix: external editor'
    'nano: external editor'
    'klipper: clipboard manager on X11'
    'clamav: malware scanning of files'
    'trivy: vulnerability scanning'
    'semgrep-bin: static analysis checks'
    'shellcheck: lint shell scripts'
    'downgrade: Downgrade of Packages'
    'pacman-contrib: Used as a fallback for update checking'
)

provides=("pacsea=${pkgver}")
conflicts=('pacsea' 'pacsea-git')
source=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/pacsea"
        "Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")
sha256sums=('4d28f58b677646a669b71c568118de6fbe35fe26f44f6f4e433f223899db79bd'
            'e7ce0b1098d4cb37aabc8b880e57d55a4b799eab831b020dd5bebc5d7cf0965a')
noextract=('Pacsea')

prepare() {
  # Verify the binary exists (follow symlinks)
  local binary_path="$srcdir/Pacsea"
  if [[ ! -f "$binary_path" ]]; then
    error "Pacsea binary not found in $srcdir"
    ls -la "$srcdir/" || true
    return 1
  fi
  
  # Verify the binary is executable and not corrupted
  chmod +x "$binary_path"
  
  # Check ELF magic bytes directly (more reliable than file command)
  local magic_bytes
  magic_bytes=$(head -c 4 "$binary_path" 2>/dev/null | od -A n -t x1 | tr -d ' \n' || echo "")
  if [[ "$magic_bytes" != "7f454c46" ]]; then
    # 7f 45 4c 46 = ELF magic: 0x7F 'E' 'L' 'F'
    error "Downloaded Pacsea binary does not have ELF magic bytes"
    error "Expected: 7f454c46, Got: $magic_bytes"
    error "Try cleaning your build cache and rebuilding"
    return 1
  fi
}

package() {
  # GitHub tarballs from tags extract to Pacsea-<version> (without 'v' prefix)
  cd "$srcdir/Pacsea-${pkgver}" || exit 1
  install -Dm755 "$srcdir/Pacsea" "$pkgdir/usr/bin/pacsea"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  
  # Install i18n configuration
  install -Dm644 "config/i18n.yml" "$pkgdir/usr/share/pacsea/config/i18n.yml"
  
  # Install locale files
  install -d "$pkgdir/usr/share/pacsea/locales"
  install -m644 config/locales/*.yml "$pkgdir/usr/share/pacsea/locales/"
}
