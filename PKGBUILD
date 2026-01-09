# Maintainer: SyreeseOfficial <syreese@example.com>
pkgname=focusnoise-cli-git
_pkgname=FocusNoiseCLI
pkgver=1.0.0.r1.g0f2126d
pkgrel=1
pkgdesc="Focus Noise Player CLI - Ambient sounds for deep focus"
arch=('any')
url="https://github.com/SyreeseOfficial/FocusNoiseCLI"
license=('MIT')
depends=('python' 'python-pygame' 'python-rich')
makedepends=('git')
provides=('focusnoise-cli')
conflicts=('focusnoise-cli')
source=("git+https://github.com/SyreeseOfficial/FocusNoiseCLI.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' || \
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$_pkgname"

  # Create installation directories
  install -d "$pkgdir/usr/share/focusnoise-cli"
  install -d "$pkgdir/usr/bin"

  # Install application files and assets
  # Using cp -a to preserve structure
  cp -a assets *.py "$pkgdir/usr/share/focusnoise-cli/"

  # Create and install the launcher script
  cat > "$pkgdir/usr/bin/focusnoise" <<EOF
#!/bin/sh
exec python /usr/share/focusnoise-cli/main.py "\$@"
EOF

  # Make launcher executable
  chmod 755 "$pkgdir/usr/bin/focusnoise"
}
