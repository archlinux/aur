pkgname=greetd-dms-greeter-git
pkgver=0.5.0.13.g12365edc
#pkgver=r960.7516d44
pkgrel=1
pkgdesc='DankMaterialShell greeter for greetd'
arch=('x86_64' 'aarch64')
url='https://github.com/AvengeMedia/DankMaterialShell'
license=('GPL-3.0-only')
depends=(
    'greetd'
    'quickshell'
)
optdepends=(
    'niri: Niri compositor support'
    'hyprland: Hyprland compositor support'
    'sway: Sway compositor support'
)
makedepends=('git')
provides=('greetd-dms-greeter')
conflicts=('greetd-dms-greeter' 'greetd-dms-greeter-bin')
backup=('etc/greetd/config.toml')
install=greetd-dms-greeter.install
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  if git describe --tags --long >/dev/null 2>&1; then
    git describe --tags --long | sed 's/^v//; s/-/./g'
  else
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  fi
}

package() {
    cd "${srcdir}/${pkgname}"

    install -dm755 "$pkgdir/usr/share/quickshell/dms-greeter"
    cp -r ./quickshell/* "$pkgdir/usr/share/quickshell/dms-greeter/"

    install -Dm755 "quickshell/Modules/Greetd/assets/dms-greeter" "$pkgdir/usr/bin/dms-greeter"

    install -Dm644 "quickshell/Modules/Greetd/README.md" "$pkgdir/usr/share/doc/dms-greeter/README.md"

    rm -rf "$pkgdir/usr/share/quickshell/dms-greeter/.git"*

    install -dm750 "$pkgdir/var/cache/dms-greeter"
}
