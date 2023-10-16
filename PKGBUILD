# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Michael Kanis <mkanis_at_gmx_dot_de>
# Contributor: raihan2000 <raihan1999ahamed@gmail.com>

pkgbase=mutter
pkgname=mutter-mobile
pkgdesc="A window manager for GNOME"
pkgver=45.rc.r88.g0f08f5a
pkgrel=1
_arches=specific
arch=(any)
license=(GPL)
url=https://gitlab.gnome.org/GNOME/mutter
depends=(
    colord
    dconf
    gnome-desktop-4
    gnome-settings-daemon
    graphene
    gsettings-desktop-schemas
    iio-sensor-proxy
    lcms2
    libcanberra
    libei
    libgudev
    libinput
    libsm
    libsysprof-capture
    libxkbcommon-x11
    libxkbfile
    pipewire
    startup-notification
    xorg-xwayland
)
makedepends=(
    egl-wayland
    gi-docgen
    git
    gobject-introspection
    gtk3
    meson
    sysprof
    wayland-protocols
    xorg-server
    xorg-server-xvfb
)
checkdepends=(
    gnome-session
    python-dbusmock
    wireplumber
    zenity
)
options=(!debug)
_commit=0f08f5aba4c9b5ac34b2d5711182d50b719d838e  # mobile-shell
source=("git+https://gitlab.gnome.org/verdre/mobile-mutter.git#commit=$_commit")
sha256sums=(SKIP)

pkgver() {
    cd mobile-mutter

    if ! git show-ref --tags | grep -q "refs/tags/45.rc"; then
        git config --global user.email "build@manjaro.org"
        git config --global user.name "Manjaro Build Server"

        git tag -a 45.rc 493e799398991e832f3cec38f376e2ec26fc7bda -m "Bump version to 45.rc"
    fi

    git describe --long --abbrev=7 --tags "$_commit" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd mobile-mutter
}

build() {
    local meson_options=(
        -D docs=true
        -D egl_device=true
        -D installed_tests=false
        -D wayland_eglstream=true
    )

    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    arch-meson mobile-mutter build "${meson_options[@]}"
    meson compile -C build
}

_check() (
    export XDG_RUNTIME_DIR="$PWD/rdir" GSETTINGS_SCHEMA_DIR="$PWD/build/data"
    mkdir -p -m 700 "$XDG_RUNTIME_DIR"
    glib-compile-schemas "GSETTINGS_SCHEMA_DIR"

    export NO_AT_BRIDGE=1 GTK_A11Y=none
    export MUTTER_DEBUG_DUMMY_MODE_SPECS="800x600@10.0"

    xvfb-run -s '-nolisten local +iglx -noreset' \
        mutter/src/tests/meta-dbus-runner.py --launch=pipewire --launch=wireplumber \
        meson test -C build --print-errorlogs -t 5 --setup plain
)

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
    provides=(libmutter-13.so mutter=$pkgver)
    conflicts=(mutter)

    meson install -C build --destdir "$pkgdir"

    _pick docs "$pkgdir"/usr/share/mutter-*/doc
}
