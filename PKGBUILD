# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music-git'
pkgname=('sublime-music-git')
_module='sublime-music'
pkgver=v0.11.16.r22.gfd40be6
pkgrel=1
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Built using Python and GTK+.'
url='https://sublimemusic.app'
provides=('sublime-music')
conflicts=('sublime-music')
depends=(
    'python'
    'python-bleach'
    'python-dataclasses-json'
    'python-dateutil'
    'python-deepdiff'
    'python-fuzzywuzzy'
    'python-gobject'
    'python-levenshtein'
    'python-mpv'
    'python-peewee'
    'python-requests'
    'python-semver'
)
optdepends=(
    'libnm-glib: for changing the Subsonic server address depending on what SSID you are connected to'
    'libnotify: for system song notification support'
    'python-keyring: support for storing passwords in the system keyring'
    'python-pychromecast: support for casting to Chromecast devices'
    'python-bottle: support for casting downloaded files to Chromecasts on the same LAN'
)
makedepends=(
    'python-pip'
    'python-poetry'
    'python-sphinx'
    'tar'
)
license=('GPL3')
arch=('any')
source=(
    'sublime-music-git::git+https://gitlab.com/sublime-music/sublime-music.git'
    'sublime-music.desktop'
)
sha256sums=('SKIP'
            'fd84f6b408aa78a21a2990a0b78c4851db80b7ef0f7e7573cc82b57d8abb4d0c')

pkgver() {
    cd "${srcdir}/${pkgname}"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}


build() {
    cd "${srcdir}/${pkgname}"
    poetry build
}

package() {
    python -m installer --destdir="$pkgdir" "sublime-music-git/dist"/*.whl

    # Move all of the package data resources to ${pkgdir}/usr/share/sublime-music
    data_dir=${pkgdir}/usr/share/sublime-music
    mkdir -p $data_dir/adapters/subsonic $data_dir/dbus $data_dir/ui
    pushd ${pkgdir}/usr/lib/python3.*/site-packages/sublime_music
    mv adapters/icons $data_dir/adapters
    mv adapters/images $data_dir/adapters
    mv adapters/subsonic/icons $data_dir/adapters/subsonic
    mv dbus/mpris_specs $data_dir/dbus
    mv ui/icons $data_dir/ui
    mv ui/images $data_dir/ui
    popd

    desktop-file-install --dir=${pkgdir}/usr/share/applications sublime-music.desktop
#    install -Dm644 sublime-music.metainfo.xml "${pkgdir}/usr/share/metainfo/sublime-music.metainfo.xml"

#    pushd docs
#    make man
#    install -Dm644 ./_build/man/sublime-music.1 "${pkgdir}/usr/share/man/man1/sublime-music.1"
#    popd

#    pushd logo/rendered
#    for size in 16 22 32 48 64 72 96 128 192 512 1024; do
#        install -Dm644 ${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/sublime-music.png
#    done
#    popd
}
