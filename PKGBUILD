# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: Mattia Borda <mattiagiovanni.borda@icloud.com>
# Contributor: Evan Bush (PencilShavings) <eb.pencilshavings@protonmail.com>

pkgname=quickemu-git
pkgver=4.9.7.r58.g78b938f
pkgrel=1
pkgdesc="Quickly create and run optimised Windows, macOS and Linux desktop virtual machines"
arch=(any)
url="https://github.com/quickemu-project/quickemu"
license=(MIT)
depends=(qemu-desktop
         bash
         coreutils
         curl
         edk2-ovmf
         gawk
         grep
         mesa-utils # glxinfo
         jq
         pciutils
         procps
         python
         cdrtools # mkisofs
         usbutils
         util-linux
         sed
         socat
         spice-gtk # spicy
         swtpm
         xdg-user-dirs
         xorg-xrandr # xrandr
         zsync
         unzip)
makedepends=(git)
optdepends=('quickgui: graphical user interface')
provides=(quickemu)
conflicts=(quickemu)
source=("git+$url.git")
b2sums=('SKIP')

pkgver() {
  cd "quickemu"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

package() {
  cd "quickemu"
  install -Dm644 LICENSE -t "${pkgdir}/usr/share/licenses/${pkgname}"

  cd docs
  # remove pandoc invocation, manpages are already in repo. Reported by some users
  sed -i '/include pandoc-man.mk/d' Makefile

  # -j1 avoid a race condition reported and confirmed on 2025-02-10
  make -j1 PREFIX=/usr DESTDIR="${pkgdir}" install
}
