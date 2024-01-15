# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>

_py="python"
_proj="gnome"
_ns="GNOME"
_pkg="photos"
_pkgname="${_proj}-${_pkg}"
pkgname="${_pkgname}-git"
pkgver="44.0.r3.ga534601c"
pkgrel=1
epoch=1
pkgdesc="Access, organize, and share your photos on GNOME"
url="https://wiki.gnome.org/Apps/Photos"
arch=(
  x86_64
  i686
  pentium4
  arm
  armv7h
  aarch64
  powerpc
)
license=(
  GPL
)
depends=(
  babl
  dleyna
  gegl
  geocode-glib-2
  "${_proj}-online-accounts"
  gsettings-desktop-schemas
  gtk3
  libdazzle
  libgexiv2
  libhandy
  libportal-gtk3
  librsvg
  tracker3-miners
)
makedepends=(
  docbook-xsl
  git
  meson
  "${_py}"
  yelp-tools
)
groups=(
  "${_proj}"
  "${_proj}-git"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_http="https://gitlab.${_proj}.org"
_url="${_http}/${_ns}/${_pkgname}"
_local="${HOME}/${_pkgname}"
source=(
  "git+${_url}.git"
  "git+${_url}/${_ns}/libgd.git"
)
sha512sums=(
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
    "${_pkgname}"
  _pkgver="$( \
    git \
      describe \
      --tags | \
      sed 's/-/+/g')"
  _parse_ver \
    "${_pkgver}"
}

prepare() {
  cd \
    "${_pkgname}"

  git \
    submodule \
      init
  git \
    submodule \
      set-url \
        subprojects/libgd \
        "${srcdir}/libgd"
  git \
    -c protocol.file.allow=always \
    submodule \
      update
}

meson_options=(
  -D manuals=true
)

build() {
  arch-meson \
    "${_pkgname}" \
    build \
      "${meson_options[@]}"
  meson \
    compile \
    -C \
      build
}

package() {
  meson \
    install \
    -C \
      build \
    --destdir \
      "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
