# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.22.0_beta.1
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
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/modem-dev/hunk/archive/refs/tags/v${pkgver/_/-}.tar.gz"
        'hunk-embed-envs.patch')
b2sums=('1d9a6b505abb24c1120e8a438f46d8956f90fc87a8eff7d3a9b99a0f88e449c8f40ced9d6949409807b63190c53a3e3288020f077d1ff85e2d4dc92b37b45f8f'
        '019c586f88e91dc67d37962142e425f6f5021826e70a02030ac8f212dc2a12006f001ccae658aa9eb937cbccc064ea804e29279d8645e96f15565ca17b2b4ce0')

_install_dir=/usr/lib/hunkdiff
_skills=(review extensions)

prepare() {
  cd "${pkgname}-${pkgver/_/-}"

  patch -t -Np1 -i ../hunk-embed-envs.patch

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
    --outfile packages/hunk/dist/hunk \
    --sourcemap \
    --bytecode \
    --minify \
    --no-compile-autoload-bunfig \
    --env 'HUNK_INSTALL_*' \
    packages/hunk/src/main.tsx \
    packages/hunk/src/highlightWorkerEntry.ts
}

check() {
  cd "${pkgname}-${pkgver/_/-}"

  export HUNK_RUN_TTY_SMOKE=1
  export HUNK_TEST_EXECUTABLE=packages/hunk/dist/hunk
  bun test ./test/smoke

  # based on https://github.com/modem-dev/hunk/blob/v0.17.7/scripts/smoke-prebuilt-install.ts
  local help version skill skillPath update

  echo -n 'HELP = '
  help=$("${HUNK_TEST_EXECUTABLE}" --help)
  grep -F 'Usage: hunk' <<< "${help}"

  echo -n 'VERSION = '
  version=$("${HUNK_TEST_EXECUTABLE}" --version)
  grep -F "${pkgver/_/-}" <<< "${version}"

  for skill in "${_skills[@]}"; do
    echo -n 'SKILL = '
    skillPath=$("${HUNK_TEST_EXECUTABLE}" skill path "${skill}")
    grep -E 'skills/hunk-.*/SKILL\.md$' <<< "${skillPath}"
  done

  echo -n 'UPDATE = '
  update=$("${HUNK_TEST_EXECUTABLE}" update || true)
  grep -F pacman <<< "${update}"
}

package() {
  cd "${pkgname}-${pkgver/_/-}"

  local hunk_install_dir="${pkgdir}${_install_dir}"

  install -vD -t "${hunk_install_dir}/" -m755 packages/hunk/dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" -sr "${hunk_install_dir}/hunk"

  local skill
  for skill in "${_skills[@]}"; do
    install -vD -t "${hunk_install_dir}/skills/hunk-${skill}/" \
      -m644 "packages/hunk/skills/hunk-${skill}/SKILL.md"
  done

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
