# Maintainer: Zoey Bauer <zoey.erin.bauer@gmail.com>

pkgname=shelly-cli
pkgbase=shelly-cli
pkgver=3.0.0.0.r3380.g2065d5c
pkgrel=1
pkgdesc='Native Shelly package-manager CLI beta'
arch=('x86_64')
url='https://github.com/Seafoam-Labs/Shelly-ALPM'
license=('GPL-3.0-only')
provides=('shelly-beta')
depends=(
  'diffutils'
  'flatpak'
  'git'
  'glibc'
  'glib2'
  'libarchive'
  'pacman'
  'sudo'
)
makedepends=(
  'git'
  'pkgconf'
  'zig>=0.16.0'
)
optdepends=(
  'base-devel: build and install AUR packages'
  'devtools: build AUR packages in a clean chroot'
  'desktop-file-utils: update AppImage desktop entries'
  'fuse2: run AppImages that require FUSE 2'
  'gtk-update-icon-cache: update AppImage icons'
  'opendoas: alternative privilege elevator to sudo'
  'plocate: locate-based pacfile discovery'
  'vim: default visual pacfile diff viewer'
)
source=("${pkgname}::git+https://github.com/Seafoam-Labs/Shelly-ALPM.git#branch=development")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"

  printf '3.0.0.0.r%s.g%s' \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}/Shelly.Cli.Zig"

  zig build \
    --prefix "${srcdir}/zig-out" \
    -Dcpu=baseline \
    -Doptimize=ReleaseSmall
}

package() {
  cd "${srcdir}/${pkgname}"

  install -Dm755 "${srcdir}/zig-out/bin/shelly" \
    "${pkgdir}/usr/bin/shelly-beta"
  install -Dm644 LICENSE \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
