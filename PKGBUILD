# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.19.0
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
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/modem-dev/hunk/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('8e3c060372eceb1cfecad683a4eaffec8f5a8301f756fd281ee2e878a890e989988016f5b10571b99178cd3bab2bf770e086e3f653223236091d0f6d31c11e2c')

prepare() {
  cd "${pkgname}-${pkgver}"

  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "${pkgname}-${pkgver}"

  bun build \
    --compile src/main.tsx src/highlightWorkerEntry.ts \
    --no-compile-autoload-bunfig \
    --outfile dist/hunk
}

check() {
  cd "${pkgname}-${pkgver}"

  export HUNK_RUN_TTY_SMOKE=1
  export HUNK_TEST_EXECUTABLE=dist/hunk
  bun test ./test/smoke

  # based on https://github.com/modem-dev/hunk/blob/main/scripts/smoke-prebuilt-install.ts
  local help version skill skillPath

  echo -n 'HELP = '
  help=$(dist/hunk --help)
  grep -F 'Usage: hunk' <<< "${help}"

  echo -n 'VERSION = '
  version=$(dist/hunk --version)
  grep -F "${pkgver}" <<< "${version}"

  for skill in review extensions; do
    echo -n 'SKILL = '
    skillPath=$(dist/hunk skill path "${skill}")
    grep -E 'skills/hunk-.*/SKILL\.md$' <<< "${skillPath}"
  done
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vD -t "${pkgdir}/usr/lib/hunkdiff/" \
    -m755 dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" \
    -sr "${pkgdir}/usr/lib/hunkdiff/hunk"

  install -vD -t "${pkgdir}/usr/lib/hunkdiff/skills/hunk-review/" \
    -m644 skills/hunk-review/SKILL.md
  install -vD -t "${pkgdir}/usr/lib/hunkdiff/skills/hunk-extensions/" \
    -m644 skills/hunk-extensions/SKILL.md

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" \
    -m644 LICENSE
}
