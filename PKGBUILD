pkgname='passbook-git'
_gitname="${pkgname/-git}"
pkgdesc='Password manager for GNOME'
pkgver=0.1
pkgrel=1
url='https://wiki.gnome.org/Apps/Passbook'
arch=('x86_64')
license=('GPL3')
makedepends=('git' 'meson' 'ninja')
depends=(
  'appstream-glib' 'desktop-file-utils' 'gobject-introspection'
  'gtk3' 'itstool' 'python-cairo' 'python-gobject'
)
conflicts=("${_gitname}")
provides=("${_gitname}")
source=(
  "git+https://gitlab.gnome.org/gnumdk/${_gitname}.git"
  "git+https://gitlab.gnome.org/gnumdk/${_gitname}-po.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  cd "${_gitname}"

  git describe --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "${_gitname}"

  local -r submodules=(
    'passbook-po'
  )

  for module in "${submodules[@]}"; do
    local submodule="subprojects/${module/passbook-/}"
    git submodule init "${submodule}"
    git config "submodule.${submodule}.url" "${srcdir}/${module}"
    git submodule update "${submodule}"
  done
}

build() {
  cd "${_gitname}"

  meson build --prefix=/usr
}

package() {
  cd "${_gitname}"

	DESTDIR="$pkgdir" ninja -C build install
}

# vim: ts=2 sw=2 et:
