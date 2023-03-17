# Thanks to the maintainer(s) of chirp-daily
# Maintainer: K5TRP <K5TRP@onlyhams.ca>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ashley Roll (ash@digitalnemesis.com)
# Contributor: Erez Raviv (erezraviv@gmail.com)

pkgname=chirp-next
pkgver=20230317
pkgrel=1
pkgdesc="GUI tool for programming ham radios, built from daily build"
arch=('any')
url="https://chirp.danplanet.com"
license=('GPL3')
depends=('python-six' 'python-pyserial' 'python-future' 'python-requests' 'python-suds' 'python-yattag' 'python-wxpython')
optdepends=('hamradio-menus: XDG menus for ham radio software')
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=(!emptydirs)
conflicts=('chirp' 'chirp-daily')
provides=(chirp)
install=$pkgname.install
source=("${pkgname}-${pkgver}.tar.gz::https://trac.chirp.danplanet.com/chirp_next/next-$pkgver/chirp-$pkgver.tar.gz" "https://trac.chirp.danplanet.com/chirp_next/next-${pkgver}/chirp-next-${pkgver}-win32.zip")
# Checksums: https://trac.chirp.danplanet.com/chirp_next/next-$pkgver/SHA1SUM
sha1sums=('6c6625ca0d86b48ad97e1e3ed9b24e1a5e5f65c1' 'ce956d03b0205fb31fd67c12efa031fa60af3a3b')

build() {
    cd "chirp-$pkgver"
    python -m build --wheel --no-isolation
}

package() {
  cd "chirp-$pkgver"
  python -m installer --destdir="$pkgdir" dist/*.whl
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirpw.1" "${pkgdir}/usr/share/man/man1/chirpw.1"
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirp.desktop" "${pkgdir}/usr/share/applications/chirp.desktop"
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirp.png" "${pkgdir}/usr/share/pixmaps/chirp.png"
  cp -dr --preserve=mode,timestamp "${srcdir}/chirp/locale/" "${pkgdir}/usr/lib/python3.10/site-packages/chirp/locale"
}
