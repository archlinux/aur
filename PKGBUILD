# Maintainer: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com>
# Contributor: raihan2000 <raihan1999ahamed@gmail.com>

pkgname=gnome-shell-mobile
pkgdesc="Next generation desktop shell"
pkgver=45.rc.r272.gdf3f6b4
pkgrel=1
_arches=specific
arch=(any)
license=(GPL)
url=https://wiki.gnome.org/Projects/GnomeShell
depends=(
    accountsservice
    gcr-4
    gjs
    gnome-autoar
    gnome-session
    gnome-settings-daemon
    gsettings-desktop-schemas
    gtk4
    libadwaita
    libcanberra-pulse
    libgdm
    libgweather-4
    libibus
    libnma-gtk4
    libsecret
    libsoup3
    mutter-mobile
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
    "evolution-data-server: Evolution calendar integration"
    "gnome-bluetooth-3.0: Bluetooth support"
    "gnome-control-center: System settings"
    "gnome-disk-utility: Mount with keyfiles"
    "gst-plugin-pipewire: Screen recording"
    "gst-plugins-good: Screen recording"
    "power-profiles-daemon: Power profile switching"
    "python-gobject: gnome-shell-test-tool performance tester"
#   "switcheroo-control: Multi-GPU support"
)
_commit=df3f6b4c512d2f181e86ff7f6b1646ce7b907344  # mobile-shell
source=(
    "git+https://gitlab.gnome.org/verdre/mobile-shell.git#commit=$_commit"
    "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
)
sha256sums=(
    SKIP
    SKIP
)

pkgver() {
    cd mobile-shell

    if ! git show-ref --tags | grep -q "refs/tags/$tag_name"; then
        git config --global user.email "build@manjaro.org"
        git config --global user.name "Manjaro Build Server"

        git tag -a 45.rc f83dae197f16cc35977cbc6d082175d260fbc77d -m "Bump version to 45.rc"
    fi

    git describe --long --abbrev=7 --tags "$_commit" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
    cd mobile-shell

    git submodule init
    git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
    git -c protocol.file.allow=always submodule update
}

build() {
    local meson_options=(
        -D gtk_doc=false
    )

    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    arch-meson mobile-shell build "${meson_options[@]}"
    meson compile -C build
}

_check() (
    export XDG_RUNTIME_DIR="$PWD/rdir"
    mkdir -p -m 700 "XDG_RUNTIME_DIR"

    export NO_AT_BRIDGE=1 GTK_A11Y=none

    meson test -C build --print-errorlogs
)

#check() {
#   dbus-run-session xvfb-run -s '-nolisten local +iglx -noreset' \
#   bash -c "$(declare -f _check); _check"
#}

package() {
    conflicts=(gnome-shell)
    provides=(gnome-shell=1:$pkgver)

    depends+=(libmutter-13.so)
    meson install -C build --destdir "$pkgdir"
}
