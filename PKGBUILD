# Maintainer: robertfoster
# Contributor: Fabio Rämi <fabio[at]dynamix-tontechnik[dot]ch>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=friture
pkgver=0.49
pkgrel=3
pkgdesc="An application to visualize and analyze live audio data in real-time."
arch=(i686 x86_64)
url="https://friture.org/"
license=('GPL3')
depends=('python-appdirs' 'python-docutils' 'python-multipledispatch' 'python-numpy'
  'python-pa-ringbuffer' 'python-pyqt5' 'python-pyrr' 'python-rtmixer'
  'python-sounddevice')
optdepends=('jack: for JACK I/O support')
makedepends=('cython0' 'git' 'python-build' 'python-installer' 'python-setuptools-scm' 'python-wheel')
source=(
  "https://github.com/tlecomte/friture/archive/refs/tags/v${pkgver}.tar.gz"
  python3.11.patch
)

prepare() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  patch -Np1 -i ../python3.11.patch
}

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 -m build -nwx
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"

  python3 -m installer --destdir="$pkgdir" dist/*.whl

  install -Dm644 resources/images/friture.iconset/icon_512x512.png \
    "${pkgdir}/usr/share/pixmaps/${pkgname}.png"
  install -Dm644 "appimage/${pkgname}.desktop" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
  sed -i "s|usr|/usr|g" \
    "${pkgdir}/usr/share/applications/${pkgname}.desktop"
}

sha256sums=('9643c56c4901ae892e16a35c418099bb28784bc4baeebfcf1cd8ea0f9b5de743'
  '253b32b6e4b4855fe06f9fc8b4a6ed03eb0241a434ddc6ad9baa2bf2b3939250')
