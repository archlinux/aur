# Maintainer: Hans-Nikolai Viessmann <hans AT viess DOT mn>

pkgname=python-eduvpn-client
_name=linux-app
pkgver=4.7.1
pkgrel=1
pkgdesc="Linux client and Python client API for eduVPN"
arch=('any')
url="https://codeberg.org/eduVPN/linux-app"
license=('GPL-3.0-or-later')
depends=('python' 'glib2' 'python-gobject' 'hicolor-icon-theme'
         'python-eduvpn_common>=5.0.0' 'libsecret' 'gdk-pixbuf2'
         'libnotify' 'pango' 'gtk3' 'libnm' 'networkmanager-openvpn')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
source=("$url/releases/download/${pkgver}/${_name}-${pkgver}.tar".{xz,xz.asc})
sha256sums=('92009f3cc0de61295b88807e5d84874afd634653a4ad4626509592caae42b190'
            'SKIP')
validpgpkeys=('227FF3F8F829D9A9314D9EBA02BB8048BBFF222C')

# NOTE GPG keys can be found under the `keys/` directory in `src/python-eduvpn-client-$pkgver`.

build() {
    cd "${_name}-${pkgver}"
    /usr/bin/python -m build --wheel --no-isolation --skip-dependency-check
}

package() {
    cd "${_name}-${pkgver}"
    PYTHONHASHSEED=0 /usr/bin/python -m installer --destdir="${pkgdir}" dist/*.whl

    # setup desktop assets
    local python_version=$(/usr/bin/python -c 'import sys; print(".".join(map(str, sys.version_info[:2])))')
    install -d ${pkgdir}/usr/share
    cp -r ${pkgdir}/usr/lib/python${python_version}/site-packages/eduvpn/data/share/* ${pkgdir}/usr/share/
}
