pkgname='dim-caelestia-cli-git'
pkgver=r672.da2b6ba
pkgrel=1
pkgdesc="DiM's fork of Caelestia-CLI"
arch=('any')
url='https://github.com/deeadly137/caelestia-cli'
license=('GPL-3.0-only')
depends=('python' 'python-pillow' 'python-materialyoucolor' 'libnotify' 'swappy' 'grim' 'dart-sass'
         'wl-clipboard' 'slurp' 'gpu-screen-recorder' 'dconf' 'cliphist' 'fuzzel')
optdepends=('caelestia-shell: shell control and screenshot function')
makedepends=('git' 'python-build' 'python-installer' 'python-hatch' 'python-hatch-vcs')
provides=('caelestia-cli')
conflicts=('caelestia-cli' 'caelestia-cli-git')
source=("${pkgname}::git+https://github.com/deeadly137/caelestia-cli.git")
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
    install -Dm644 ./completions/caelestia.fish "$pkgdir"/usr/share/fish/vendor_completions.d/caelestia.fish
}
