# Maintainer: Vladyslav Aviedov <aur at vladaviedov dot org>
# Contributor: Levente Polyak <anthraxx[at]archlinux[dot]org>
# Contributor: Christian Heusel <gromit@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>

_orig_pkgname=devtools
pkgname=devtools-doas
epoch=1
pkgver=1.5.2
pkgrel=1
pkgdesc='Tools for Arch Linux package maintainers (patched for opendoas)'
arch=('any')
license=('GPL-3.0-or-later')
url='https://gitlab.archlinux.org/archlinux/devtools'
depends=(
  arch-install-scripts
  awk
  bash
  binutils
  coreutils
  curl
  diffutils
  expac
  fakeroot
  findutils
  glow
  grep
  gum
  jq
  openssh
  parallel
  reuse
  rsync
  sed
  util-linux
  opendoas
  breezy
  git
  mercurial
  subversion
)
makedepends=(
  asciidoctor
)
checkdepends=(
  bats
)
provides=('devtools')
conflicts=('devtools')
optdepends=(
  'btrfs-progs: btrfs support'
  'bat: pretty printing for pkgctl search'
  'nvchecker: pkgctl version subcommand'
)
source=(
  https://gitlab.archlinux.org/archlinux/devtools/-/releases/v${pkgver}/downloads/devtools-${pkgver}.tar.gz{,.sig}
  doas.patch
)
# Import a key from the main devtools package
# https://gitlab.archlinux.org/archlinux/packaging/packages/devtools/-/tree/main/keys/pgp
validpgpkeys=(
  'E240B57E2C4630BA768E2F26FC1B547C8D8172C8' # Levente Polyak <anthraxx@archlinux.org>
  'F00B96D15228013FFC9C9D0393B11DAA4C197E3D' # Christian Heusel (gromit packager key) <gromit@archlinux.org>
)
sha256sums=('be0d739c9c8c76fc3242eb48f4812d308f37b560751380486616210e42514cc5'
            'SKIP'
            'SKIP')
b2sums=('58a1cc3eeaef0cacef7bb56019a58469d67f430547b31216ea520154ddf79a02a194b931dac4429042571414a166b5fea59715fac61618714f596db060d683d2'
        'SKIP'
        'SKIP')
install=devtools.install

build() {
  mv ${_orig_pkgname}-${pkgver} ${pkgname}-${pkgver}
  cd ${pkgname}-${pkgver}
  patch -Np1 -i ../doas.patch
  make BUILDTOOLVER="${epoch}:${pkgver}-${pkgrel}-${arch}" PREFIX=/usr
}

check() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr test
}

package() {
  cd ${pkgname}-${pkgver}
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
