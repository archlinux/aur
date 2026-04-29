# Maintainer: Keith Raghubar <aur.archlinux.org.buckskin000@passmail.net>

pkgname=sysforge-git
pkgver=1.0.0.r0.g0000000  # updated dynamically by pkgver()
pkgrel=1
pkgdesc="All-in-one Arch Linux helper for system setup and package management with compiler-optimized builds (git)"
arch=('any')
url="https://github.com/KeithRaghubar/sysforge"
license=('MIT')
depends=(
    'python>=3.11'
    'git'
    'sudo'
    'gnupg'
)
makedepends=(
    'uv'
    'python-pip'
    'python-argparse-manpage'
)
optdepends=(
    'bash-completion: bash tab completions'
    'ccache: compiler cache support'
    'sccache: Rust compiler cache support'
    'uv: required for bootstrap pipeline (configure stage)'
    'zsh: zsh shell support'
    'zsh-completions: additional zsh completions'
)
conflicts=('sysforge')
provides=('sysforge')
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    git describe --long --tags 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' \
        || printf "r%s.g%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    uv build --wheel
    PYTHONPATH=. argparse-manpage \
        --module sysforge.cli \
        --function _build_parser \
        --author "Keith Raghubar" \
        --author-email "aur.archlinux.org.buckskin000@passmail.net" \
        --project-name "$pkgname" \
        --url "$url" \
        --output man/sysforge.1
}

package() {
    cd "$srcdir/$pkgname"
    python -m pip install --no-deps --root="$pkgdir" dist/*.whl

    # Man page
    install -Dm644 man/sysforge.1 "$pkgdir/usr/share/man/man1/sysforge.1"

    # Zsh completion
    install -Dm644 completions/_sysforge \
        "$pkgdir/usr/share/zsh/site-functions/_sysforge"

    # Default config files
    local _conf="$pkgdir/etc/sysforge"
    install -Dm644 etc/sysforge/sysforge.toml               "$_conf/sysforge.toml"
    install -Dm644 etc/sysforge/profiles.toml               "$_conf/profiles.toml"
    install -Dm644 etc/sysforge/packages.toml               "$_conf/packages.toml"
    install -Dm644 etc/sysforge/kernel.toml                 "$_conf/kernel.toml"
    install -Dm644 etc/sysforge/toolchain.toml              "$_conf/toolchain.toml"
    install -Dm644 etc/sysforge/bootstrap.toml              "$_conf/bootstrap.toml"

    # State directory (pipeline state, build state, logs)
    install -Dm644 /dev/null "$pkgdir/usr/lib/tmpfiles.d/sysforge.conf"
    printf 'd /var/lib/sysforge 0777 root root -\n' \
        > "$pkgdir/usr/lib/tmpfiles.d/sysforge.conf"
}
