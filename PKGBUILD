pkgname=ayaan-unstable
pkgver=1.0.0
pkgrel=1
pkgdesc="AyaanScript+ (unstable version using .exe + Wine)"
arch=('x86_64')
url="https://github.com/ayaan511/AyaanScriptPlus"  # Optional website or GitHub
license=('custom')
depends=('wine')
source=("ayaan.exe"
        "aspkg.exe"
        "ayaan-launcher.sh"
        "aspkg-launcher.sh")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

package() {
  # Install EXEs
  install -Dm644 "$srcdir/ayaan.exe" "$pkgdir/opt/ayaan/unstable/ayaan.exe"
  install -Dm644 "$srcdir/aspkg.exe" "$pkgdir/opt/ayaan/unstable/aspkg.exe"

  # Install launchers
  install -Dm755 "$srcdir/ayaan-launcher.sh" "$pkgdir/usr/bin/unstable/ayaan"
  install -Dm755 "$srcdir/aspkg-launcher.sh" "$pkgdir/usr/bin/unstable/aspkg"

  # Auto PATH injection into bashrc or zshrc
  for home in /home/*; do
    user_shell=$(getent passwd "$(basename "$home")" | cut -d: -f7)

    if [ "$user_shell" = "/bin/zsh" ] && [ -f "$home/.zshrc" ]; then
      rcfile="$home/.zshrc"
    elif [ -f "$home/.bashrc" ]; then
      rcfile="$home/.bashrc"
    else
      continue
    fi

    if ! grep -q '/usr/bin/unstable' "$rcfile"; then
      echo 'export PATH="$PATH:/usr/bin/unstable"' >> "$rcfile"
      echo "✅ Patched: $rcfile"
    fi

    # Auto-source it immediately
    su "$(basename "$home")" -c "source $rcfile"
  done
}
