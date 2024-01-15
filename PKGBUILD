_name='phosh-osk-stub'
pkgname="$_name-git"
pkgver=0.35.0.r4.g59f99d7
pkgrel=2
pkgdesc="An alternative OSK for phosh"
arch=('x86_64' 'aarch64')
url="https://gitlab.gnome.org/guidog/$_name"
license=('GPL-3.0-only')

depends=(
    feedbackd
    gnome-desktop
    fzf
    hunspell
)
makedepends=(
    git
    meson
    cmake
)
optdepends=(
    'presage-git: predictive text entry'
    'govarnam: transliteration for Indian languages'
)
provides=(${_name})
conflicts=(
    ${_name}
)

source=("${_name}::git+$url")
sha256sums=('SKIP')


pkgver() {
    cd "${_name}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/v//'
}

build() {
    arch-meson -Dgtk_doc=false -Ddefault_osk=false "$_name" build
    meson compile -C build
}

check() {
    meson test -C build --print-errorlogs
}

package() {
    DESTDIR="${pkgdir}" meson install -C build
}
