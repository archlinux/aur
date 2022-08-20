# Maintainer: Your Name <youremail@domain.com>

pkgname=atoms-git
_pkgname=Atoms
pkgver=r198.b77715e
pkgrel=1
pkgdesc="Easily manage Linux chroot(s)"
arch=('any')
url="https://github.com/mirkobrombin/Atoms"
license=('GPL3')
depends=('libadwaita-git' 'podman' 'proot' 'python-certifi' 'python-chardet' 'python-idna' 'python-orjson' 'python-requests' 'python-uproot' 'python-urllib3' 'talloc' 'vte4')
makedepends=('git' 'meson')
checkdepends=('appstream-glib')
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

package() {
  meson install -C build --destdir "$pkgdir"
}
