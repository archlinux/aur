# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.12.1
pkgrel=0
url='https://www.hunk.dev/'
changelog=${pkgname}.changelog
arch=(aarch64 x86_64)
license=('MIT')
checkdepends=('git' 'jujutsu' 'nodejs')
makedepends=('bun')
depends=('glibc' 'icu')
provides=('hunkdiff')
options=(!strip !debug)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/modem-dev/hunk/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('7816a1a15c939dd533f0bfb2a15b249e6c34ae177348ab4cff8b1758e3217776fc4fcf2ade79202a71f55a5cd1bc1ecba90181ef2ba9af231d78ad73eb8491ab')

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

  bun test
}

package() {
  cd "${pkgname}-${pkgver}"

  install -vD -t "${pkgdir}/usr/hunkdiff/" -m755 dist/hunk
  install -vd "${pkgdir}/usr/bin"
  ln -v -ft "${pkgdir}/usr/bin/" -sr "${pkgdir}/usr/lib/hunkdiff/hunk"
  install -vD -t "${pkgdir}/usr/hunkdiff/skills/hunk-review/" -m644 skills/hunk-review/SKILL.md

  install -vD -t "${pkgdir}/usr/share/licenses/${pkgname}/" -m644 LICENSE
}
