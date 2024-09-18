# Maintainer: Raihan Ahamed (raihan2000) <raihan1999ahamed@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>

pkgbase=mutter-mobile
pkgname=(
    mutter-mobile
    mutter-mobile-docs
)
pkgdesc="Window manager and compositor for GNOME"
pkgver=46.r1.g1daa120
pkgrel=1
arch=(
    any
)
license=(GPL-2.0-or-later)
url="https://gitlab.gnome.org/verdre/mutter-mobile"
depends=(
    at-spi2-core
    cairo
    colord
    dconf
    fontconfig
    fribidi
    gcc-libs
    gdk-pixbuf2
    glib2
    glibc
    gnome-desktop-4
    gnome-settings-daemon-mobile
    graphene
    gsettings-desktop-schemas
    gtk4
    harfbuzz
    iio-sensor-proxy
    lcms2
    libcanberra
    libcolord
    libdisplay-info
    libdrm
    libei
    libglvnd
    libgudev
    libice
    libinput
    libpipewire
    libsm
    libsysprof-capture
    libwacom
    libx11
    libxau
    libxcb
    libxcomposite
    libxcursor
    libxdamage
    libxext
    libxfixes
    libxi
    libxinerama
    libxkbcommon
    libxkbcommon-x11
    libxkbfile
    libxrandr
    libxtst
    mesa
    pango
    pipewire
    pixman
    python
    startup-notification
    systemd-libs
    wayland
    xorg-xwayland
)
makedepends=(
    egl-wayland
    gi-docgen
    git
    glib2-devel
    gobject-introspection
    meson
    sysprof
    wayland-protocols
)
_commit=1daa12072d108ddaee9dc25252ce67b74d404edf # tags^46-mobile.1
source=("git+https://gitlab.gnome.org/verdre/mutter-mobile.git#commit=$_commit")
sha256sums=(72d4fbe203cf19abef0e060d3226a977da380788a610eb9691cb77bf362a95b4)

pkgver() {
    cd "$pkgbase"
    git describe --long --tags --abbrev=7 "$_commit" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g; s/.mobile.1//' | sed 's/0/1/'
}

prepare() {
    cd mutter-mobile
}

build() {
    local meson_options=(
      -D docs=true
      -D egl_device=true
      -D installed_tests=false
      -D libdisplay_info=enabled
      -D tests=false
      -D wayland_eglstream=true
    )

    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    arch-meson mutter-mobile build "${meson_options[@]}"
    meson compile -C build
}

_pick() {
    local p="$1" f d; shift
    for f; do
      d="$srcdir/$p/${f#$pkgdir/}"
      mkdir -p "$(dirname "$d")"
      mv "$f" "$d"
      rmdir -p --ignore-fail-on-non-empty "$(dirname "$f")"
    done
}

package_mutter-mobile() {
    conflicts=(mutter)
    provides=(libmutter-14.so mutter=$pkgver)

    meson install -C build --destdir "$pkgdir"

    _pick docs "$pkgdir"/usr/share/mutter-*/doc
}

package_mutter-mobile-docs() {
    conflicts=(mutter-mobile-docs)
    provides=(mutter-mobile-docs=$pkgver)
    pkgdesc+=" (documentation)"
    depends=()

    mv docs/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
