# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>
# Maintainer: Michael Healy <horsemanoffaith@gmail.com>

# vercheck-pkgbuild: auto
# vercheck-ubuntu: name=${pkgname%-*}, repo=zesty
# vercheck-launchpad: name=${pkgname%-*}

pkgbase=lightdm-ubuntu
pkgname=(lightdm-ubuntu liblightdm-qt4-ubuntu liblightdm-qt5-ubuntu)
_ubuntu_rel=0ubuntu2
pkgver=1.20.0
pkgrel=1
pkgdesc="A lightweight display manager"
arch=(i686 x86_64)
url="https://launchpad.net/lightdm"
# Libraries are LGPLv3+, everything else is GPLv3+
license=(GPL3 LGPL3)
groups=(unity)
makedepends=(glib2 gobject-introspection gtk-doc intltool itstool libgcrypt
             libx11 libxcb libxdmcp libxklavier pam polkit qt4 qt5-base vala)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/lightdm_${pkgver}-${_ubuntu_rel}.tar.gz"
        lightdm.service
        lightdm.tmpfiles
        lightdm.pam
        lightdm-autologin.pam
        lightdm.rules
        lightdm-default-config.patch
        Xsession
        0001-guest-account-Add-default-GSettings-support.patch)
sha512sums=('2ac7a8908c288c95f0866dfc61ea171434edad8d849eb8b24e8b4e3f23bfd593441e2884e19df3e34a95bac9e21d60f29279c2cfafdc4f62338296bd38d6f34e'
            'd49344e79f6468ef06538068cbb12c37e313e02ade28984a75dad4d50e1e962372451908e9910ae60c74bd5230ae45e6a6346bb0f7c6af83c346a691f5714556'
            'c359dbea59d9a38faa244fc52fa7fbe2a099984bdaa015e38046abfef71ed4941230b86a238c1691f04bda6f7608f403e99b04018a7cd5b7217fa89fc703af9f'
            'cb912013a294f0801b357a43f3e5313ffa9ac5fcc493b2318843983388eb0b839c84060a97c355e12ca03f3b056644aa4a2bb8a74ed73a0f2405816b8d6efdc0'
            '61115380c8eb07b855c074f0c83f2f1f78a9c0ea0458cbb1e8cb1271db72e751ce6b54f80a591906c792f247cac463e8af2cc4707d3d6c1d43cb70e394fde104'
            '8d6aa12c4d129c25e56ecf2904db4e294d46631d11bd8bec2f20a76c871ba758094abb24616d3d2038a684fbb736ee61d1f80697d525d62c4dc68113e101194f'
            '62ef6fd02664d539c6169000774978c9780156d1483fabf25474073c221dc2d943f21c81b5225030f9b375eab1a83ccdefaf289d4a40a71b1fe91397da7d1425'
            '5e0f47e6d338e35548235dcfdb8b22622b749ffd69d5d6a4463021f51df0c679d1d78e0be17bbc072239d9916a027669aac9c6456afabe0ca3fde881b611b576'
            '393ede18563aab484aace26c6c470b07e16f79025fec5eec03e0f1072e39316bc73a73d45da843c6b76f356e8b069fda66fa3863f39d1106dbf1f3ff7e4175a6')

prepare() {
    cd "lightdm-${pkgver}"

    patch -p1 -i "${srcdir}"/lightdm-default-config.patch

    # Do not use Ubuntu's language-tools
    sed -i '/04_language_handling.patch/d' debian/patches/series

    for i in $(grep -v '#' debian/patches/series); do
        patch -p1 -i "debian/patches/${i}"
    done

    # Add support for settings GSettings/dconf defaults in the guest session. Just
    # put the files in /etc/guest-session/gsettings/. The file format is the same
    # as the regular GSettings override files.
    patch -p1 -i ../0001-guest-account-Add-default-GSettings-support.patch
}

build() {
    cd "lightdm-${pkgver}"

    export MOC4=moc-qt4
    export MOC5=moc-qt5

    gtkdocize
    aclocal --install --force
    autoreconf -vfi
    intltoolize -f

    ./configure \
        --prefix=/usr \
        --libexecdir=/usr/lib/lightdm \
        --localstatedir=/var \
        --sbindir=/usr/bin \
        --sysconfdir=/etc \
        --with-greeter-user=lightdm \
        --with-greeter-session=lightdm-gtk-greeter \
        --with-user-session=ubuntu \
        --disable-static \
        --disable-tests

    make
}

