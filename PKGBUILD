# Maintainer: deeadly (DC only)

pkgname='midnight-cli-git'
_pkgname='midnight-cli'
pkgver=r706.832c6c2
pkgrel=1
pkgdesc="DiM's fork of Caelestia-CLI"
arch=('any')
url='https://github.com/dim-ghub/midnight-cli'
license=('GPL-3.0-only')
install="${pkgname}.install"

depends=(
    'python'
    'python-pillow'
    'python-materialyoucolor'
    'libnotify'
    'swappy'
    'grim'
    'dart-sass'
    'wl-clipboard'
    'slurp'
    'gpu-screen-recorder'
    'dconf'
    'cliphist'
    'fuzzel'
)

optdepends=(
    'midnight-shell: shell control and screenshot function'
)

makedepends=(
    'git'
    'python-build'
    'python-installer'
    'python-hatch'
    'python-hatch-vcs'
)

provides=("${_pkgname}" 'dim-caelestia-cli-git' 'caelestia-cli')
conflicts=("${_pkgname}" 'dim-caelestia-cli-git' 'caelestia-cli' 'caelestia-cli-git')
replaces=('dim-caelestia-cli-git')

source=("${pkgname}::git+https://github.com/dim-ghub/midnight-cli.git")
sha256sums=('SKIP')

prepare() {
    git -C "${srcdir}/${pkgname}" clean -dfx
}

pkgver() {
    cd "${srcdir}/${pkgname}"
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
    cd "${srcdir}/${pkgname}"
    python -m build --wheel --no-isolation
}

package() {
    cd "${srcdir}/${pkgname}"
    python -m installer --destdir="$pkgdir" dist/*.whl

    if [ -f ./completions/midnight.fish ]; then
        install -Dm644 ./completions/midnight.fish "$pkgdir/usr/share/fish/vendor_completions.d/midnight.fish"
    elif [ -f ./completions/caelestia.fish ]; then
        install -Dm644 ./completions/caelestia.fish "$pkgdir/usr/share/fish/vendor_completions.d/caelestia.fish"
    fi
}
