# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.21.0
pkgrel=2
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
b2sums=('600fc6114b677e6e854cf1190f987240a93e62d8d1b8cf83a4b044da51bb7cedc2b1a980fea1cc9fbf5b06bfbe9b3fbcb3f866418a7c9788a268d8f5b226d774'
        '394ad2625af19b834d618b5987b30715fb30d9f5bf8d690f8e22e3186dc8eb6b7e863d65dc3f08d8e900777e93809575790aa33fb9571d2eacdcf1503169da1d')

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
  local help version skill skillPath update

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

  echo -n 'UPDATE = '
  update=$(dist/hunk update || true)
  grep -E pacman <<< "${update}"
}

package() {
  cd "${pkgname}-${pkgver/_/-}"

  local hunk_install_dir="${pkgdir}${_install_dir}"

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
