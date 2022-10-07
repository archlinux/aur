# Maintainer: Your Name <youremail@domain.com>

pkgname=('atoms-git' 'atoms-cli-git' 'atoms-core-git')
pkgbase='atoms-git'
_pkgname=Atoms
pkgver=r282.db7b25d
pkgrel=2
pkgdesc="Easily manage Linux chroot(s)"
arch=('any')
url="https://github.com/AtomsDevs/Atoms"
license=('GPL3')
depends=('libadwaita' 'podman' 'proot' 'python-certifi' 'python-chardet' 'python-idna' 'python-orjson' 'python-requests' 'python-tabulate' 'python-uproot' 'python-urllib3' 'talloc' 'vte4' 'servicectl')
makedepends=('git' 'meson' 'python-setuptools')
checkdepends=('appstream-glib' 'python-pytest')
provides=("${pkgname%-git}")
conflicts=("${pkgname%-git}")
source=(
  "git+$url.git"
  "git+https://github.com/AtomsDevs/atoms-cli.git"
  "git+https://github.com/AtomsDevs/atoms-core.git"
  "git+https://github.com/AtomsDevs/servicectl.git"
)
b2sums=('SKIP'
        'SKIP'
        'SKIP'
        'SKIP')

prepare() {
  cd "${_pkgname%-git}"
  git submodule init
  git config submodule."atoms-cli".url "${srcdir}"/atoms-cli
  git config submodule."atoms-core".url "${srcdir}"/atoms-core
  git config submodule."servicectl".url "${srcdir}"/servicectl
  git submodule update --init --recursive
}

pkgver() {
  cd "${_pkgname%-git}"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}

build() {
  arch-meson "${_pkgname%-git}" build
  meson compile -C build
}

check() {
  meson test -C build || :
}

check_atoms-cli-git(){
  cd "${pkgbase%-git}-cli"
  python setup.py pytest || :
}

check_atoms-core-git(){
  cd "${pkgbase%-git}-core"
  python setup.py pytest || :
}

package_atoms-git() {
  depends=('atoms-cli' 'atoms-core' 'servicectl')
  meson install -C build --destdir "$pkgdir"
}

package_atoms-cli-git() {
  pkgdesc='Atoms CLI allows you to create and manage your atoms via the command line.'
  depends=('python-tabulate' 'atoms-core')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "${pkgbase%-git}-cli"
  python setup.py install --root="$pkgdir" --optimize=1
}

package_atoms-core-git() {
  pkgdesc='Atoms Core allows you to create and manage your own chroots and podman containers.'
  depends=('python-orjson')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")

  cd "${pkgbase%-git}-core"
  python setup.py install --root="$pkgdir" --optimize=1
}
