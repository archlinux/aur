# SPDX-License-Identifier: AGPL-3.0
#
# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Maintainer: Truocolo <truocolo@aol.com>
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>
# Contributor: Marcell Meszaros (MarsSeed) <marcell.meszaros@runbox.eu>

_proj="gnome"
_ns="GNOME"
_pkg="shell"
_Pkg="Shell"
_pkgname="${_proj}-${_pkg}"
pkgbase="${_pkgname}-git"
pkgname=(
  "${pkgbase}"
)
pkgver=44.1.r116.gace8676ad
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.${_proj}.org/Projects/Gnome${_Pkg}"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'aarch64'
  'armv7h'
  'armv6l'
)
license=(
  GPL
)
depends=(
  accountsservice
  gcr-4
  "gjs-git>=1.76.0"
  "${_proj}-autoar"
  "${_proj}-session"
  "${_proj}-settings-daemon"
  gsettings-desktop-schemas
  gtk4
  "libadwaita-git>=1.3"
  libcanberra-pulse
  libgdm
  libgweather-4
  libibus
  libnma-gtk4
  libsecret
  libsoup3
  "mutter-git>=44.1"
  unzip
  upower
)
makedepends=(
  asciidoc
  bash-completion
  evolution-data-server
  git
  "${_proj}-control-center"
  gobject-introspection
  gtk-doc
  meson
  sassc
)
checkdepends=(
  appstream-glib
  python-dbusmock
  xorg-server-xvfb
)
optdepends=(
  'evolution-data-server: Evolution calendar integration'
  "${_proj}-bluetooth-3.0: Bluetooth support"
  "${_proj}-control-center: System settings"
  "${_proj}-disk-utility: Mount with keyfiles"
  'gst-plugin-pipewire: Screen recording'
  'gst-plugins-good: Screen recording'
  'power-profiles-daemon: Power profile switching'
  'switcheroo-control: Multi-GPU support'
)
groups=(
  "${_proj}"
)
provides=(
  "${_pkgname}=${pkgver}"
)
conflicts=(
  "${_pkgname}"
)
_project_url="https://gitlab.${_proj}.org/${_ns}"
_repo_url="${_project_url}/${_pkgname}"
_gvc_repo_url="${_project_url}/lib${_proj}-volume-control"
source=(
  "git+${_repo_url}.git"
  "git+${_gvc_repo_url}.git"
)
sha256sums=(
  'SKIP'
  'SKIP'
)

pkgver() {
  local \
    _pkgver
  cd \
    "${_pkgname}" || \
    exit
  _pkgver="$( \
    git \
      describe \
        --tags \
        --long | \
      sed \
        's/-/+/g')"
  _parse_rev \
    "${_pkgver}"
}

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
  [[ "${_rev}" != "" ]] && \
    _out+=".r${_rev}"
  [[ "${_commit}" != "" ]] && \
    _out+=".${_commit}"
  echo \
    "${_out}"
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
        subprojects/gvc \
        "$srcdir/lib${_proj}-volume-control"
  git \
    -c protocol.file.allow=always \
    submodule \
      update
}

build() {
  local \
    meson_options=()
  meson_options=(
    -D gtk_doc=true
  )
  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"
  arch-meson \
    "${_pkgname}" \
      build \
        "${meson_options[@]}"
  meson \
    compile \
     -C \
     build
}

_check() (
  export \
    XDG_RUNTIME_DIR="$PWD/rdir"
  mkdir \
    -p \
    -m 700 \
    "$XDG_RUNTIME_DIR"

  meson \
    test \
      -C \
        build \
      --print-errorlogs \
      -t 3
)

check() {
  dbus-run-session \
    xvfb-run \
      -s \
      '-nolisten local +iglx -noreset' \
    bash \
      -c \
        "$(declare -f _check); _check"
}

package() {
  depends+=(
    "libmutter-13.so"
  )
  meson \
    install \
    -C build \
    --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
