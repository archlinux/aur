# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer:  Pellegrino Prevete <cGVsbGVncmlub3ByZXZldGVAZ21haWwuY29tCg== | base -d>
# Maintainer:  Truocolo <truocolo@aol.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

# shellcheck disable=SC2034
_py="python"
_proj="gnome"
_ns="GNOME"
_pkgname="${_proj}-control-center"
pkgname="${_pkgname}-git"
pkgver=43.0.r11.g997a09e1a
pkgrel=1
pkgdesc="GNOME's main interface to configure various aspects of the desktop"
url="https://gitlab.${_proj}.org/${_ns}/${_pkgname}"
license=(
  GPL2
)
arch=(
  'arm'
  'aarch64'
  'armv7h'
  'x86_64'
  'i686'
  'pentium4'
  'powerpc'
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
depends=(
  accountsservice
  bolt
  colord-gtk4
  cups-pk-helper
  "${_proj}-bluetooth-git"
  "${_proj}-color-manager"
  "${_proj}-desktop-4-git"
  "${_proj}-online-accounts"
  "${_proj}-settings-daemon"
  "gsettings-desktop-schemas-git"
  gsound
  gtk4
  "lib${_proj}kbd"
  libgtop
  libgudev
  libhandy
  libibus
  libnma-git
  libpwquality
  libmm-glib
  nm-connection-editor
  smbclient
  sound-theme-freedesktop
  udisks2
  upower
)
makedepends=(
  docbook-xsl
  git
  modemmanager
  meson
  "${_py}"
)
checkdepends=(
  "${_py}-dbusmock"
  "${_py}-gobject"
  xorg-server-xvfb
)
optdepends=(
  'system-config-printer: Printer settings'
  "${_proj}-user-share: WebDAV file sharing"
  "${_proj}-remote-desktop: screen sharing"
  'rygel: media sharing'
  'openssh: remote login'
  'power-profiles-daemon: Power profiles support'
)
groups=(
  "${_proj}"
)
source=(
  "${_pkgname}::git+${url}.git"
  "git+https://gitlab.${_proj}.org/${_ns}/lib${_proj}-volume-control.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

_parse_ver() {
  local \
    _pkgver="${1}" \
    _out="" \
    _ver \
    _rev \
    _commit
  _ver="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $1}')"
  _rev="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $2}')"
  _commit="$( \
    echo \
      "${_pkgver}" | \
          awk \
            -F '+' \
            '{print $3}')"
  _out=${_ver}
  if [[ "${_rev}" != "" ]]; then
    _out+=".r${_rev}"
  fi
  if [[ "${_commit}" != "" ]]; then
    _out+=".${_commit}"
  fi
  echo \
    "${_out}"
}

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkgname}" || \
    exit
  _pkgver="$( \
    git \
      describe \
      --tags | \
        sed \
          's/^GNOME_CONTROL_CENTER_//;s/_/./g;s/-/+/g')"
  _parse_ver \
    "${_pkgver}"
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
    "${srcdir}/lib${_proj}-volume-control"
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
