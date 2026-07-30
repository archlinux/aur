# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.17.7
pkgrel=2
url='https://www.hunk.dev/'
changelog=${pkgname}.changelog
arch=(aarch64 x86_64)
license=('MIT')
checkdepends=('jujutsu' 'nodejs')
makedepends=('bun' 'git')
depends=('glibc' 'icu')
provides=('hunkdiff')
options=(!strip !debug)
source=("${pkgname}::git+https://github.com/modem-dev/hunk.git#tag=v${pkgver}")
b2sums=('12e9a9884ecf112e5a4326c9cdae3f7d4e7b5b1c32522f8b5d307dcf704ef5fc6861b5a4c74ab67577e0bca2eaf533b0a82d6e9518784cfff231977f8755c04d')

prepare() {
  cd "${pkgname}"

  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "${pkgname}"

  bun run ./scripts/build-bin.ts
}

check() {
  cd "${pkgname}"

  export HUNK_TEST_EXECUTABLE=dist/hunk
  bun test
}

package() {
  cd "${pkgname}"

  install -vD -t "${pkgdir}/usr/lib/hunkdiff/" -m755 dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" -sr "${pkgdir}/usr/lib/hunkdiff/hunk"
  install -vD -t "${pkgdir}/usr/lib/hunkdiff/skills/hunk-review/" -m644 skills/hunk-review/SKILL.md

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
