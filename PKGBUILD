# Maintainer: Que Quotion <quequotion@bugmenot.com>

pkgname=pantheon-qq-default-settings-git
pkgver=r340.09ae797
pkgrel=1
arch=('any')
url='https://github.com/elementary/default-settings'
license=('GPL')
groups=('pantheon-qq' 'pantheon-unstable')
makedepends=('git' 'meson')
pkgdesc='Default settings for Pantheon derivatives'
depends=('elementary-icon-theme' 'gtk-theme-elementary-git'
         'gnome-themes-standard' ttf-{droid,opensans,roboto-mono})
optdepends=('elementary-wallpapers-git')
groups=(pantheon-qq)
provides=(pantheon-default-settings{,-git})
conflicts=(pantheon-default-settings{,-git})
source=('pantheon-default-settings::git+https://github.com/elementary/default-settings.git#branch=meson'
        'arch-tweaks.patch'
        'leave-bg-alone.patch')
sha256sums=('SKIP'
            '742812de8dbbaf641a7cc531d4ab2ad21408db5017dff5ce52dffda474b61a3f'
            '3732b2209d28c68bb3a11da5726f486db1fca9fcb3776bf58f83c81678b84211')

pkgver() {
    cd $srcdir/pantheon-default-settings

    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd $srcdir/pantheon-default-settings

    #Remove ubuntu-specific settings
    patch -Np1 -i ../arch-tweaks.patch

    #Don't touch any background-related settings
    patch -Np2 -i ../leave-bg-alone.patch
}

build() {
    cd $srcdir/pantheon-default-settings
    [ -d build ] && rm -rf build
    arch-meson build
}

package() {
    cd $srcdir/pantheon-default-settings
    DESTDIR=$pkgdir ninja -C build install

    install -dm 755 "${pkgdir}"/usr/share/glib-2.0/schemas
    install -m 644 debian/elementary-default-settings.gsettings-override "${pkgdir}"/usr/share/glib-2.0/schemas/25_pantheon-default-settings.gschema.override
    install -Dm 644 $pkgdir/etc/lightdm/lightdm.conf $pkgdir/etc/skel/.config/lightdm/lightdm.conf
    rm $pkgdir/etc/lightdm/lightdm.conf
    install -Dm 644 $pkgdir/etc/gtk-3.0/settings.ini $pkgdir/etc/skel/.config/gtk-3.0/settings.ini
    rm $pkgdir/etc/gtk-3.0/settings.ini
}
