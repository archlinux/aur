# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="phcc"
pkgname="${_pkgname}-git"
pkgver=r29.578b4ea
pkgrel=1
pkgdesc="A Portable HolyC Compiler"
arch=('x86_64')
url="https://github.com/mrunix00/${_pkgname^^}"
license=('AGPL-3.0-or-later')
makedepends=('git' 'meson' 'unity-test')
depends=('flex' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname^^}"
source=("${_pkgsrc}::git+${url}.git"
        "${_pkgname}_fix_meson_build.patch")
sha256sums=('SKIP'
            '1300ffc1b4179343beba906f72d5de67375487afb387af07bede93c13165fe3b')

pkgver() {
  cd "${_pkgsrc}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  for _patch in "${srcdir}/${_pkgname}"*".patch"; do
    patch -p1 -i "${_patch}"
  done

  find . -type f -name '*.c' -exec sed -i 's|\.\./autogen/||g' {} +
}

build() {
  cd "${srcdir}"
  arch-meson "${_pkgname^^}" build
  meson compile -C build
}

check() {
  cd "${srcdir}"
  meson test -C build --print-errorlogs
}

package() {
  cd "${srcdir}"
  meson install -C build --destdir "${pkgdir}"

  cd "${_pkgsrc}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
