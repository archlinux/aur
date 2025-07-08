# Maintainer: Claudia Pellegrino <aur ät cpellegrino.de>

pkgname=anthywl-git
_gitpkgname=anthywl
pkgver=r90.2fad24a
pkgrel=1
pkgdesc='Japanese input method for Wayland compositors'
arch=('x86_64')
url='https://github.com/tadeokondrak/anthywl'
license=('ISC')
depends=(
  'anthy'
  'cairo'
  'glib2'
  'glibc'
  'libscfg'
  'libvarlink'
  'libxkbcommon'
  'pango'
  'wayland'
  'wayland-protocols'
)
makedepends=('git' 'meson' 'ninja' 'scdoc')
provides=("anthywl=${pkgver}")
conflicts=('anthywl')
install="${pkgname}.install"

source=("${_gitpkgname}::git+https://github.com/tadeokondrak/anthywl.git")
sha512sums=('SKIP')

pkgver() {
  printf "r%s.%s" \
    "$(git -C "${_gitpkgname}" rev-list --count HEAD)" \
    "$(git -C "${_gitpkgname}" rev-parse --short HEAD)"
}

build() {
  cd "${_gitpkgname}"

  arch-meson build
  ninja -C build
}

package() {
  cd "${_gitpkgname}"

  echo >&2 'Packaging application files'
  DESTDIR="$pkgdir" ninja -C build install

  echo >&2 'Packaging skeleton configuration'
  install -D -m 644 -T \
    data/default_config \
    "${pkgdir}/usr/share/${_gitpkgname}/examples/config"

  echo >&2 'Packaging the documentation'
  install -D -m 644 -t "${pkgdir}/usr/share/doc/${_gitpkgname}" \
    README.md

  echo >&2 'Packaging the license'
  install -D -m 644 -t "${pkgdir}/usr/share/licenses/${pkgname}" \
    LICENSE
}
