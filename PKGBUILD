# Maintainer: Raihan Ahamed (raihan2000) <raihan1999ahamed@gmail.com>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Ionut Biru <ibiru@archlinux.org>
# Contributor: Flamelab <panosfilip@gmail.com

pkgbase=gnome-shell-mobile
pkgname=(
    gnome-shell-mobile
    gnome-shell-mobile-docs
)
pkgdesc="Next generation desktop shell"
pkgver=48.r0.gcf9bd6b
pkgrel=1
epoch=1
arch=(
    any
)
license=(GPL-3.0-or-later)
url="https://gitlab.gnome.org/verdre/gnome-shell-mobile"
depends=(
    accountsservice
    at-spi2-core
    bash
    cairo
    dconf
    gcc-libs
    gcr-4
    gdk-pixbuf2
    gjs
    glib2
    glibc
    gnome-autoar
    gnome-desktop-4
    gnome-session
    gnome-settings-daemon-mobile
    graphene
    gsettings-desktop-schemas
    gtk4
    hicolor-icon-theme
    json-glib
    libadwaita
    libcanberra-pulse
    libgdm
    libgirepository
    libglvnd
    libgweather-4
    libibus
    libical
    libnm
    libnma-gtk4
    libpipewire
    libpulse
    libsecret
    libsoup3
    libx11
    libxfixes
    mutter-mobile
    pango
    polkit
    systemd-libs
    unzip
    upower
    webkitgtk-6.0
)
makedepends=(
    asciidoc
    bash-completion
    evolution-data-server
    gi-docgen
    git
    glib2-devel
    gnome-keybindings
    gobject-introspection
    meson
    sassc
)
_commit=cf9bd6b53932335bbbf413b6d2db7ae74e9e7688 # tags^48.mobile.0
source=(
    "git+https://gitlab.gnome.org/verdre/gnome-shell-mobile.git#commit=$_commit"
    "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git#commit=5f9768a2eac29c1ed56f1fbb449a77a3523683b6"
)
sha256sums=(
    4e2b42451f69ec214b4d6fec8ac8d872f1bf41b1c439a6095bc60914195f1de3
    587319b45ff7d989635aed0c3bd9ef834d6e53ae46788cb6ba083d42d7e63855
)

pkgver() {
    cd $pkgbase
    git describe --long --tags --abbrev=7 "$_commit" | sed -E 's/^([0-9]+)\.mobile\.[0-9]+-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
}

prepare() {
    # Inject gvc
    ln -s libgnome-volume-control gvc

    cd $pkgbase
}

build() {
    local meson_options=(
      -D gtk_doc=true
      -D tests=false
    )

    CFLAGS="${CFLAGS/-O2/-O3} -fno-semantic-interposition"
    LDFLAGS+=" -Wl,-Bsymbolic-functions"

    # Inject gvc
    export MESON_PACKAGE_CACHE_DIR="$srcdir"

    arch-meson $pkgbase build "${meson_options[@]}"
    meson compile -C build
}

package_gnome-shell-mobile() {
    conflicts=(gnome-shell)
    provides=(gnome-shell=1:$pkgver)
    depends+=(libmutter-16.so)
    optdepends=(
      'evolution-data-server: Evolution calendar integration'
      'gnome-bluetooth-3.0: Bluetooth support'
      'gnome-control-center: System settings'
      'gnome-disk-utility: Mount with keyfiles'
      'gst-plugin-pipewire: Screen recording'
      'gst-plugins-good: Screen recording'
      'power-profiles-daemon: Power profile switching'
      'python-gobject: gnome-shell-test-tool performance tester'
      'python-simplejson: gnome-shell-test-tool performance tester'
      'switcheroo-control: Multi-GPU support'
    )
    groups=(gnome)

    meson install -C build --destdir "$pkgdir"

    mkdir -p doc/usr/share
    mv {"$pkgdir",doc}/usr/share/doc
}

package_gnome-shell-mobile-docs() {
    conflicts=(gnome-shell-docs)
    provides=(gnome-shell-docs=1:$pkgver)
    pkgdesc+=" (API documentation)"
    depends=()

    mv doc/* "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
