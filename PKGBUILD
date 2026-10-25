# Paquete de Arch de morgan, compilado desde la punta de main. El de la última versión ya
# compilada es morgan-bin (dist/arch/morgan-bin). Sin paquete: install.sh, en la raíz del repo.
#
#   makepkg -si
#
# El árbol que se instala lo arma dist/empaquetar, el mismo que usa morgan-bin.
#
# Lo que el paquete no puede hacer por cada usuario lo hace `morgan setup` (lo dice
# morgan.install al instalar).

pkgname=morgan-git
_nombre=morgan
pkgver=0.2.0.r0.g0000000
pkgrel=1
pkgdesc='Shell de escritorio para Hyprland: barra, centro de control, notificaciones, launcher, OSD y bloqueo'
arch=('x86_64' 'aarch64')
url='https://github.com/ImJustDoingMyPart/morgan'
# El código, GPL; el tema y las plantillas de /usr/share/morgan, MIT (con sus créditos).
license=('GPL-3.0-or-later' 'MIT')
depends=(
    'hyprland>=0.56'
    'libpulse'
    'glib2'
    'libxkbcommon'
    'fontconfig'
    # El motor dibuja con wgpu, que carga Vulkan al arrancar.
    'vulkan-icd-loader'
    'pam'
    'systemd'
    'curl'
    'wl-clipboard'
)
makedepends=('cargo' 'git' 'hyprland-protocols')
optdepends=(
    'matugen: temas (también los curados: las plantillas pasan por matugen)'
    'awww: fondos de pantalla'
    'libvips: miniaturas de la banda de fondos'
    'hyprsunset: luz nocturna'
    'ddcutil: brillo de monitores externos (DDC/CI)'
    'hyprshot: capturas de pantalla'
    'cliphist: launcher, portapapeles'
    'wtype: launcher, escribir símbolos'
    'libqalculate: calculadora'
    'cava: ecualizador del reproductor en el centro de control'
    'libcanberra: sonidos del sistema'
    'uwsm: lanzar apps como unidades de systemd'
    'gpu-screen-recorder-ui: indicador y control de grabación'
    'papirus-folders: color de las carpetas del tema de íconos'
    'jq: morgan-cuota (cuotas de Claude Code y Antigravity)'
)
provides=('morgan' 'notification-daemon')
conflicts=('morgan' 'morgan-bin')
backup=('etc/pam.d/morgan-lock')
install=morgan.install
source=("$_nombre::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$_nombre"
    # Con una etiqueta vX.Y.Z: X.Y.Z.rN.gHASH (ordena después de morgan-bin X.Y.Z); sin
    # etiquetas, rN.HASH.
    if git describe --tags --match 'v*' >/dev/null 2>&1; then
        git describe --long --tags --match 'v*' | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    else
        printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
    fi
}

prepare() {
    cd "$_nombre"
    export RUSTUP_TOOLCHAIN=stable
    cargo fetch --locked --target "$(rustc -vV | sed -n 's/host: //p')"
}

build() {
    cd "$_nombre"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release -p morgan -p morganctl -p morgan-lock
}

package() {
    cd "$_nombre"
    dist/empaquetar "$pkgdir" target/release
    mv "$pkgdir/usr/share/licenses/morgan" "$pkgdir/usr/share/licenses/$pkgname"
}
