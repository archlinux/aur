# Maintainer: Malcolm Mallardi <mdmallardi at gmail dot com>
# Contributor: Wouter Wijsman <wwijsman at live dot nl>

pkgname=dosbox-staging-git
_pkgname=dosbox-staging
pkgver=0.82.0.alpha
pkgrel=1
pkgdesc="A modernized DOSBox project using current development practices and tools, fixing issues, adding features that better support today's systems"
arch=('any')
url="https://github.com/dosbox-staging/dosbox-staging"
license=('GPL2')
depends=('sdl2' 'sdl2_net' 'opusfile' 'libslirp' 'alsa-lib' 'iir1' 'fluidsynth' 'munt' 'libpng' 'zlib-ng')
makedepends=('meson' 'gcc' 'gzip')
provides=("dosbox")
conflicts=("dosbox")
source=(
  "git+https://github.com/dosbox-staging/${_pkgname}.git"
)
md5sums=(
  'SKIP'
)

prepare() {
  cd "${srcdir}/${_pkgname}"
  meson setup --prefix=/usr build
}

pkgver() {
  cd "${srcdir}/${_pkgname}"
  git describe | sed -e 's/-/./g' -e 's/^v//g'
}

build() {
  cd "${srcdir}/${_pkgname}"
  meson compile -C build

  # Add current commit info to the README
  sed -i "s|%GIT_COMMIT%|$(git rev-parse main)|" docs/README.template
  sed -i "s|%GIT_BRANCH%|main|" docs/README.template
  sed -i "s|%GITHUB_REPO%|dreamer/dosbox-staging|" docs/README.template
}

package() {
  # install all files
  cd "${srcdir}/${_pkgname}"
  meson install -C build --destdir "${pkgdir}"

  # dosbox-staging documents
  install -Dm 644 "${srcdir}/${_pkgname}/docs/README.template" "${pkgdir}/usr/share/doc/${_pkgname}/README"
  install -Dm 644 "${srcdir}/${_pkgname}/docs/README.video" "${pkgdir}/usr/share/doc/${_pkgname}/video.txt"
  install -Dm 644 "${srcdir}/${_pkgname}/README" "${pkgdir}/usr/share/doc/${_pkgname}/manual.txt"
  }
