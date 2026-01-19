# Maintainer: sfs <sfslinux at gmail.com>

pkgname=gnome-desktop-item-edit-bin
pkgver=3.30.0
pkgrel=1
pkgdesc="Old gnome desktop item edit"
arch=('x86_64')
url="https://archive.archlinux.org"
license=('GPL-2.0-or-later AND LGPL-2.1-or-later')
depends=(
  'gtk3'
  'at-spi2-core'
  'cairo'
  'dconf'
  )
makedepends=(perl)
source=(
    "https://archive.archlinux.org/packages/g/gnome-panel/gnome-panel-3.30.0-2-x86_64.pkg.tar.xz"
    "https://github.com/mate-desktop/mate-panel/raw/refs/heads/master/icons/scalable/mate-panel-launcher.svg"
    "gn-launcher-create.desktop"
    "gn-launcher.desktop"
    )
sha256sums=(
    '6cdadd9f4d2b4ca1724c555e422352653be42567d352be173256507ca3edf8a8'
    '388a940186a984563b44d034ac2478d86c9e3028e762ab6efe028dcb93bf015a'
    '260af3b32b5c55dabce66bfc3b97c203f040f669307e02298ef60dbdf7ed8893'
    '0d4a5544d4730b1b949c9f56278701e9c501a6f8aa73830499774e1bf7164c1c'
    )

package() {
    install -D -m0644 gn-launcher.desktop "${pkgdir}"/usr/share/application/gn-launcher.desktop
    install -D -m0644 gn-launcher-create.desktop "${pkgdir}"/etc/skel/Desktop/gn-launcher-create.desktop
    install -D -m0644 mate-panel-launcher.svg "${pkgdir}"/usr/share/pixmaps/gn-launcher.svg

    install -d "${pkgdir}/usr/bin"
    install -d "${pkgdir}/usr/share/locale"

    cp "${srcdir}/usr/bin/gnome-desktop-item-edit" "${pkgdir}/usr/bin/gn-launcher"

    perl -pi -e 's|/usr/share/locale\0gnome-panel|/usr/share/locale\0gn-launcher|g' "${pkgdir}/usr/bin/gn-launcher"
    cd "${srcdir}/usr/share/locale"
    for lang in *; do
        if [ -f "${lang}/LC_MESSAGES/gnome-panel.mo" ]; then
            install -d "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES"
            cp "${lang}/LC_MESSAGES/gnome-panel.mo" \
               "${pkgdir}/usr/share/locale/${lang}/LC_MESSAGES/gn-launcher.mo"
        fi
    done
}
