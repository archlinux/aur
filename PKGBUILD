# Maintainer: Malcolm Mallardi <mdmallardi at gmail dot com>
# Contributor: Wouter Wijsman <wwijsman at live dot nl>

pkgname=dosbox-staging-git
_pkgname=dosbox-staging
pkgver=0.82.0.alpha.3568.g56f682e59
pkgrel=1
pkgdesc="A modernized DOSBox project using current development practices and tools, fixing issues, adding features that better support today's systems"
arch=('any')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL2')
depends=('sdl2-compat' 'sdl2_net' 'sdl2_image' 'opusfile' 'libslirp' 'alsa-lib' 'iir1' 'speexdsp' 'fluidsynth' 'munt' 'libpng' 'zlib-ng' 'libglvnd')
makedepends=('meson' 'ninja' 'cmake')
provides=("dosbox" "dosbox-staging")
conflicts=("${provides[@]}")
source=(
  "git+https://github.com/dosbox-staging/${_pkgname}.git"
)
md5sums=(
  'SKIP'
)

prepare() {
  mkdir -p "${srcdir}/${_pkgname}/resources/shaders/misc"
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe | sed -e 's/-/./g' -e 's/^v//g'
}

build() {
  arch-meson build "${_pkgname}"

  # Add current commit info to the README
  sed -i "s|%GIT_COMMIT%|$(git rev-parse main)|" "${srcdir}/${_pkgname}/docs/README.template"
  sed -i "s|%GIT_BRANCH%|main|" "${srcdir}/${_pkgname}/docs/README.template"
  sed -i "s|%GITHUB_REPO%|${_pkgname}/${_pkgname}|" "${srcdir}/${_pkgname}/docs/README.template"
}

package() {
  # install all files
  meson install -C build --destdir "${pkgdir}" --skip-subprojects libpng

  # dosbox-staging documents
  install -Dm 644 "${srcdir}/${_pkgname}/docs/README.template" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm 644 "${srcdir}/${_pkgname}/docs/README.video" "${pkgdir}/usr/share/doc/${_pkgname}/video.txt"
  install -Dm 644 "${srcdir}/${_pkgname}/README.md" "${pkgdir}/usr/share/doc/${_pkgname}/manual.txt"
  }
