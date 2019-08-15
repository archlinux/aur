# Maintainer: Newb I the Newbd <czbd hostedon o2 halfacolon pl>
# Contributor: Evangelos Foutras <evangelos@foutrelis.com>
# Contributor: tobias <tobias funnychar archlinux.org>

_pkgbase=xfce4-session
pkgname=(${_pkgbase}-gtk2)
pkgver=4.12.1
pkgrel=1
pkgdesc="A session manager for Xfce (GTK2 version)"
arch=('x86_64')
url="https://www.xfce.org/"
license=('GPL2')
groups=('xfce4-gtk2')
conflicts=("${_pkgbase}")
provides=("${_pkgbase}")
depends=('libxfce4ui-gtk2' 'libwnck' 'libsm' 'polkit' 'xorg-iceauth' 'xorg-xinit'
         'xorg-xrdb' 'which' 'polkit-gnome' 'hicolor-icon-theme')
makedepends=('intltool')
optdepends=('gnome-keyring: for keyring support when GNOME compatibility is enabled'
            'xscreensaver: for locking screen with xflock4'
            'gnome-screensaver: for locking screen with xflock4'
            'xlockmore: for locking screen with xflock4'
            'slock: for locking screen with xflock4')
source=(https://archive.xfce.org/src/xfce/${_pkgbase}/${pkgver%.*}/${_pkgbase}-${pkgver}.tar.bz2
        0001-Pass-VT-number-to-xinit-if-XDG_VTNR-is-set.patch
        0002-Make-verbose-logging-conditional-Bug-11698.patch
        0003-source-system-xinitrc-scripts.patch
        0004-screenlockers.patch
        xfce-polkit-gnome-authentication-agent-1.desktop)
sha256sums=('97d7f2a2d0af7f3623b68d1f04091e02913b28f9555dab8b0d26c8a1299d08fd'
            '7ea702a1d3391d36958cff57496ba2474592dd915cf7569a65501522c2410cf1'
            '6bbd714008f31198f9631cdfb3ed8aac1c780f00d15b81c32c00860ae37521a6'
            'a717a0ee6289c9ce06a8e18c6a7cb5a6d6f1769c05c456a6a84843df6a0111da'
            '1d4063889af073c3de221e0bbd3cacc11dfc95ee11f6e530c6e35f7714a6e295'
            '74c94c5f7893d714e04ec7d8b8520c978a5748757a0cdcf5128492f09f31b643')

prepare() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    # https://bugzilla.xfce.org/show_bug.cgi?id=11759
    patch -Np1 -i ../0001-Pass-VT-number-to-xinit-if-XDG_VTNR-is-set.patch

    # https://bugzilla.xfce.org/show_bug.cgi?id=11698
    patch -Np1 -i ../0002-Make-verbose-logging-conditional-Bug-11698.patch

    # https://bugzilla.xfce.org/show_bug.cgi?id=12754
    patch -Np1 -i ../0003-source-system-xinitrc-scripts.patch

    # https://git.xfce.org/xfce/xfce4-session/commit/?id=e940818853582290af21bf38d73ee26143d500ad
    # https://git.xfce.org/xfce/xfce4-session/commit/?id=495aac78058cd78e2d34505af204e72a1b4f19ac
    patch -Np1 -i ../0004-screenlockers.patch
}

build() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"

    ./configure \
        --prefix=/usr \
        --sysconfdir=/etc \
        --libexecdir=/usr/lib/xfce4 \
        --localstatedir=/var \
        --disable-static \
        --disable-debug
    make
}

package() {
    cd "${srcdir}/${_pkgbase}-${pkgver}"
    make DESTDIR="${pkgdir}" install

    # Provide a default PolicyKit Authentication Agent (FS#42569)
    install -d "${pkgdir}/etc/xdg/autostart"
    cp "${srcdir}/xfce-polkit-gnome-authentication-agent-1.desktop" \
        "${pkgdir}/etc/xdg/autostart/"
}
