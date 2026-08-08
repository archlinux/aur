# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.18.0
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
b2sums=('b6285206e2fe362505849b41db6fd98143fad23ce52c24b3a27ee7a66c0c18f4bd71974575770527736cc65b443898407d0f66a8c983dcc7ae375a91d6dbf40d')

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
