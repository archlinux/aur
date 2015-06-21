# Maintainer: codl <codl@codl.fr>
pkgname='urn-git'
pkgver=r82.0513661
pkgrel=2
pkgdesc='Split timer for speedrunning'
url='https://github.com/3snowp7im/urn'
arch=('i686' 'x86_64')
license=('GPL3')

depends=('gtk3' 'jansson' 'hicolor-icon-theme')
makedepends=('imagemagick' 'vim')

install='urn-git.install'

source=('git+https://github.com/3snowp7im/urn.git'
        'git+https://github.com/3snowp7im/urn-themes.git')
sha1sums=('SKIP' 'SKIP')

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
    echo $srcdir
    cd "$srcdir/urn"
    install -D urn-gtk "$pkgdir/usr/bin/urn"
    install -D -m 644 urn.desktop "$pkgdir/usr/share/applications/urn.desktop"
    install -D -m 644 urn-gtk.gschema.xml "$pkgdir/usr/share/glib-2.0/schemas/urn-gtk.gschema.xml"
    mkdir -p "$pkgdir/usr/share/urn/themes"
    rsync -a themes/ "$pkgdir/usr/share/urn/themes/"

    for size in 16 22 24 32 36 48 64 72 96 128 256 512; do
        convert urn.svg -resize ${size}x${size} urn.png
        install -D -m 644 urn.png "$pkgdir/usr/share/icons/hicolor/${size}x${size}/apps/urn.png"
    done
}
