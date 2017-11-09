# Maintainer: Varakh <varakh at varakh dot de>
# Revived from: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.14.4
pkgrel=1
pkgdesc="Automagically add title to mpd playlist based on last.fm recomendations"
arch=('any')
url="http://kaliko.me/code/mpd-sima/"
license=('GPL')
depends=('python>=3.2' 'python-musicpd>=0.4.0' 'python-requests>=2.2.0')
makedepends=('python-setuptools')
source=("http://media.kaliko.me/src/sima/releases/MPD_sima-$pkgver.tar.xz" "service")

prepare() {
  sed 's/multi-user.target/default.target/;/User=%i/d' service > user.service
}

package() {

    # Setup
    cd "${srcdir}/MPD_sima-${pkgver}"
    /usr/bin/env python setup.py install --prefix=/usr --root="$pkgdir" || return 1

    # Install systemd service
	install -Dm644 "${srcdir}"/service \
	    "${pkgdir}"/usr/lib/systemd/system/mpdsima@.service
	install -Dm644 "${srcdir}"/user.service \
	    "${pkgdir}"/usr/lib/systemd/user/mpdsima.service
}

sha256sums=('75165a833ed0dfa0e56f8cdfa4ec7864f4a06c3fffa4e1f26ca4bf977f24fa47'
            '864b997cbf53864120aba183f2642ad6a632a0bcde3c4701779cc9a25cc0f448')
