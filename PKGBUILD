# Maintainer:  dreieck
# Contributor: Helder Bertoldo <helder.bertoldo@gmail.com>

_gitname=hourglass
_author=sgpthomas
pkgname=("${_gitname}-git")
pkgver=r306.a33e786
pkgrel=1
pkgdesc="A simple clock application that provides stopwatches, alarms, and timers designed for Pantheon Shell"
arch=('i686' 'x86_64')
url="https://github.com/${_author}/${_gitname}"
license=('GPL-3.0-or-later')
depends=(
  'gtk4'
  'glib2'
  'glibc'
  'libgee'
  'libgranite-7.so'
  'libportal-gtk4'
  'libportal'
)
optdepends=()
makedepends=('git' 'meson' 'vala')
provides=("${_gitname}")
conflicts=("${_gitname}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
    cd "${_gitname}"
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

build() {
    cd "${_gitname}/"
    meson . _build --prefix=/usr
    ninja -C _build
}

package() {
    cd "${_gitname}/"
    DESTDIR="${pkgdir}" ninja -C _build install

    ln -svr "${pkgdir}/usr/bin/com.github.sgpthomas.hourglass" "${pkgdir}/usr/bin/hourglass"
}

