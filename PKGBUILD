# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.9.5
pkgrel=0
url='https://www.hunk.dev/'
changelog=${pkgname}.changelog
arch=(aarch64 x86_64)
license=('MIT')
checkdepends=('git')
makedepends=('bun')
depends=('glibc' 'icu')
provides=('hunkdiff')
options=(!strip !debug)
source=("${pkgname}-v${pkgver}.tar.gz::https://github.com/modem-dev/hunk/archive/refs/tags/v${pkgver}.tar.gz")
b2sums=('510b1727735bcd34a4f9ffcc4336b67622646d4cdb2f683933aec4e236b88b0d6840193caf4069aebe90272dc35eefcd8a63f6bb96b9210b5f513dc4fdcece3d')

prepare() {
  cd "${pkgname}-${pkgver}"

  bun install --frozen-lockfile --ignore-scripts
}

build() {
  cd "${pkgname}-${pkgver}"

  bash scripts/build-bin.sh
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
