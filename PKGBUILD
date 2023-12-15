# Maintainer: Michael Picht <mipi@fsfe.org>
pkgdesc="Some GNOME shell extension incl. configuration packaged to provide a tiling WM experience"
pkgname="pixie"
pkgver=0.0.6
pkgrel=6
arch=(
  x86_64
  aarch64
)
license=(GPL3)
source=(
  "https://gitlab.com/pixie-desktop/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
  dconf
  setup
)
sha256sums=('606275c22dec6147e15e34caf252ac6dd5b02d2ec9a1369a3427bb592215b231'
            '9c9b79c7a5cab55fb42b9b0856f89a70396bebec15cf51073059dcb0b568a499'
            'fc915c47b51e0ccf946a74150f029d06da57371f3fe7c74f46a57b01f83dc2ec')
options=(emptydirs)
install=pixie.install
validpgpkeys=(11ECD6695134183B3E7AF1C2223AAA374A1D59CE) # Michael Picht <mipi@fsfe.org>
makedepends=(
  bash
  git
  make 
)

optdepends=(
  "gnome-terminal: used in the default configuration of Arch update"
)

# GNOME stuff that the Pixie configuration depends upon
depends+=(gnome-shell)

# GNOME extensions
depends+=(
  gnome-shell-extension-arch-update
  gnome-shell-extension-blur-my-shell
  gnome-shell-extension-forge
  gnome-shell-extension-hibernate-status-git
  gnome-shell-extension-just-perfection-desktop
  gnome-shell-extension-top-bar-organizer
  gnome-shell-extension-vitals
)

package() {
  # GNOME configuration
  install -Dm0644 dconf "${pkgdir}"/etc/dconf/db/local.d/90_arch
  
  # Copy Arch-Linux-specific setup script to destination
  install -Dm0755 setup "${pkgdir}"/etc/pixie/setup-archlinux
    
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
