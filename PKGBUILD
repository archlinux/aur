# Maintainer: Daniel Dibiasi <q11f4q1bi@mozmail.com>
pkgname=thunar-z-jump-git
_pkgname=thunar-z-jump
# Placeholder: pkgver() below rewrites this from the checkout before every build.
# Do not pin a real commit here — it goes stale (and cannot point at the commit
# that contains it anyway). Kept roughly current only so the AUR web frontend and
# `paru`/`yay` search show a meaningful version instead of 0.r0.g0000000.
pkgver=1.0.1.r0.g139b786
pkgrel=1
pkgdesc="Thunar plugin to jump to frecency-ranked directories from z / zsh-z / zoxide"
arch=('any')
url="https://github.com/ddibiasi/thunar-z-jump"
license=('MIT')
depends=(
    'python'
    'python-gobject'
    'glib2'
    'gtk3'
    'thunar'
    'thunarx-python'
)
optdepends=(
    'zsh: required unless THUNAR_Z_JUMP_SHELL points at another shell'
    'zsh-z: default backend, provides the `zshz` function (AUR); required unless THUNAR_Z_JUMP_COMMAND is set'
    'zoxide: alternative backend (set THUNAR_Z_JUMP_COMMAND=zoxide query --list)'
)
makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-setuptools'
    'python-setuptools-scm'
    'python-wheel'
)
# No check(): the suite spawns interactive shells and drives GTK dialogs, which
# is not what a package build should be doing on the user's session — an
# interactive shell's job-control setup signalled makepkg's process group and
# suspended the whole `paru` invocation ("suspended (tty input)"). CI
# (.github/workflows/ci.yml) runs the tests, with and without a display.
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
source=("$pkgname::git+$url.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/$pkgname"
    # SemVer from the latest tag if present; otherwise rN.<hash> from history.
    # Subshell scopes pipefail so the `|| fallback` actually fires when
    # `git describe` exits non-zero (e.g. before any tag exists).
    ( set -o pipefail
      git describe --long --tags --abbrev=7 2>/dev/null \
        | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
    ) || printf 'r%s.%s' \
        "$(git rev-list --count HEAD)" \
        "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "$srcdir/$pkgname"
    python -m build --wheel --no-isolation
}

package() {
    cd "$srcdir/$pkgname"
    python -m installer --destdir="$pkgdir" dist/*.whl
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
