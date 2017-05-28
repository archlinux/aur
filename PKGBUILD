# Maintainer: Bruno Pagani (a.k.a. ArchangeGabriel) <bruno.n.pagani at gmail dot com>
# Co-Maintainer: Raphael Scholer <rascholer@gmail.com>

_pkgbase=quodlibet
pkgname=exfalso
pkgver=3.9.0
pkgrel=1
pkgdesc="GTK+ audio tag editor"
arch=('any')
url="https://${_pkgbase}.readthedocs.io/"
license=('GPL2')
depends=('gtk3' 'python-mutagen' 'python-gobject' 'python-cairo' 'python-feedparser')
makedepends=('intltool' 'gettext')
#optdepends=('python-musicbrainzngs: for "MusicBrainz Lookup" plugin')
conflicts=("${pkgbase}")
source=("https://github.com/${_pkgbase}/${_pkgbase}/releases/download/release-${pkgver}/${_pkgbase}-${pkgver}.tar.gz"{,.sig})
sha256sums=('97e3f30d2bed8074f271b95093372e1c61897cefe5047845ba118a663ada4fb7'
            'SKIP')
validpgpkeys=('0EBF782C5D53F7E5FB02A66746BD761F7A49B0EC') # Christoph Reiter

prepare() {
    cd ${_pkgbase}-${pkgver}

    sed -i 's|if PY2 or is_release():|if PY2:|' quodlibet/_init.py
}

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

    # Remove Plugins (TODO: Inspect which one are useful for ExFalso and what are their dependencies)
    rm -r "${pkgdir}"/usr/lib/python3.6/site-packages/${_pkgbase}/ext/
}