package_lightdm-ubuntu() {
    depends=(glib2 libgcrypt libx11 libxcb libxdmcp libxklavier pam polkit)
    optdepends=('accountsservice: DBus interface for querying user information'
                'bindfs: Used for guest session to avoid copying skeleton dotfiles'
                'gnome-keyring: For pam_gnome_keyring.so in the greeter PAM config'
                'gtk3: For using the GTK greeter'
                'lightdm-gtk-greeter: GTK greeter'
                'lightdm-kde-greeter: Qt greeter'
                'lightdm-unity-greeter: Default Ubuntu Greeter')
    provides=("lightdm=${pkgver}")
    conflicts=(lightdm)
    backup=(etc/apparmor.d/lightdm-guest-session
            etc/lightdm/keys.conf
            etc/lightdm/lightdm.conf
            etc/lightdm/users.conf
            etc/lightdm/Xsession
            etc/pam.d/lightdm
            etc/pam.d/lightdm-autologin
            etc/pam.d/lightdm-greeter)
    install=lightdm.install

    cd "lightdm-${pkgver}"

    make DESTDIR="${pkgdir}" install
    make DESTDIR="${pkgdir}" -C liblightdm-qt uninstall

    install -m755 ../Xsession "${pkgdir}"/etc/lightdm/Xsession
    rm -rf "${pkgdir}"/etc/init
    rm -rf "${pkgdir}"/usr/include/lightdm-qt{,5}-*

    install -dm755 "${pkgdir}"/var/cache/lightdm
    install -dm770 "${pkgdir}"/var/lib/lightdm{,-data}
    install -dm711 "${pkgdir}"/var/log/lightdm
    chmod +t "${pkgdir}"/var/{cache/lightdm,lib/lightdm{,-data}}
    chown 620:620 -R "${pkgdir}"/var/lib/lightdm{,-data}
    chgrp 620 "${pkgdir}"/var/log/lightdm

    # PAM
    install -m644 ../lightdm.pam "${pkgdir}"/etc/pam.d/lightdm
    install -m644 ../lightdm-autologin.pam "${pkgdir}"/etc/pam.d/lightdm-autologin

    # PolicyKit
    install -dm750 -g102 "${pkgdir}"/usr/share/polkit-1/rules.d
    install -m644 ../lightdm.rules "${pkgdir}"/usr/share/polkit-1/rules.d/lightdm.rules

    # Systemd
    install -dm755 "${pkgdir}"/usr/lib/{systemd/system,tmpfiles.d}
    install -m644 ../lightdm.service "${pkgdir}"/usr/lib/systemd/system/lightdm.service
    install -m644 ../lightdm.tmpfiles "${pkgdir}"/usr/lib/tmpfiles.d/lightdm.conf

    # Additional LightDM configuration files
    install -dm755 "${pkgdir}"/etc/lightdm/lightdm.conf.d/
    install -m644 debian/50-{xserver-command,greeter-wrapper,guest-wrapper,disable-log-backup}.conf \
                  "${pkgdir}"/etc/lightdm/lightdm.conf.d/

    # Install binaries and scripts
    install -dm755 "${pkgdir}"/usr/bin/
    install -m755 debian/guest-account.sh "${pkgdir}"/usr/bin/guest-account
    install -m755 debian/guest-session-auto.sh "${pkgdir}"/usr/lib/lightdm/
    install -m755 debian/lightdm-session "${pkgdir}"/usr/bin/
    install -m755 debian/lightdm-greeter-session "${pkgdir}"/usr/lib/lightdm/
    install -m755 debian/config-error-dialog.sh "${pkgdir}"/usr/lib/lightdm/

    # Skeleton files for guest account
    install -dm755 "${pkgdir}"/usr/share/lightdm/guest-session/skel/.config/autostart/
    install -m644 debian/guest-session-startup.desktop \
                  "${pkgdir}"/usr/share/lightdm/guest-session/skel/.config/autostart/
    install -m755 debian/guest-session-setup.sh \
                  "${pkgdir}"/usr/share/lightdm/guest-session/setup.sh

    # Create GSettings defaults directory
    install -dm755 "${pkgdir}"/etc/guest-session/gsettings/

    # Remove apparmor stuff
    rm -rvf "${pkgdir}"/etc/apparmor.d/
}

package_liblightdm-qt4-ubuntu() {
	pkgdesc='LightDM Qt4 client library'
	depends=(lightdm-ubuntu qt4)
    provides=("liblightdm-qt4=${pkgver}")
    conflicts=(liblightdm-qt4)
	options=(!emptydirs)

	cd "lightdm-${pkgver}"

    make DESTDIR="${pkgdir}" -C liblightdm-gobject install
    make DESTDIR="${pkgdir}" -C liblightdm-qt install
    make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
    find "${pkgdir}" -type d -name *qt5* -exec rm -rf {} +
    find "${pkgdir}" -type f -name *qt5* -exec rm {} +
    find "${pkgdir}" -type l -name *qt5* -exec rm {} +
}

package_liblightdm-qt5-ubuntu() {
	pkgdesc='LightDM Qt5 client library'
    depends=(lightdm-ubuntu qt5-base)
    provides=("liblightdm-qt5=${pkgver}")
    conflicts=(liblightdm-qt5)
    options=(!emptydirs)

    cd "lightdm-${pkgver}"

    make DESTDIR="${pkgdir}" -C liblightdm-gobject install
    make DESTDIR="${pkgdir}" -C liblightdm-qt install
    make DESTDIR="${pkgdir}" -C liblightdm-gobject uninstall
    find "${pkgdir}" -type d -name *qt[!5]* -exec rm -rf {} +
    find "${pkgdir}" -type f -name *qt[!5]* -exec rm {} +
    find "${pkgdir}" -type l -name *qt[!5]* -exec rm {} +
}
