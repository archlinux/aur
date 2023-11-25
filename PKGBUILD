# Contributor: dreieck (https://aur.archlinux.org/account/dreieck)

## NOTE: Maybe https://github.com/maplibre/maplibre-native/ replaces this as a maintained fork.

_pkgname=mapbox-gl-native
pkgname="${_pkgname}"
_alpinever=3.14
pkgver=1.6.0
pkgrel=2
arch=(
  "x86_64"
  "aarch64"
)
url="https://github.com/mapbox/mapbox-gl-native"
# Using source from Alpine since submodules aren't included in github.com tarball.
source=(
  "${_pkgname}-${pkgver}.tar.gz::https://distfiles.alpinelinux.org/distfiles/v${_alpinever}/${_pkgname}-${pkgver}.tar.gz"
  "fix-compilation.patch"
  "allow-qt-deprecations.patch"
  "16591.patch"
  "arch-include-dir.patch"
)
sha256sums=(
  "41bb6ff6a6466ea7e74429da7b766373cee197bb7356d51365934ee1699d6355"
  "b3a9c9a410dabf2382d1500952fa30e73e42162e451f46f1ca7533003261abcd"
  "721208fa7cb3874289c65a22354bc9a0a89150b4d656a106b04d84254fc25b9d"
  "efc3b434ed353830d9b6d63c0db714da89f3915a1624dcecc455bc5fe9f3eb17"
  "c0cdf1e9ad2169abeb0143e0af3a9b6eb362728e824b943a53a976ef07da9e13"
)
sha512sums=(
  "5e70f04fc22854f2208c335e12bd85252432d7939a1b205c5dbaebe27a3de681cd14e2ef88100f04bc4c84b412020670681f2d548e7cdc209ee3aaa70349f025"
  "6e7af9079af04eec44ad5b96ddc2d0afd6781ed38215c9c87e77d0360ebc6232c050a9d53eb09c3ef44aa027392e47abe5fdaff8c27cdf8d89cd7f5554b4b29e"
  "b2aa9dffb5b1ea9e5765b02fdae599372ab4133ba001a937b251da05cca176af15d7c82f635ac5156f4dcd13f9fe1fb20b4323a3cfb9e742c52bc4a071407a6b"
  "c21bb4a789e6071e3dba131d03cf40330fae2c1d912673932d2993321a05f3b664c73e820b9048ca75ca3f24b68573729e8172ed37211396a7b0b1f0a342c8cd"
  "9bab06c981056c9b934595862095674d92b11e329a80e2f0b96fc211d12bda34538af25e26038888b1e47cf159af33c34464e52d2e8a9a5e2321c270bcd3e6d5"
)

depends=(
  "glfw"
)
makedepends=(
  "cmake"
)

prepare() {
  cd "${_pkgname}"

  for _patch in "${srcdir}"/{allow-qt-deprecations,fix-compilation,16591,arch-include-dir}.patch; do
    msg2 "Applying patch '$(basename "${_patch}")' ..."
    patch -Np1 --follow-symlinks -i "${_patch}"
  done
}

build() {
  cmake -B build -S "${_pkgname}" -DCMAKE_INSTALL_PREFIX='/usr' -DMBGL_WITH_QT=ON -DMBGL_WITH_WERROR=OFF -DCMAKE_INSTALL_LIBDIR=lib
  make -C build
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
