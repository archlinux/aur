# Maintainer: ALTER Identity <dev@truealter.com>
#
# AUR package for the @truealter/cli npm release.
#
# Publish flow (post-publish):
#   1. Compute the SHA256 of the tarball:
#        curl -fsSL https://registry.npmjs.org/@truealter/cli/-/cli-${pkgver}.tgz \
#          | sha256sum
#   2. Replace sha256sums=('SKIP') with the real digest.
#   3. makepkg --printsrcinfo > .SRCINFO
#   4. git add PKGBUILD .SRCINFO && git commit && git push
#
# Push target requires an AUR account and an uploaded SSH public key;
# see https://aur.archlinux.org/account. Not configured on desk yet --
# this PKGBUILD lives in the alter-cli repo as a staging area until
# the AUR credential is in place.

pkgname=truealter-cli
_npmname='@truealter/cli'
pkgver=0.7.1
pkgrel=1
pkgdesc='ALTER identity CLI -- login once, authenticated everywhere'
arch=('any')
url='https://truealter.com'
license=('Apache-2.0')
depends=('nodejs>=20')
makedepends=('npm')
source=("https://registry.npmjs.org/${_npmname}/-/cli-${pkgver}.tgz")
noextract=("cli-${pkgver}.tgz")
# sha256 pinned to published 0.7.1 tarball.
# Recompute on every pkgver bump:
#   curl -fsSL https://registry.npmjs.org/@truealter/cli/-/cli-${pkgver}.tgz \
#     -o cli-${pkgver}.tgz && sha256sum cli-${pkgver}.tgz
# CI rejects 'SKIP' values via .github/workflows/ci.yml.
# NOTE: /boogie-time §1.3 still gates Phase A on major version >= 1.0.0;
# this PKGBUILD tracks the latest public minor for keep-pace hygiene
# and will move to v1.0.0 in the launch-trigger PR.
sha256sums=('8cc503e43d8f88493cbb27a8da41261b8084c2b14cdc44a8127b37a32b966229') # pragma: allowlist secret

package() {
  cd "${srcdir}"
  npm install -g --prefix "${pkgdir}/usr" "./cli-${pkgver}.tgz"

  # Strip $srcdir references that npm bakes into generated package.json files.
  find "${pkgdir}/usr" -type f -name 'package.json' \
    -exec sed -i "s|${srcdir}|/tmp|g" {} \;

  # Fix permissions -- npm's default umask leaves directories 700.
  chmod -R u=rwX,go=rX "${pkgdir}"
  chmod 755 "${pkgdir}/usr/bin/alter"
}
