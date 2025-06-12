pkgname=ayaan-unstable
pkgver=1.0.0
pkgrel=1
pkgdesc="AyaanScript+ (unstable version)"
arch=('x86_64')
url="https://github.com/ayaan511/AyaanScriptPlus"  # Optional website or GitHub
license=('custom')
depends=('wine')
source=(
  "https://github.com/ayaan511/AyaanScriptPlus/releases/download/v1.0.2.1/ayaan.exe"
  "https://github.com/ayaan511/AyaanScriptPlus/releases/download/v1.0.2.1/aspkg.exe"
  "ayaan-launcher.sh"
  "aspkg-launcher.sh"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Install EXEs
  install -Dm644 "$srcdir/ayaan.exe" "$pkgdir/opt/ayaan/unstable/ayaan.exe"
  install -Dm644 "$srcdir/aspkg.exe" "$pkgdir/opt/ayaan/unstable/aspkg.exe"

  # Install launchers
  install -Dm755 "$srcdir/ayaan-launcher.sh" "$pkgdir/usr/bin/unstable/ayaan"
  install -Dm755 "$srcdir/aspkg-launcher.sh" "$pkgdir/usr/bin/unstable/aspkg"

  # Handle PATH modification per user
  for home in /home/*; do
    user="$(basename "$home")"
    rcfile=""

    # Detect shell
    user_shell=$(getent passwd "$user" | cut -d: -f7)
    if [[ "$user_shell" == */zsh ]] && [[ -f "$home/.zshrc" ]]; then
      rcfile="$home/.zshrc"
    elif [[ -f "$home/.bashrc" ]]; then
      rcfile="$home/.bashrc"
    fi

    [[ -z "$rcfile" ]] && continue

    # Safe PATH injection
    if ! grep -Fxq 'export PATH="$PATH:/usr/bin/unstable"' "$rcfile"; then
      echo 'export PATH="$PATH:/usr/bin/unstable"' >> "$rcfile"
      echo "✅ Patched: $rcfile"
    fi

    # Check if this is an uninstall situation
    if [[ "$1" == "remove" ]] || [[ "$1" == "uninstall" ]] || [[ ! -f "$pkgdir/usr/bin/unstable/ayaan" ]]; then
      sed -i '/export PATH="\$PATH:\/usr\/bin\/unstable"/d' "$rcfile"
      echo "🧹 Cleaned: $rcfile"
    fi
  done
}
