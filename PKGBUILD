# Maintainer: Varakh <varakh at varakh dot de>
# Revived from: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
_pyname=MPD_sima
pkgver=0.18.1
pkgrel=1
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://kaliko.me/code/mpd-sima/"
license=('GPL')
depends=('python>=3.2' 'python-musicpd>=0.4.1' 'python-requests>=2.4.0')
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz" "service")
sha256sums=('0fbbe519b2c5aa9b0a5d14f827c63b3619cbc17a836ef3fa3db26e42aabc11eb'
            '864b997cbf53864120aba183f2642ad6a632a0bcde3c4701779cc9a25cc0f448')

prepare() {
  sed 's/multi-user.target/default.target/;/User=%i/d' service > user.service
}

package() {
    cd "${srcdir}/MPD_sima-${pkgver}"
    /usr/bin/env python setup.py install --prefix=/usr --root="$pkgdir" || return 1

    # Install systemd service
    install -Dm644 "${srcdir}"/service \
        "${pkgdir}"/usr/lib/systemd/system/mpdsima@.service
    install -Dm644 "${srcdir}"/user.service \
        "${pkgdir}"/usr/lib/systemd/user/mpdsima.service
}
