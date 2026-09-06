# Maintainer: cosct
#
# AUR binary package (pdf-compressor-bin): installs the .pkg.tar.zst published
# on GitHub Releases — no Rust/Node toolchain needed at install time. The zst
# is produced by the release workflow via scripts/build-arch-bundle.sh, the
# same makepkg pipeline as a local `pnpm run tauri:arch`, so this package
# cannot drift from the deb/appimage bundles.
#
# The release workflow fills in pkgver + sha256sums from the tagged release
# and pushes this file (with a regenerated .SRCINFO) to the AUR.

pkgname=pdf-compressor-bin
pkgver=0.7.1
pkgrel=1
pkgdesc='Local-first desktop PDF compressor built with Vue, Tauri, and Rust (GUI + headless CLI)'
arch=('x86_64')
url='https://github.com/cosct/pdf-compressor'
license=('MIT')
depends=(
  'gtk3'
  'webkit2gtk-4.1'
  'hicolor-icon-theme'
)
optdepends=(
  'libnotify: desktop notifications for the right-click quick-compress mode'
)
makedepends=('libarchive')
provides=('pdf-compressor')
conflicts=('pdf-compressor')
# Prebuilt binaries ship stripped already; install them byte-identical.
options=(!strip)
source=("${pkgname}-${pkgver}.zst::${url}/releases/download/v${pkgver}/pdf-compressor_${pkgver}_amd64.pkg.tar.zst")
# Filled in by the release workflow with the sha256 of the released zst.
sha256sums=('cac950bac11e0f07506948a72e7631b6b79ae716d052c421f899d00171a0ec7e')

# The zst is a plain tar — makepkg auto-extracts its contents (usr/, .PKGINFO,
# .MTREE, .BUILDINFO) into srcdir.
package() {
  cd "${srcdir}"
  rm -f .PKGINFO .MTREE .BUILDINFO
  cp -a usr "${pkgdir}/"
}
