# Maintainer: Raihan Ahamed (raihan2000) <raihan1999ahamed@gmail.com>
# Contributor: Fabian Bornschein <fabiscafe@archlinux.org>
# Contributor: Jan Alexander Steffens (heftig) <heftig@archlinux.org>

pkgname=gnome-settings-daemon-mobile
pkgdesc="GNOME Settings Daemon"
pkgver=48.r0.g7dbef7e
pkgrel=1
arch=(
    any
)
license=(
    GPL-2.0-or-later
    LGPL-2.0-or-later
)
url="https://gitlab.gnome.org/verdre/gnome-settings-daemon-mobile"
depends=(
    alsa-lib
    bash
    cairo
    dconf
    fontconfig
    gcc-libs
    gcr-4
    geoclue
    geocode-glib-2
    glib2
    glibc
    gnome-desktop
    gsettings-desktop-schemas
    gtk3
    libcanberra-pulse
    libcolord
    libcups
    libgudev
    libgweather-4
    libmm-glib
    libnm
    libnotify
    libp11-kit
    libpulse
    librsvg
    libwacom
    libx11
    libxext
    libxfixes
    libxi
    nss
    pango
    polkit
    pulse-native-provider
    systemd
    systemd-libs
    upower
    wayland
    xorg-xrdb
)
makedepends=(
    docbook-xsl
    git
    glib2-devel
    libxslt
    meson
    python
    usbguard
)
checkdepends=(
    python-dbusmock
    python-gobject
)
optdepends=("usbguard: USB protection support")
groups=(gnome)
backup=(etc/xdg/Xwayland-session.d/00-xrdb)
_commit=7dbef7eb2f73b6d838c37bcc1354ae1f629943d8 # tags^48.mobile.0
source=(
    "git+https://gitlab.gnome.org/verdre/gnome-settings-daemon-mobile.git#commit=$_commit"
    "git+https://gitlab.gnome.org/GNOME/libgnome-volume-control.git"
    0001-subprojects-Update-gvc-to-latest-commit.patch
)
sha256sums=(
    c204a2037b74c3233ddaa140f917dd65925c7bb71f5532d672081fcc779f85f6
    SKIP
    9eca57b6f1c465ab6d70aeabf755edcc727474bfb58505b16a0398abbf2a0b75
)

pkgver() {
    cd $pkgname
    git describe --long --tags --abbrev=7 "$_commit" | sed -E 's/^([0-9]+)\.mobile\.[0-9]+-([0-9]+)-g([0-9a-f]+)/\1.r\2.g\3/'
}

prepare() {
    cd $pkgname
    git apply -3 ../0001-subprojects-Update-gvc-to-latest-commit.patch

    git submodule init
    git submodule set-url subprojects/gvc "$srcdir/libgnome-volume-control"
    git -c protocol.file.allow=always -c protocol.allow=never submodule update
}

build() {
    arch-meson $pkgname build
    meson compile -C build
}

#check() {
#    meson test -C build --print-errorlogs
#}

package() {
    conflicts=(gnome-settings-daemon)
    provides=(gnome-settings-daemon=1:$pkgver)
    meson install -C build --destdir "$pkgdir"
}

# vim:set sw=2 sts=-1 et:
