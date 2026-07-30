# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.14.1
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
b2sums=('66470ab8679fcef3868845ad43e53d039c2dfb8ccbe42c5dda0030a9bc2d3c230eda070dedf1a8493a04069238154a93e51177ef6d62d6a078f802c8d8faef75')

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
