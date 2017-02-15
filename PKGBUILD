# Maintainer: codl <aur@codl.fr>
pkgname='urn-git'
pkgver=r94.8494e08
pkgrel=2
pkgdesc='Split timer for speedrunning'
url='https://github.com/3snowp7im/urn'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('gtk3' 'jansson' 'hicolor-icon-theme')
makedepends=('imagemagick' 'xxd')

install='urn-git.install'

source=('git+https://github.com/3snowp7im/urn.git'
        'git+https://github.com/3snowp7im/urn-themes.git'
        'urn.desktop')
sha1sums=('SKIP'
          'SKIP'
          '05622115481d0b1485c69ad08ca7f494ea575781')

pkgver() {
    cd "$SRCDEST/urn"
    (
        set -o pipefail
        git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare() {
    cd "$srcdir/urn"
    git submodule init
    git config submodule.urn-themes.url "$srcdir/urn-themes"
    git submodule update
}

build() {
    cd "$srcdir/urn"
    make
}

package () {
    install -D -m 644 urn.desktop "$pkgdir/usr/share/applications/urn.desktop"
    cd "$srcdir/urn"
    install -D urn-gtk "$pkgdir/usr/bin/urn-gtk"
    install -D -m 644 urn-gtk.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/urn-gtk.gschema.xml"
    mkdir -p "$pkgdir/usr/share/urn/themes"
    cp -a themes/* "$pkgdir/usr/share/urn/themes/"
    mkdir -p "$pkgdir/usr/share/urn/splits"
    cp -a splits/* "$pkgdir/usr/share/urn/splits/"

    for size in 16 22 24 32 36 48 64 72 96 128 256 512; do
        convert urn.svg -resize ${size}x${size} urn.png
        install -D -m 644 urn.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/urn.png"
    done
}
