# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.8.1
_tag="v$pkgver"
pkgrel=4
pkgdesc="Fast TUI for searching, inspecting, and queueing pacman/AUR packages written in Rust (binary version)"
arch=('x86_64' 'aarch64')
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
source=("Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")
source_x86_64=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/pacsea")
source_aarch64=("Pacsea::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/pacsea-aarch64")
sha256sums=('3a89523ea08704b4a30efc31b1f99cea9ec7193d89952c10a7cd5b21d77422e3')
sha256sums_x86_64=('26c6ee6f9868fd988732039931d3049e816dd6fee7f7a8ac7eb7ca10b36503b2')
sha256sums_aarch64=('1de184460187a8b2c69356ffc998fd2ae1302f6a7fde4c197a18255069c40023')
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

  # e_machine at offset 18–19 (little-endian) — avoids readelf/grep (locale, PATH, output shape).
  # EM_X86_64=62, EM_AARCH64=183 (elf.h).
  local em_lo em_hi emachine
  em_lo=$(od -An -t u1 -j 18 -N 1 "$binary_path" | tr -d ' \n')
  em_hi=$(od -An -t u1 -j 19 -N 1 "$binary_path" | tr -d ' \n')
  if [[ -z "$em_lo" || -z "$em_hi" ]]; then
    error "Could not read ELF e_machine from binary (file too short or unreadable?)"
    return 1
  fi
  emachine=$((10#$em_lo + 10#$em_hi * 256))

  case "$CARCH" in
    x86_64)
      if ((emachine != 62)); then
        error "Expected x86_64 binary (e_machine=62), got e_machine=$emachine"
        return 1
      fi
      ;;
    aarch64)
      if ((emachine != 183)); then
        error "Expected AArch64 binary (e_machine=183), got e_machine=$emachine"
        return 1
      fi
      ;;
  esac
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
