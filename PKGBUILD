# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime_music'
pkgver='0.11.16'
pkgrel=4
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Built using Python and GTK+.'
url='https://sublimemusic.app'
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
    'python-setuptools'
    'python-sphinx'
)
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/s/sublime-music/sublime_music-0.11.16.tar.gz'
    'https://gitlab.com/sumner/sublime-music/-/archive/v0.11.16/sublime-music-v0.11.16.tar.gz'
)
sha256sums=('d798fa43b8bb8ebe9a0714927cc185283ae212bf52a9391ebedba8f22fde88e0'
            '84165af03c7e9ae3a54801cd5b2903ed26a5fed5b35e4b561b0f8d1f6b2c5832')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python setup.py build
}

package() {
    pushd "${_module}-${pkgver}"
    python setup.py install --root="${pkgdir}" --optimize=1 --skip-build

    # Move all of the package data resources to ${pkgdir}/usr/share/sublime-music
    data_dir=${pkgdir}/usr/share/sublime-music
    mkdir -p ${data_dir}/adapters/subsonic ${data_dir}/dbus ${data_dir}/ui
    pushd ${pkgdir}/usr/lib/python3.11/site-packages/sublime_music
    mv adapters/icons ${data_dir}/adapters
    mv adapters/images ${data_dir}/adapters
    mv adapters/subsonic/icons ${data_dir}/adapters/subsonic
    mv dbus/mpris_specs ${data_dir}/dbus
    mv ui/icons ${data_dir}/ui
    mv ui/images ${data_dir}/ui
    popd

    popd

    pushd "sublime-music-v${pkgver}"

    desktop-file-install --dir=${pkgdir}/usr/share/applications sublime-music.desktop
    install -Dm644 sublime-music.metainfo.xml "${pkgdir}/usr/share/metainfo/sublime-music.metainfo.xml"

    pushd docs
    make man
    install -Dm644 ./_build/man/sublime-music.1 "${pkgdir}/usr/share/man/man1/sublime-music.1"
    popd

    pushd logo/rendered
    for size in 16 22 32 48 64 72 96 128 192 512 1024; do
        install -Dm644 ${size}.png ${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/sublime-music.png
    done
    popd

    popd  # pkg
}
