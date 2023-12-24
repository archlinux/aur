# Maintainer: Pellegrino Prevete (tallero) <pellegrinoprevete@gmail.com>

_pkgname=gnome-photos
pkgname="${_pkgname}-git"
pkgver=44.0+3+ga534601c
pkgrel=1
epoch=1
pkgdesc="Access, organize, and share your photos on GNOME"
url="https://wiki.gnome.org/Apps/Photos"
arch=(x86_64)
license=(GPL)
depends=(
  babl
  dleyna
  gegl
  geocode-glib-2
  gnome-online-accounts
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
  python
  yelp-tools
)
groups=(gnome gnome-git)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=(
  "git+https://gitlab.gnome.org/GNOME/gnome-photos.git"
  "git+https://gitlab.gnome.org/GNOME/libgd.git")
sha512sums=('SKIP'
            'SKIP')

pkgver() {
  cd \
    "${_pkgname}"
  git \
    describe \
    --tags | \
    sed 's/-/+/g'
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

build() {
  local \
    meson_options=()
  meson_options=(
    -D manuals=true
  )

  arch-meson \
    "${_pkgname}" \
    build \
    "${meson_options[@]}"
  meson \
    compile \
    -C build
}

package() {
  meson \
    install \
    -C build \
    --destdir "${pkgdir}"
}

# vim:set sw=2 sts=-1 et:
