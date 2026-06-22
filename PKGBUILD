# Maintainer: Malcolm Mallardi <mdmallardi at gmail dot com>
# Contributor: Wouter Wijsman <wwijsman at live dot nl>

pkgname=dosbox-staging-git
_pkgname=dosbox-staging
pkgver=0.84.0.alpha.168.ge8f07bfef
pkgrel=1
pkgdesc="A modernized DOSBox project using current development practices and tools, fixing issues, adding features that better support today's systems"
arch=('x86_64')
url="https://github.com/dosbox-staging/dosbox-staging"
license=("GPL-2.0-or-later")
depends=('sdl3' 'sdl3_image' 'opusfile' 'libslirp' 'alsa-lib' 'iir1' 'speexdsp' 'fluidsynth' 'munt' 'libpng' 'zlib-ng' 'libglvnd')
makedepends=('cmake' 'ninja' 'vcpkg')
provides=("dosbox" "dosbox-staging")
conflicts=("${provides[@]}")
source=(
  "git+https://github.com/dosbox-staging/${_pkgname}.git"
)
md5sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  CMAKE_INSTALL_PREFIX=/usr cmake --preset=release-linux
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe --tags | sed -e 's/-/./g' -e 's/^v//g'
}

build() {
  cd ${srcdir}/${_pkgname}
  CMAKE_INSTALL_PREFIX=/usr cmake --build --preset=release-linux

  # Add current commit info to the README
  sed -i "s|%GIT_COMMIT%|$(git rev-parse main)|" "${srcdir}/${_pkgname}/docs/README.template"
  sed -i "s|%GIT_BRANCH%|main|" "${srcdir}/${_pkgname}/docs/README.template"
  sed -i "s|%GITHUB_REPO%|${_pkgname}/${_pkgname}|" "${srcdir}/${_pkgname}/docs/README.template"
}

package() {
  # install all files
  cd ${srcdir}/${_pkgname}
  CMAKE_INSTALL_PREFIX=/usr DESTDIR="${pkgdir}" cmake --install build/release-linux

  # dosbox-staging documents
  install -Dm 644 "${srcdir}/${_pkgname}/docs/README.template" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm 644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/manual.txt"
  mv "${pkgdir}/usr/share/${_pkgname}/resources/"* "${pkgdir}/usr/share/${_pkgname}/"
  rmdir "${pkgdir}/usr/share/${_pkgname}/resources"
  }
