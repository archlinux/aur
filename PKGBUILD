# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>
# Contributor: Ignacy Kuchciński (ignapk) <ignacykuchcinski@gmail.com>
# Contributor: Simon Gardling <titaniumtown@gmail.com>
# Contributor: Ricardo Liang (rliang) <ricardoliang@gmail.com>

_pkgname="gnome-shell"
pkgname="${_pkgname}-git"
pkgver=44.1+116+gace8676ad
pkgrel=1
epoch=1
pkgdesc="Next generation desktop shell"
url="https://wiki.gnome.org/Projects/GnomeShell"
arch=(
  'x86_64'
  'i686'
  'pentium4'
  'aarch64'
  'armv7h'
  'armv6l')
license=(GPL)
depends=(
  accountsservice
  gcr-4-git
  "gjs-git>=1.76.0"
  gnome-autoar
  gnome-session
  gnome-settings-daemon
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
  gnome-control-center
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
  'gnome-bluetooth-3.0: Bluetooth support'
  'gnome-control-center: System settings'
  'gnome-disk-utility: Mount with keyfiles'
  'gst-plugin-pipewire: Screen recording'
  'gst-plugins-good: Screen recording'
  'power-profiles-daemon: Power profile switching'
  'switcheroo-control: Multi-GPU support'
)
groups=(gnome)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
_project_url="https://gitlab.gnome.org/GNOME"
_repo_url="${_project_url}/${_pkgname}"
_gvc_repo_url="${_project_url}/libgnome-volume-control"
source=("git+${_repo_url}.git"
        "git+${_gvc_repo_url}.git")
sha256sums=(
  'SKIP'
  'SKIP')

pkgver() {
  cd "${_pkgname}" || exit
  git describe --tags | sed 's/-/+/g'
}

prepare() {
  cd $"${_pkgname}"

  git submodule init
  git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
  git -c protocol.file.allow=always submodule update
}

build() {
  local meson_options=(
    -D gtk_doc=true
  )

  CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
  LDFLAGS+=" -Wl,-Bsymbolic-functions"

  arch-meson "${_pkgname}" build "${meson_options[@]}"
  meson compile -C build
}

_check() (
  export XDG_RUNTIME_DIR="$PWD/rdir"
  mkdir -p -m 700 "$XDG_RUNTIME_DIR"

  meson test -C build --print-errorlogs -t 3
)

check() {
  dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
    bash -c "$(declare -f _check); _check"
}

package() {
  depends+=("libmutter-12.so")
  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
