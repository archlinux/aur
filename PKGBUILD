# Maintainer: Kevin MacMartin <prurigro at gmail dot com>
# Maintainer: SanskritFritz (gmail)
# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org>
# Contributor: Hawath <hawath at 163 dot com>

_pkgname=treesheets
pkgname=$_pkgname-git
pkgver=r1055.8b58c10
pkgrel=1
pkgdesc='A "hierarchical spreadsheet" as a replacement for spreadsheets, mind mappers, outliners, PIMs, text editors and small databases.'
url="https://strlen.com/treesheets/"
license=('Zlib')
depends=('wxwidgets-gtk3' wxwidgets-common glibc gcc-libs hicolor-icon-theme)
makedepends=('cmake' 'git')
arch=('i686' 'x86_64' 'aarch64' 'armv7h')
provides=('treesheets')
conflicts=('treesheets')

source=(
  "git+https://github.com/aardappel/$_pkgname.git"
  'myframe.patch'
)

sha512sums=('SKIP'
            '8fc4872d8e430899d21e95d6009dea8dde50ba5854a245b4b78901cebf82e3275b23b92f5afe9c5e2f11c34e1d73cd1657d48a3f8aa937eedfc576f2e62bcd77')

pkgver() {
  cd $_pkgname

  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd $_pkgname

  #patch --binary -p1 < ../myframe.patch
  find TS/images -type f ! -iname '*.png' -a ! -iname '*.svg' -delete
}

build() {
  local _flags=(
    -DGIT_WXWIDGETS_SUBMODULES=OFF
    -DTREESHEETS_WITH_STATIC_WXWIDGETS=OFF
  )

  cmake -B build -S "$_pkgname" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    "${_flags[@]}"

  cmake --build build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
  install -Dm644 treesheets/ZLIB_LICENSE.txt -t "${pkgdir}/usr/share/licenses/${pkgname}/"
}
