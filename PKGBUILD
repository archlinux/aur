# Maintainer: Michael Healy <horsemanoffaith@gmail.com>
# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Original Maintainer: Jan de Groot <jgc@archlinux.org>
# Contributor: thn81 <root@scrat>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=yakkety
# vercheck-archlinux: name=${pkgname%-*}, repo=extra, arch=x86_64
# vercheck-gnome: name=${pkgname%-*}, majorver=3.22
# vercheck-ppa: name=${pkgname%-*}, url=ppa:gnome3-team/gnome3-staging

pkgname=gnome-settings-daemon-ubuntu
_use_ppa=false
#_ppa_rel=2ubuntu1~ubuntu16.04.1
#_ppa_ver=3.20.1
_ubuntu_rel=1ubuntu1
#_ubuntu_ver=3.22.1
pkgver=42.2
pkgrel=1
pkgdesc="GNOME Settings Daemon"
url="https://git.gnome.org/browse/gnome-settings-daemon"
arch=(i686 x86_64)
license=(GPL)
depends=(dconf geoclue2 geocode-glib gnome-desktop gsettings-desktop-schemas-ubuntu
	gtk3-print-backends libcanberra-pulse libgudev libgweather libnotify librsvg 
	libsystemd libwacom nss pulseaudio pulseaudio-alsa upower)
makedepends=(docbook-xsl git gnome-common intltool libxslt python xf86-input-wacom)
groups=(gnome unity)
provides=("gnome-settings-daemon=${pkgver}")
conflicts=(gnome-settings-daemon)
_commit=4bdf8b5ae38a382be4126bbc0ce8d87bac46177e  # tags/GNOME_SETTINGS_DAEMON_42_2^0
source=("git://git.gnome.org/gnome-settings-daemon#commit=${_commit}"
        "git://git.gnome.org/libgnome-volume-control")

if [[ "${_use_ppa}" == "true" ]]; then
    source+=("http://ppa.launchpad.net/gnome3-team/gnome3-staging/ubuntu/pool/main/g/gnome-settings-daemon/gnome-settings-daemon_${_ppa_ver:-${pkgver}}-${_ppa_rel}.debian.tar.xz")
else
    source+=("https://launchpad.net/ubuntu/+archive/primary/+files/gnome-settings-daemon_${_ubuntu_ver:-${pkgver}}-${_ubuntu_rel}.debian.tar.xz")
fi

sha512sums=('SKIP'
            'SKIP'
            '4d540731401788b44f17a2d9d8e0e3a5dfce2b0bf28c83ed4b1a3515d9aaa49366c6549e88792045dfe70851ac946d2d7431ed34188a42f4ae4b97b32cd67ecd')

pkgver() {
    cd "${pkgname%-*}"
    git describe --tags | sed 's/^GNOME_SETTINGS_DAEMON_//;s/_/./g;s/-/+/g'
}

prepare() {
    cd "${pkgname%-*}"

    git submodule init
    git config --local submodule."panels/media-keys/gvc".url "${srcdir}/libgnome-volume-control"
    git submodule update

    # Apply Ubuntu's patches
    patch -Np1 -i ../debian//ubuntu/print-notifications-suppress-printer-may-not-be-connected.patch
    patch -Np1 -i ../debian/ubuntu/keyboard-sync-input-sources-to-accountsservice.patch
    patch -Np1 -i ../debianu/buntu/media-keys-restore-terminal-keyboard-shortcut-schema.patch
    patch -Np1 -i ../debian/ubuntu/media-keys-correct-logout-action.patch
    patch -Np1 -i ../debian/ubuntu/lid-close-suspend-support.patch
    patch -Np1 -i ../debian/ubuntu/keyboard-Use-ibus-sources-from-locale.patch
    patch -Np1 -i ../debian/ubuntu/Revert-media-keys-fix-gnome-settings-desktop-file.patch
    patch -Np1 -i ../debian/ubuntu/teach-gsd-about-the-gnome-calculator-snap-.desktop-name.patch

}

build() {
    arch-meson -C gnome-settings-daemon build
    ninja -C build
}

package() {
    DESTDIR="${pkgdir}"  ninja -C build install
}
