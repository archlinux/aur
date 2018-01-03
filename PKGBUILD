# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Co-Maintainer: Raphael Scholer <rascholer@gmail.com>

_pkgbase=quodlibet
pkgname=exfalso
pkgver=4.0.0
pkgrel=1
pkgdesc="GTK+ audio tag editor"
arch=('any')
url="https://quodlibet.readthedocs.io/"
license=('GPL2')
depends=('gtk3' 'python-mutagen' 'python-gobject' 'python-cairo' 'python-feedparser')
makedepends=('intltool' 'gettext')
optdepends=('gst-plugins-bad: for "Acoustic Fingerprint" plugins'
            'gst-plugins-good: for "Replay Gain" plugin'
            'kakasi: for "Kana/Kanji Simple Inverter" plugin'
            'python-dbus: for "Browse Folders" plugin'
            'python-musicbrainzngs: for "MusicBrainz Lookup" plugin')
conflicts=("${pkgbase}")
source=("https://github.com/${_pkgbase}/${_pkgbase}/releases/download/release-${pkgver}/${_pkgbase}-${pkgver}.tar.gz"{,.sig})
sha256sums=('217c9d41e2d97c98c0814f1abbeef47a1f5a37583aaf973501fa21ae3b63a076'
            'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter

build() {
    cd ${_pkgbase}-${pkgver}

    python setup.py build
}

package_exfalso() {
    cd ${_pkgbase}-${pkgver}

    python setup.py install --root="${pkgdir}" --skip-build --optimize=1

    # Remove Quod Libet
    rm    "${pkgdir}"/usr/bin/${_pkgbase}
    rm    "${pkgdir}"/usr/share/appdata/${_pkgbase}.appdata.xml
    rm    "${pkgdir}"/usr/share/applications/${_pkgbase}.desktop
    rm -r "${pkgdir}"/usr/share/dbus-1/
    rm -r "${pkgdir}"/usr/share/gnome-shell/
    for i in 16 24 32 48 64
    do
        rm "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${_pkgbase}.png
    done
    rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_pkgbase}.svg
    rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${_pkgbase}-symbolic.svg
    rm    "${pkgdir}"/usr/share/man/man1/${_pkgbase}.1
    rm -r "${pkgdir}"/usr/share/zsh/


    # Remove plugins
    site_packages="$(find ${pkgdir} -type d -name site-packages)"

    for package in _shared covers events gstreamer playlist playorder query
    do
        rm -r "${site_packages}/${_pkgbase}/ext/${package}"
    done

    find "${site_packages}/${_pkgbase}/ext/songsmenu" \
        -type f \( \
            -name "bookmarks.*" \
            -o -name "filterall.*" \
            -o -name "filterbrowser.*" \
            -o -name "editplaycount.*" \
            -o -name "importexport.*"\
            -o -name "lastfmsync.*"\
            -o -name "migratemetadata.*"\
            -o -name "exact_rating.*"\
            -o -name "html.*"\
            -o -name "playlist.*" \
            -o -name "forcewrite.*" \
        \) -delete
}

# vim:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab:
