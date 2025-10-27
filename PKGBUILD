# Maintainer: Hadi Chokr <hadichokr@icoud.com>
_pkgname=binfetch
pkgname=binfetch-git
pkgver=0.1.r23.g0acd7be
pkgrel=2
pkgdesc="Neofetch inspired utility for binaries."
arch=(x86_64 aarch64)
license=('CC0')
depends=('confuse' 'libelf' 'zlib')
makedepends=('meson' 'ninja')
source=("${_pkgname}::git+https://github.com/Nik-Nothing/binfetch.git")
conflicts=("${_pkgname}")
provides=("${_pkgname}")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$_pkgname"
  meson setup build -Dc_args="-DPREFIX='\"/usr\"'"
  ninja -C build
}

package() {
  cd "$_pkgname"

  # Install the binary
  install -Dm755 build/binfetch "$pkgdir/usr/bin/binfetch"

  # Install global default config
  install -Dm644 cfg/binfetch.cfg "$pkgdir/usr/share/binfetch/binfetch.cfg"
}
