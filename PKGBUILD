# Maintainer: Michael Picht <mipi@fsfe.org>
pkgdesc="GNOME with tiling windows"
_pkgorg="pixie-desktop"
pkgname="pixie"
pkgver=0.0.6
pkgrel=4
arch=(
  x86_64
  aarch64
)
license=(GPL3)
source=(
  "https://gitlab.com/${_pkgorg}/${pkgname}/-/archive/v${pkgver}/${pkgname}-v${pkgver}.tar.gz"
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

# Linux, base package and stuff that was formerly part of the base group
depends=(base linux-firmware logrotate man-db man-pages nano pacman-contrib s-nail usbutils)
# Other basic stuff
depends+=(gnupg seahorse udisks2)
# Networking
depends+=(avahi networkmanager)
# GNOME (the complete group). Each package must be listed explicitly since it is
# not possible to add a group as dependency in PKGBUILD. Compared to the
# (standard) GNOME package group the following changes were made:
# - gnome-terminal instead of gnome-console
# - rhythmbox instead of gnome-music
depends+=(baobab cheese epiphany evince gdm gnome-backgrounds gnome-calculator gnome-calendar gnome-characters gnome-clocks gnome-color-manager gnome-connections gnome-contacts gnome-control-center gnome-disk-utility gnome-font-viewer gnome-keyring gnome-logs gnome-maps gnome-menus gnome-photos gnome-remote-desktop gnome-session gnome-settings-daemon gnome-shell gnome-shell-extensions gnome-software gnome-system-monitor gnome-terminal gnome-text-editor gnome-user-docs gnome-user-share gnome-weather grilo-plugins gvfs gvfs-afc gvfs-goa gvfs-google gvfs-gphoto2 gvfs-mtp gvfs-nfs gvfs-smb loupe malcontent nautilus orca rhythmbox rygel simple-scan snapshot sushi tecla totem tracker3-miners xdg-desktop-portal-gnome xdg-user-dirs-gtk yelp) 
# GNOME extra (selected packages)
depends+=(dconf-editor gnome-themes-extra gnome-tweaks)
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
# Video stuff required by totem
depends+=(
  gstreamer
  gst-libav
)

package() {
  # GNOME configuration
  install -Dm0644 dconf "${pkgdir}"/etc/dconf/db/local.d/90_arch
  
  # Copy Arch-Linux-specific setup script to destination
  install -Dm0755 setup "${pkgdir}"/etc/pixie/setup-archlinux
    
  cd "${pkgname}-v${pkgver}" || return
  make DESTDIR="$pkgdir" install
}
