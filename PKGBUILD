# Maintainer: Daniel <TU_CORREO_AQUI>
pkgname=rustask-es-git
pkgver=r1.0a86fef
pkgrel=1
pkgdesc="Gestor de tareas estilo kanban en terminal (TUI), con las tareas guardadas como Markdown en un repositorio git (versión de desarrollo, siempre la última de main)"
arch=('x86_64')
url="https://github.com/danicorgam/rustask-es"
license=('MIT')
depends=('git')
makedepends=('cargo' 'git')
provides=('rustask')
conflicts=('rustask')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "$srcdir/$pkgname"
    # Descarga las dependencias de Cargo.lock con red disponible, para que
    # build() pueda compilar después en modo --frozen (sin red).
    cargo fetch --locked
}

build() {
    cd "$srcdir/$pkgname"
    export RUSTUP_TOOLCHAIN=stable
    export CARGO_TARGET_DIR=target
    cargo build --frozen --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 "target/release/rustask" "$pkgdir/usr/bin/rustask"

    if [ -f README.md ]; then
        install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
    fi
    if [ -f LICENSE ]; then
        install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    fi
}
