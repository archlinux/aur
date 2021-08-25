# Maintainer: The-Repo-Club <The-Repo-Club@github.com>
# Contributor: The-Repo-Club <The-Repo-Club@github.com>
pkgname=('repowm' 'repowm-schemas' 'repomenu' 'repomenu-extra' 'repomenu-schemas')
pkgbase=repoos
pkgver=2021.08.25
pkgrel=1
pkgdesc="A really cool os with all its stuff installed."
url="https://github.com/ArchAUR/$pkgbase"
arch=('i686' 'x86_64')
groups=('therepoclub')
license=('MIT' 'GPL3')
options=(zipman)
makedepends=('gobject-introspection' 'git' 'meson')
source=("repowm-2021.08.21.tar.gz::https://github.com/The-Repo-Club/repowm/archive/2021.08.21.tar.gz"
        "repowm-schemas-2021.08.21.tar.gz::https://github.com/The-Repo-Club/repowm-schemas/archive/2021.08.21.tar.gz"
        "repomenu-2021.08.25.tar.gz::https://github.com/The-Repo-Club/repomenu/archive/2021.08.25.tar.gz"
        "repomenu-extra-2021.08.24.tar.gz::https://github.com/The-Repo-Club/repomenu-extra/archive/2021.08.24.tar.gz"
        "repomenu-schemas-2021.08.21.tar.gz::https://github.com/The-Repo-Club/repomenu-schemas/archive/2021.08.21.tar.gz")
sha256sums=('cebe216df810b553c0a51420cc4fa9f61a550ab2fa35523e7ae096b48968a95c'
        '9e0072255c06e9db089fc9de8741aac08f4014636ea7bf202ac0b914b23972ec'
        '29716d9d96a62fe2bd60d5f0459238ed9d4835d2efa7836dd2f07ce64ea01746'
        'e7fbe5b79377c8cc20b1640fbcb37319529f74f7eb7c44728c5d573c096d56b6'
        'd94d80452a44659db397f80b5a4964a05ee1718981ab7f2e80be782858c959cc')

build_repowm() {
    cd "$srcdir/repowm-2021.08.21"
    make \
        X11INC=/usr/include/X11 \
        X11LIB=/usr/lib/X11 \
        FREETYPEINC=/usr/include/freetype2
}

package_repowm() {
    install=repowm.install
    pkgdesc="A dynamic window manager for X"
    license=('MIT')

    depends=('libx11' 'libxinerama' 'libxft' 'freetype2' 'repomenu')
    optdepends=('repowm-schemas: gsettings for repowm'
        'siji: font used by default'
        'nerd-fonts-fira-code: font used by default'
        'adobe-source-code-pro-fonts: font used by default'
        'ttf-material-design-icons: font used by default'
        'ttf-remixicon: font used by default')

    cd "$srcdir/repowm-2021.08.21"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/repowm/LICENSE
}

build_repowm-schemas() {
    cd "$srcdir/repowm-schemas-2021.08.21"

    arch-meson $srcdir/repowm-schemas-2021.08.21 build
    ninja -C build

    DESTDIR="$pkgdir" meson install -C build
}

package_repowm-schemas() {
    pkgdesc="schemas for instawm"
    provides=("repowm-schemas=2021.08.21")
    depends=('glib2' 'dconf')
    license=('GPL3')

    cd "$srcdir/repowm-schemas-2021.08.21"
    mkdir -p $pkgdir/usr/bin
    cp -a $srcdir/repowm-schemas-2021.08.21/repowm-schemas $pkgdir/usr/bin/repowm-schemas

}

build_repomenu() {
    cd "$srcdir/repomenu-2021.08.25"

    make \
        X11INC=/usr/include/X11 \
        X11LIB=/usr/lib/X11
}

package_repomenu() {
    pkgdesc="dmenu like menu with the Dracula theme"
    provides=(repomenu dmenu)
    conflicts=(dmenu)
    replaces=(dmenu)
    license=('MIT')

    depends=('python' 'libxinerama' 'libxft')
    optdepends=('repomenu-extra: Extra script that repomenu can use'
        'repomenu-schemas: gsettings for repomenu'
        'siji: font used by default'
        'nerd-fonts-fira-code: font used by default'
        'adobe-source-code-pro-fonts: font used by default'
        'ttf-material-design-icons: font used by default'
        'ttf-remixicon: font used by default')

    cd "$srcdir/repomenu-2021.08.25"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/repomenu/LICENSE
}

package_repomenu-extra() {
    pkgdesc="addons for repomenu"
    depends=('bash' 'glib2' 'autorandr' 'repomenu' 'repomenu-schemas' 'networkmanager')
    optdepends=('cutycapt: Taking screenshots with bm command.' 'instaaur: Using the aur with pacman script.' 'ffmpeg: music script depends on this.')
    provides=(repomenu-extra)
    license=('GPL3')

    cd "$srcdir/repomenu-extra-2021.08.24"
    make PREFIX=/usr DESTDIR="$pkgdir" install
    install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/repomenu-extra/LICENSE
}

build_repomenu-schemas() {
    cd "$srcdir/repomenu-schemas-2021.08.21"

    arch-meson $srcdir/repomenu-schemas-2021.08.21 build
    ninja -C build

    DESTDIR="$pkgdir" meson install -C build
}

package_repomenu-schemas() {
    pkgdesc="schemas for repomenu"
    provides=("repomenu-schemas=2021.08.21")
    depends=('glib2' 'dconf')
    license=('GPL3')
}
