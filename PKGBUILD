# Contributor: Marcell Meszaros < marcell.meszaros AT runbox.eu >
# Contributor: Joe Bashe <joe@bashe.joe>
# Contributor: Kim Scarborough <kim@scarborough.kim>

pkgname='deluge1'
_basename="${pkgname%1}"
pkgver=1.3.15
pkgrel=11
pkgdesc='BitTorrent client with multiple interfaces, using a client/server model (legacy 1.3.x version)'
arch=('any')
url='https://deluge-torrent.org/'
license=('GPL3')
depends=(
    'python2'
)
makedepends=(
    'intltool'
    'python2-setuptools'
)
optdepends=(
    'libtorrent-rasterbar<=1:1.2.10-4: for the daemon'
    'python2-geoip: for peer IP geolocation'
    'python2-pygame: audible notifications for GTK client'
    'python2-libappindicator: appindicator notifications for GTK client'
    'pygtk: required for GTK client'
    'librsvg: required for GTK client'
    'xdg-utils: required for GTK client'
    'python2-mako: required for web client'
    'python2-pillow: allow resizing of tracker icons'
    'python2-setproctitle: properly name processes during runtime'
)
provides=(
    "${_basename}=${pkgver}"
    "${_basename}-gtk=${pkgver}"
)
conflicts=(
    "${_basename}"
    "${_basename}-gtk"
)
backup=("etc/conf.d/${_basename}d")
# ftp.osuosl.org is supposedly the source, but the mirrors have this in a different place than the master.
# Using the master's URL until they figure it out.
_tarname="${_basename}-${pkgver}"
source=("https://ftp-osl.osuosl.org/pub/deluge/source/1.3/${_tarname}.tar.xz"
        "${_basename}d.service"
        "${_basename}d.environment"
        "${_basename}-web.service"
        'prefdialog.patch')
sha256sums=('a96405140e3cbc569e6e056165e289a5e9ec66e036c327f3912c73d049ccf92c'
            '74f05cf43eae69f8ee8d257443ecdc0b0bbcc82cfb1bdb926ffe0a191164d699'
            '70f5e700570e5286f785a4bd23c23d39ae72c5662d76da9354ace46e8f6e28fd'
            '5d434c265d69773942134c143598fa2aa413989097cc30c007310801270f8b87'
            'b4c397cc4ffede983554331c2b31e40feadda3a03e2ee377c3892c88b096b564')

prepare() {
    cd "${_tarname}"
    patch --verbose -p1 -i '../prefdialog.patch'

    echo 'Changing hashbangs in *.py files to refer to python2'
    sed -e '1s|#![ ]*/usr/bin/python[^2]\?|#!/usr/bin/python2|' \
        -e '1s|#![ ]*/usr/bin/env python[^2]\?|#!/usr/bin/env python2|' \
        -e '1s|#![ ]*/bin/env python[^2]\?|#!/usr/bin/env python2|' \
        -i $(find . -name '*.py')

    echo "Disabling 'get_libtorrent.sh': don't try to download libtorrent from SVN"
    sed -e '5s|^$|exit 127|' \
        -i 'get_libtorrent.sh'
}

build() {
    cd "${_tarname}"
    python2 setup.py build
}

package() {
    depends=(
        'hicolor-icon-theme'
        'python2-chardet'
        'python2-pyopenssl'
        'python2-pyxdg'
        'python2-twisted'
    )

    cd "${_tarname}"
    python2 setup.py install --prefix='/usr' --root="${pkgdir}" --optimize=1 --skip-build

    cd "${srcdir}"
    install -Dm 644 "${_basename}d.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 "${_basename}-web.service" -t "${pkgdir}/usr/lib/systemd/system"
    install -Dm 644 "${_basename}d.environment" "${pkgdir}/etc/conf.d/${_basename}d"

    echo 'u deluge - "Deluge BitTorrent daemon" /srv/deluge' |
        install -Dm 644 /dev/stdin "${pkgdir}/usr/lib/sysusers.d/${_basename}.conf"
    echo 'd /srv/deluge 0770 deluge deluge' |
          install -Dm 644 /dev/stdin "${pkgdir}/usr/lib/tmpfiles.d/${_basename}.conf"
}
