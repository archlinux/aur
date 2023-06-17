# Maintainer: Sumner Evans <sumner.evans98 at gmail dot com>

pkgbase='sublime-music'
pkgname=('sublime-music')
_module='sublime_music'
pkgver='0.12.0'
pkgrel=2
pkgdesc='A native Subsonic/Airsonic/*sonic client for Linux. Built using Python and GTK+.'
url='https://sublimemusic.app'
depends=(
    'python'
    'python-bleach'
    'python-bottle'
    'python-dataclasses-json'
    'python-dateutil'
    'python-deepdiff'
    'python-gobject'
    'python-levenshtein'
    'python-mpv'
    'python-peewee'
    'python-pychromecast'
    'python-requests'
    'python-semver'
    'python-thefuzz'
)
optdepends=(
    'libnm-glib: for changing the Subsonic server address depending on what SSID you are connected to'
    'libnotify: for system song notification support'
    'python-keyring: support for storing passwords in the system keyring'
)
makedepends=(
    'python-build'
    'python-flit-core'
    'python-installer'
    'python-sphinx'
)
license=('GPL3')
arch=('any')
source=(
    'https://files.pythonhosted.org/packages/source/s/sublime-music/sublime_music-0.12.0.tar.gz'
    'https://github.com/sublime-music/sublime-music/archive/refs/tags/v0.12.0.tar.gz'
)
sha256sums=('458bacab6be5c926852d4a43ce675b5e767210287844c6fce921832e263db3c0'
            'faaf102fd790ecea3d966c9d6e305567c734a1df30eaa6bbdedf93d863bc7435')


build() {
    cd "${srcdir}/${_module}-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
    pushd "${_module}-${pkgver}"
    python -m installer --destdir="${pkgdir}" dist/*.whl

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

    pushd "sublime-music-${pkgver}"

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
