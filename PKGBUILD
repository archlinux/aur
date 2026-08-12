# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.18.1
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
b2sums=('56874808462f4bdb2b6d02cf9160c284b7b4d0badba25f8e9058fed1f32494a1d96090245f4f50eddf1a55f0ea0323cc2f5395d2936dbbd4776a194cb2265980')

prepare() {
  cd "${pkgname}-${pkgver}"

  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "${pkgname}-${pkgver}"

  bun run ./scripts/build-bin.ts
}

check() {
  cd "${pkgname}-${pkgver}"

  export HUNK_RUN_TTY_SMOKE=1
  export HUNK_TEST_EXECUTABLE=dist/hunk
  bun test ./test/smoke

  # based on https://github.com/modem-dev/hunk/blob/main/scripts/smoke-prebuilt-install.ts
  local help version skillPath

  echo -n 'HELP = '
  help=$(dist/hunk --help)
  grep -F 'Usage: hunk' <<< "${help}"

  echo -n 'VERSION = '
  version=$(dist/hunk --version)
  grep -F "${pkgver}" <<< "${version}"

  echo -n 'SKILL = '
  skillPath=$(dist/hunk skill path)
  grep -E 'skills/hunk-review/SKILL\.md$' <<< "${skillPath}"
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vD -t "${pkgdir}/usr/lib/hunkdiff/" -m755 dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" -sr "${pkgdir}/usr/lib/hunkdiff/hunk"
  find skills/ -type f -not -name '.*' -exec \
    install -vD -m644 {} -T "${pkgdir}/usr/lib/hunkdiff/{}" \;

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
