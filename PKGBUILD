# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.21.0_beta.1
pkgrel=1
url='https://www.hunk.dev/'
changelog=CHANGELOG.md
arch=(aarch64 x86_64)
license=('MIT')
checkdepends=('git')
makedepends=('bun')
depends=('glibc' 'icu')
provides=('hunkdiff')
options=(!strip !debug)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/modem-dev/hunk/archive/refs/tags/v${pkgver/_/-}.tar.gz")
b2sums=('b5098c34369a0eb3f32afb8593d8fa76d91f1c594ef36849eb6bb72bf997886eba35edadd65d9c9746a868f22a40253c93cf229446ff76c7b2804a87497c61bb')

_install_dir=/urs/lib/hunkdiff
_skills=(review extensions)

prepare() {
  cd "${pkgname}-${pkgver/_/-}"

  bun install \
    --production \
    --frozen-lockfile \
    --ignore-scripts
}

build() {
  cd "${pkgname}-${pkgver/_/-}"

  export HUNK_INSTALL_DIR="${_install_dir}"
  export HUNK_INSTALL_SOURCE=pacman
  bun build \
    --production \
    --compile \
    --target bun \
    --format esm \
    --outfile dist/hunk \
    --sourcemap \
    --bytecode \
    --minify \
    --no-compile-autoload-bunfig \
    --env 'HUNK_INSTALL_*' \
    src/main.tsx \
    src/highlightWorkerEntry.ts
}

check() {
  cd "${pkgname}-${pkgver/_/-}"

  export HUNK_RUN_TTY_SMOKE=1
  export HUNK_TEST_EXECUTABLE=dist/hunk
  bun test ./test/smoke

  # based on https://github.com/modem-dev/hunk/blob/v0.17.7/scripts/smoke-prebuilt-install.ts
  local help version skill skillPath

  echo -n 'HELP = '
  help=$(dist/hunk --help)
  grep -F 'Usage: hunk' <<< "${help}"

  echo -n 'VERSION = '
  version=$(dist/hunk --version)
  grep -F "${pkgver/_/-}" <<< "${version}"

  for skill in "${_skills[@]}"; do
    echo -n 'SKILL = '
    skillPath=$(dist/hunk skill path "${skill}")
    grep -E 'skills/hunk-.*/SKILL\.md$' <<< "${skillPath}"
  done
}

package() {
  cd "${pkgname}-${pkgver/_/-}"

  local hunk_install_dir="${pkgdir}${_hunk_install_dir}"

  install -vD -t "${hunk_install_dir}/" -m755 dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" -sr "${hunk_install_dir}/hunk"

  local skill
  for skill in "${_skills[@]}"; do
    install -vD -t "${hunk_install_dir}/skills/hunk-${skill}/" \
      -m644 "skills/hunk-${skill}/SKILL.md"
  done

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
