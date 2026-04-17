# Maintainer: Firstpick firstpick1992@proton.me
pkgname=pacsea-bin
pkgver=0.8.2
_tag="v$pkgver"
pkgrel=1
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

# Tarball for config/locale/data files (architecture-independent)
source=("Pacsea-${_tag}.tar.gz::https://github.com/Firstp1ck/Pacsea/archive/refs/tags/${_tag}.tar.gz")

# Architecture-specific prebuilt binaries
source_x86_64=("pacsea-x86_64::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/pacsea-x86_64")
source_aarch64=("pacsea-aarch64::https://github.com/Firstp1ck/Pacsea/releases/download/${_tag}/pacsea-aarch64")

sha256sums=('747529d71550be1753b68c6a139944eb53ad31ff6aed06e01eae60ce94432139')
sha256sums_x86_64=('6d47aaaa3867dd872d6ca1d3f8446fe3714ab56d96505243d0f106561ccc1d94')
sha256sums_aarch64=('2a4dbbdeca5213507e51c2d28468e3be1e68b32884cc419cc45c84264431bd82')

noextract=("pacsea-x86_64" "pacsea-aarch64")

prepare() {
  # Select the correct binary for this architecture
  case "$CARCH" in
    x86_64)   local binary_path="$srcdir/pacsea-x86_64" ;;
    aarch64)  local binary_path="$srcdir/pacsea-aarch64" ;;
  esac

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
  # Source tarball extracts to Pacsea-<version> (without 'v' prefix)
  local srcroot="$srcdir/Pacsea-${pkgver}"

  case "$CARCH" in
    x86_64)   local binary_path="$srcdir/pacsea-x86_64" ;;
    aarch64)  local binary_path="$srcdir/pacsea-aarch64" ;;
  esac

  install -Dm755 "$binary_path"                         "$pkgdir/usr/bin/pacsea"
  install -Dm644 "$srcroot/LICENSE"                    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "$srcroot/README.md"                  "$pkgdir/usr/share/doc/$pkgname/README.md"

  # Install i18n configuration
  install -Dm644 "$srcroot/config/i18n.yml"            "$pkgdir/usr/share/pacsea/config/i18n.yml"

    # Install locale files
  install -d                                            "$pkgdir/usr/share/pacsea/locales"
  install -m644  "$srcroot/config/locales/"*.yml        "$pkgdir/usr/share/pacsea/locales/"
  install -Dm644 "$srcroot/data/pacsea.desktop"         "$pkgdir/usr/share/applications/pacsea.desktop"
  install -Dm644 "$srcroot/data/assets/pacsea.svg"      "$pkgdir/usr/share/icons/hicolor/scalable/apps/pacsea.svg"
}
