# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.15.3
pkgrel=0
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
b2sums=('e538b6a8ece559f20f3eebc0c562a28c148b43cc4791c73a53109bf25af6d3d0180e065f2316e870de12ff65072b62db06f63612fb3078d963d6c50b64e5d16e')

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

  bun test ./src ./packages ./scripts ./test/cli ./test/session
}

package() {
  cd "${pkgname}"

  install -vD -t "${pkgdir}/usr/hunkdiff/" -m755 dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" -sr "${pkgdir}/usr/lib/hunkdiff/hunk"
  install -vD -t "${pkgdir}/usr/hunkdiff/skills/hunk-review/" -m644 skills/hunk-review/SKILL.md

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
