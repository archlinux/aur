# Maintainer: MadGoat <ghazlett@gmail.com>
# Distro-agnostic rebrand of the upstream scx-manager (GPL-3.0-or-later).
# Upstream copyright/provenance retained in source headers.
#
# Build generator: CMake default (Makefiles). Ninja is not a makedep here so
# the package builds on base-devel as-is; if you prefer Ninja, add `ninja` to
# makedepends and pass -G Ninja to the cmake configure line below.

pkgname=scx-manager
pkgver=1.17.0
pkgrel=1
pkgdesc="Distro-agnostic GUI manager for sched-ext (SCX) schedulers"
arch=(x86_64)
url="https://github.com/MadGoatHaz/scx-manager"
license=(GPL-3.0-or-later)
depends=(qt6-base polkit scx-tools)
conflicts=(scx-manager-git scx-manager-bin)
# Note: 'cargo' is provided by the 'rust' package on Arch (rust Provides: cargo),
# so it is not listed separately. Corrosion + CPM are fetched at configure time
# (git is required for CPM's GitHub fetches).
makedepends=(cmake git qt6-tools rust)
# 'sched-ext-kernel' is a virtual marker (no such package exists); it documents
# that a kernel with CONFIG_SCHED_EXT enabled is required to run sched-ext schedulers.
# ('scx-scheds' dropped from optdepends: the scx-tools dependency already pulls it in.)
optdepends=('sched-ext-kernel: kernel with CONFIG_SCHED_EXT enabled (required to run sched-ext schedulers)')
source=("https://github.com/MadGoatHaz/scx-manager/releases/download/v1.17.0/scx-manager-1.17.0.tar.gz")
sha256sums=('08d28065a66fd9366bbeafaa1f685c13e51bb5bf5850d72d736279776dfb91a6')

build() {
  # Fat LTO objects so makepkg can strip static archives; see
  # https://archlinux.org/todo/lto-fat-objects/
  CFLAGS+=" -ffat-lto-objects"
  CXXFLAGS+=" -ffat-lto-objects"
  # Makefiles generator (default). Alternative: -G Ninja (needs ninja makedep).
  cd "$srcdir/$pkgname-$pkgver"
  cmake -S . -B build -DCMAKE_BUILD_TYPE=Release
  cmake --build build
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  cmake --install build --prefix "$pkgdir/usr"
  # Per Arch guidelines, ship the license:
  if [ -f LICENSE ]; then
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  fi
}
