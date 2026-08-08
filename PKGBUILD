# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.17.7
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
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/modem-dev/hunk/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('aa04a4b78c59a295a9a38abefd3ac4cf8e008f45033cafe19de2dc752d201f4511bc657b0313cef6c54afdbd5c985c9f3f7963717a8fc7023d7afafb9e2b10db')

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
  grep -oF 'Usage: hunk' <<< "${help}"

  echo -n 'VERSION = '
  version=$(dist/hunk --version)
  grep -oF "${pkgver}" <<< "${version}"

  echo -n 'SKILL = '
  skillPath=$(dist/hunk skill path)
  grep -oE 'skills/hunk-review/SKILL\.md$' <<< "${skillPath}"
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
