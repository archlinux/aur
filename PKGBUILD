# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname}, repo=yakkety

pkgname=unity-settings-daemon
_ubuntu_rel=0ubuntu1
_actual_ver=15.04.1
_extra_ver=+16.10.20161003
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="Unity Settings Daemon"
arch=(i686 x86_64)
url="https://launchpad.net/unity-settings-daemon"
license=(GPL)
groups=(unity)
depends=(fcitx gnome-settings-daemon-ubuntu gperf gsettings-desktop-schemas-ubuntu 
          hicolor-icon-theme ibus libappindicator-gtk3-ubuntu libcanberra-pulse
         libnotify librsvg libsystemd libwacom libxkbfile mesa pulseaudio
         pulseaudio-alsa upower)
makedepends=(docbook-xsl intltool libxslt python2 xf86-input-wacom)
conflicts=(gnome-desktop-compat upower-compat)
#options=('!emptydirs')
source=("https://launchpad.net/ubuntu/+archive/primary/+files/unity-settings-daemon_${_actual_ver}${_extra_ver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/unity-settings-daemon_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff.gz"
        0001-Remove-accountsservice-dependency.patch
        0001-usd-test-screensaver-proxy-fails-to-compile.patch)
sha512sums=('d435f5b7000d2799fa1c099a69f10c0e5512d2dc243088fee41468aa632b7468cc0c0c55b7e44c793f194b03b5e40d5517c625a38cd80ee7d88b535ce01e9a91'
            '316b48e0ea611460c2baf3847e36580de47de7f83f2f4c6adff619fc21caef4c8392917f6bed34b012a9d7553162ae34b17b6126749aff86acbf77357607f39e'
            '2394d35355f31a1090c96a38f3e33930d70aa1683f1bc3c4b65fd6a70a9bf9e5a592109ed34dd2d5a07822b401a24d11d80a662aae850236434d89c37a9a9c89'
            '576a239db5ca938b7255a3079f8b6d9228501bd5b50ef741933736a25546acb6cc60b3696732a941883e4c5165f4ff9860bfd3708f7bdf8c19c1d29212c6c1f8'
            '9d036512105a20f1a2f045a7c6b87faedacb25748239babe3f79514c7899af74ab0e56e8d184406d183cdb2be6518f37681b03cdb6ce20901f0381b6bd0d7d68'
            '0b6fa66ebecef51c54ca04ae5aec6c6e05450668865e544f4c5ed3b142dcb22301bae440f55dfeec8fc5534a3c818d8cba4d019c32f5e3441a588bea9b93dab8')
            
prepare() {
    patch -p1 -i unity-settings-daemon_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff

    patch -p1 -i 0001-Remove-accountsservice-dependency.patch
    patch -p1 -i 0001-usd-test-screensaver-proxy-fails-to-compile.patch
}

build() {
    autoreconf -vfi
    intltoolize -f

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --localstatedir=/var \
        --libexecdir=/usr/lib/unity-settings-daemon \
        --disable-static \
        --enable-systemd \
        --enable-fcitx

    # https://bugzilla.gnome.org/show_bug.cgi?id=656231
    sed -i -e 's/ -shared / -Wl,-O1,--as-needed\0/g' libtool

    make
}

package() {
    make DESTDIR="${pkgdir}/" install

    install -dm755 "${pkgdir}/usr/bin/"
    ln -s /usr/lib/unity-settings-daemon/unity-settings-daemon \
        "${pkgdir}/usr/bin/unity-settings-daemon"

    install -Dm644 debian/unity-settings-daemon.user-session.upstart \
        "${pkgdir}"/usr/share/upstart/sessions/unity-settings-daemon.conf
    install -Dm644 debian/unity-settings-daemon.user-session.desktop \
        "${pkgdir}"/usr/share/upstart/xdg/autostart/unity-settings-daemon.desktop

    install -dm755 "${pkgdir}"/usr/lib/systemd/user/
    install -m644 debian/user/unity-settings-daemon.service \
        "${pkgdir}"/usr/lib/systemd/user/

    # Required until unity7 gets a systemd unity with Requires=u-s-d
    install -dm755 "${pkgdir}"/usr/lib/systemd/user/ubuntu-session.target.wants/
    ln -s /usr/lib/systemd/user/unity-settings-daemon.service \
        "${pkgdir}"/usr/lib/systemd/user/ubuntu-session.target.wants/

    install -dm755 "${pkgdir}"/usr/share/upstart/systemd-session/upstart/
    install -m644 debian/user/unity-settings-daemon.override \
        "${pkgdir}"/usr/share/upstart/systemd-session/upstart/

    # Use language packs
    rm -r "${pkgdir}/usr/share/locale/"

}
