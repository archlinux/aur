# Maintainer: araujo791 <https://github.com/araujo791>
pkgname=machctrl-bin
pkgver=3.0.0
pkgrel=1
pkgdesc="Hardware monitor and optimizer for Linux — CPU, GPU, RAM, fans, temperature and system tuning (prebuilt)"
arch=('x86_64')
url="https://github.com/araujo791/MachCtrl-GTK4"
license=('MIT')
depends=(
    'webkit2gtk-4.1'
    'gtk3'
    'librsvg'
    'lm_sensors'
    'dmidecode'
    'sudo'
)
optdepends=(
    'nvidia-utils: NVIDIA GPU support (fan control, temperature)'
    'cpupower: finer CPU frequency control in the Tune screen'
)
# Instala/atualiza o MachCtrl. Substitui a v2.0 (Electron) e a variante do fonte.
provides=('machctrl')
conflicts=('machctrl' 'machctrl-git')
replaces=('machctrl-electron')
install=machctrl.install
backup=('etc/sudoers.d/machctrl')

# Binarios pre-compilados da release fixa (tag v$pkgver).
source=("machctrl-$pkgver.tar.gz::https://github.com/araujo791/MachCtrl-GTK4/releases/download/v$pkgver/machctrl-$pkgver-x86_64.tar.gz")
sha256sums=('SKIP')

package() {
    # O tarball da release extrai numa subpasta machctrl-<ver>-x86_64/
    cd "$srcdir/machctrl-${pkgver}-x86_64"

    # Binarios
    install -Dm755 "machctrl"   "$pkgdir/opt/machctrl/machctrl"
    install -Dm755 "machctrld"  "$pkgdir/opt/machctrl/machctrld"

    # Launcher (auto-eleva via sudo NOPASSWD SETENV)
    install -Dm755 "machctrl-launcher.sh" "$pkgdir/usr/bin/machctrl"

    # Icones + .desktop
    install -Dm644 "app-icon.png" "$pkgdir/usr/share/pixmaps/machctrl.png"
    install -Dm644 "app-icon.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/machctrl.png"
    install -Dm644 "machctrl.desktop" "$pkgdir/usr/share/applications/machctrl.desktop"

    # Servico systemd do daemon (controle de fans em background)
    install -Dm644 "machctrld.service" "$pkgdir/usr/lib/systemd/system/machctrld.service"

    # sudoers NOPASSWD: abre o app como root sem pedir senha.
    install -dm750 "$pkgdir/etc/sudoers.d"
    cat > "$pkgdir/etc/sudoers.d/machctrl" << 'SUDOERS'
# MachCtrl: permite abrir o app com privilegios sem pedir senha.
%wheel ALL=(root) NOPASSWD: SETENV: /opt/machctrl/machctrl
%sudo  ALL=(root) NOPASSWD: SETENV: /opt/machctrl/machctrl
SUDOERS
    chmod 440 "$pkgdir/etc/sudoers.d/machctrl"
}
