# Maintainer: Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

# shellcheck disable=SC2034
_pkgname="gnome-control-center"
pkgname="${_pkgname}-git"
pkgver=43.0+11+g997a09e1a
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop"
url="https://gitlab.gnome.org/GNOME/${_pkgname}"
license=(GPL2)
arch=(
  'arm'
  'aarch64'
  'armv7h'
  'x86_64'
  'i686'
  'pentium4')
provides=(
  "${_pkgname}")
conflicts=(
  "${_pkgname}")
depends=(
  accountsservice
  cups-pk-helper
  gnome-bluetooth-git
  gnome-desktop-4-git
  gnome-online-accounts
  gnome-settings-daemon
  gsettings-desktop-schemas-git
  gtk4
  libgtop
  libnma-git
  nm-connection-editor
  sound-theme-freedesktop
  upower
  libpwquality
  gnome-color-manager
  smbclient
  libmm-glib
  libgnomekbd
  libibus
  libgudev
  bolt
  udisks2
  libhandy
  gsound
  colord-gtk4)
makedepends=(
  docbook-xsl
  modemmanager
  git
  python
  meson)
checkdepends=(
  python-dbusmock
  python-gobject
  xorg-server-xvfb)
optdepends=(
  'system-config-printer: Printer settings'
  'gnome-user-share: WebDAV file sharing'
  'gnome-remote-desktop: screen sharing'
  'rygel: media sharing'
  'openssh: remote login'
  'power-profiles-daemon: Power profiles support')
groups=(
  gnome)
source=(
  "${_pkgname}::git+https://gitlab.gnome.org/GNOME/${_pkgname}.git"
  "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git")
sha256sums=(
  'SKIP'
  'SKIP')

pkgver() {
  cd \
    "${_pkgname}" || \
    exit
  git \
    describe \
    --tags | \
      sed \
        's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g'
}

# shellcheck disable=SC2154
prepare() {
  cd \
    "${_pkgname}" || \
    exit
  # Install bare logos into pixmaps, not icons
  sed \
    -i \
    "/install_dir/s/'icons'/'pixmaps'/" \
    panels/info-overview/meson.build
  git \
    submodule \
    init \
    subprojects/gvc
  git \
    submodule \
    set-url \
    subprojects/gvc \
    "${srcdir}/libgnome-volume-control"
  git \
    submodule \
    update
}


build() {
  arch-meson \
    "${_pkgname}" \
    build \
    -D documentation=true
  meson \
    compile \
    -C build
}

check() {
  meson \
    test \
    -C build \
    --print-errorlogs
}

# shellcheck disable=SC2154
package() {
  meson \
    install \
    -C build \
    --destdir "${pkgdir}"
  install \
    -d \
    -o root \
    -g 102 \
    -m 750 \
    "${pkgdir}/usr/share/polkit-1/rules.d"
}

# vim:set sw=2 sts=-1 et:
