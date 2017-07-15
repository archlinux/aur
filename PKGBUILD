# Maintainer: Varakh <varakh at varakh dot de>
# Revived from: Rasmus Steinke <rasi at xssn dot at>
# Revived from: Vincent Berset <msieurhappy@gmail.com>

pkgname=mpd-sima
pkgver=0.14.3
pkgrel=3
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

sha256sums=('2e14fdbf9e5346eb5fd88c2db57f2634fca5efefbd9c01865ef842736e95caa8'
            'bf039031f697f612aa19dececc5615e24a818af2da193b2bcabf209d21b24266')
