# Maintainer: Jon Kinney
#
# Source of truth for the AUR `tensaku-bin` package — prebuilt binaries
# from the GitHub Release. release.yml runs `make ARCH=<arch> package`
# on both x86_64 (inside the gtk4-rs Fedora container) and aarch64
# (on a native arm runner, with gtk4-layer-shell built from source),
# producing tarballs with a /usr-style layout inside (bin/, share/
# applications, etc.). aur-publish.yml copies this file, pins
# pkgver/pkgrel, refreshes per-arch sha256sums with updpkgsums,
# regenerates .SRCINFO, and pushes.
pkgname=tensaku-bin
_pkgname=tensaku
pkgver=0.28.0
pkgrel=1
pkgdesc='Modern screenshot annotation tool for Wayland (prebuilt binary)'
arch=('x86_64' 'aarch64')
url='https://github.com/jondkinney/tensaku'
license=('MPL-2.0')
depends=('gtk4' 'gtk4-layer-shell' 'libadwaita' 'libepoxy' 'fontconfig')
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname" "$_pkgname-git")
source_x86_64=("$_pkgname-v$pkgver-x86_64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-x86_64.tar.gz")
source_aarch64=("$_pkgname-v$pkgver-aarch64.tar.gz::https://github.com/jondkinney/$_pkgname/releases/download/v$pkgver/$_pkgname-v$pkgver-aarch64.tar.gz")
# Placeholders — CI's updpkgsums overwrites with real per-arch hashes per release.
sha256sums_x86_64=('6c45fc306112d590c2be6265d563e7d657e2a6dc85dbc3930a5d8d1c7b39cc5d')
sha256sums_aarch64=('279ab3ac416ed4d1aca31aa6f663c1f4af667d9f88dc9ebde987bc6cdf4764e8')

package() {
  # `make package` tarballs the install-staged tree, so we just need
  # to drop bin/ and share/ under /usr.
  install -d "$pkgdir/usr"
  cp -a "$srcdir/bin" "$srcdir/share" "$pkgdir/usr/"
  # The Makefile's install target writes licenses under share/licenses/
  # tensaku/; rename to match this package's name so makepkg's
  # license-check picks them up.
  mv "$pkgdir/usr/share/licenses/$_pkgname" "$pkgdir/usr/share/licenses/$pkgname"
}
