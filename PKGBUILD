# Maintainer: marmis <tiagodepalves@gmail.com>
# Contributor: "marmis" Tiago de Paula <tiagodepalves@gmail.com>

pkgname=hunk
pkgdesc='Terminal diffs for humans and agents'
pkgver=0.16.0
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
b2sums=('2e882e6b69e024d05133b6ff41a93a7a74284cf25f080edf82a42a2fd296b068f7d8d5084e0a701bc6ae61a8463ea529e76de43dd48d3ac415a07280548450e8')

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
