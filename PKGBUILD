# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Co-Maintainer: Raphael Scholer <rascholer@gmail.com>

_pkgbase=quodlibet
pkgname=exfalso
pkgver=4.1.0
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
sha256sums=('5f54a61fe18cb1d2b8642f22bba144cb753ee5e1ae5d79c9798ac4f235e99ded'
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
    internal_name="io.github.${_pkgbase}.QuodLibet"
    rm    "${pkgdir}"/usr/bin/${_pkgbase}
    rm    "${pkgdir}"/usr/share/appdata/${internal_name}.appdata.xml
    rm    "${pkgdir}"/usr/share/applications/${internal_name}.desktop
    rm -r "${pkgdir}"/usr/share/dbus-1/
    rm -r "${pkgdir}"/usr/share/gnome-shell/
    for i in 16 24 32 48 64 128 256
    do
        rm "${pkgdir}"/usr/share/icons/hicolor/${i}x${i}/apps/${internal_name}.png
    done
    rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${internal_name}.svg
    rm    "${pkgdir}"/usr/share/icons/hicolor/scalable/apps/${internal_name}-symbolic.svg
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
            -o -name "duplicates.*" \
            -o -name "editplaycount.*" \
            -o -name "exact_rating.*"\
            -o -name "filterall.*" \
            -o -name "filterbrowser.*" \
            -o -name "forcewrite.*" \
            -o -name "html.*" \
            -o -name "ifp.*" \
            -o -name "importexport.*" \
            -o -name "k3b.*" \
            -o -name "lastfmsync.*" \
            -o -name "migratemetadata.*" \
            -o -name "playlist.*" \
            -o -name "refresh.*" \
        \) -delete
}

# vim:set tabstop=4 softtabstop=4 shiftwidth=4 expandtab:
