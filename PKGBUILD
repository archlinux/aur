# Maintainer: Naglis Jonaitis <naglis at mailbox dot org>
_pkgname="balss"
pkgname="${_pkgname}-git"
pkgver=0.1.0.r52.ec1213a
pkgrel=1
pkgdesc="Balss is an easy to use player for audiobook files with chapters such as m4b or mka"
arch=('x86_64')
url='https://github.com/nvlgit/Balss'
license=('GPL3')
depends=(
  'gtk3'
  'mpv'
)
makedepends=(
  'git'
  'meson'
  'vala'
)
_pkgsrc="${_pkgname}"
source=(
    "${_pkgsrc}"::"git+${url}.git"
    "data_meson_build.patch"
)
sha512sums=(
  'SKIP'
  'c2c540d4d9e5985f31ceb2f953f2e644b75a531f5ff8409011fd6db32150295b78d025ca07f3741ca30b82756a781986d8093e5e8f0ca5c971f8eeca1c81d213'
)

pkgver() {
  cd "${_pkgsrc}"

  printf "0.1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

prepare() {
    patch --directory="${_pkgsrc}" --forward --strip=1 --input="${srcdir}/data_meson_build.patch"
}

build() {
  cd "${_pkgsrc}"

  arch-meson . builddir
  meson compile -C builddir
}

package() {
  meson install -C "${_pkgsrc}/builddir" --destdir "${pkgdir}"
}
