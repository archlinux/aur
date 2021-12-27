# Maintainer: dreieck
# Controbutor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>

_pkgname='folks'
_pkgfeature='telepathy'
pkgname="${_pkgname}-${_pkgfeature}-git"
pkgver=0.15.3.7+r2985.20211116.69285b88
pkgrel=1
pkgdesc="Library to aggregates people into metacontacts. Variant of 'folks' with telepathy backend compiled in. Latest git checkout."
arch=(
  'x86_64'
  'i686'
)
url="https://wiki.gnome.org/Projects/Folks"
license=(LGPL2.1)
depends=(
  'evolution-data-server'
  'libgee'
  'libxml2'
  'telepathy-glib'
)
makedepends=(
  'git'
  'gobject-introspection'
  'gtk-doc'
  'meson'
  'python-dbusmock'
  'vala'
)
provides=(
  "${_pkgname}=${pkgver}"
  "${_pkgname}-${_pkgfeature}=${pkgver}"
  "${_pkgname}-git=${pkgver}"
  "libfolks.so=${pkgver}"
  "libfolks-dummy.so=${pkgver}"
  "libfolks-eds.so=${pkgver}"
  "libfolks-telepathy.so=${pkgver}"
)
conflicts=(
  "${_pkgname}"
  "${_pkgname}-${_pkgfeature}"
  "libfolks.so"
  "libfolks-dummy.so"
  "libfolks-eds.so"
  "libfolks-telepathy.so"
)
source=("${_pkgname}::git+https://gitlab.gnome.org/GNOME/folks.git")
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  _ver="$(git describe  --tags | sed 's|^v||' | sed 's|-[^-]*$||' | tr '-' '.')"
  _rev="$(git rev-list --count HEAD)"
  _date="$(git log -1 --date=format:"%Y%m%d" --format="%ad")"
  _hash="$(git rev-parse --short HEAD)"

  if [ -z "${_ver}" ]; then
    error "Version could not be determined."
    return 1
  else
    printf '%s' "${_ver}+r${_rev}.${_date}.${_hash}"
  fi
}

build() {
  cd "${srcdir}"

  local meson_args=(
    -D b_lto=false  # LTO copies some GType constructors
    -D docs=true
    -D telepathy_backend=true
  )
  artix-meson "${_pkgname}" build "${meson_args[@]}"
  meson compile -C build
}

# check() {
#   cd "${srcdir}"
# 
#   meson test -C build --print-errorlogs -t 4
# }

package() {
  cd "${srcdir}"

  meson install -C build --destdir "${pkgdir}"
}

# vim:set sw=2 et:
