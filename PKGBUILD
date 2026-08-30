# Maintainer: Gary S Martin (K6AE) <gsm--3782cielo+chirp[at]martin-fam[dot]net>
# Thanks to the maintainer(s) of chirp-daily
# Contributor: WT5A <K5TRP[at]onlyhams[dot]ca>
# Contributor: Helmut Stult <hst[at]e-mail[dot]de>
# Contributor: 0b100100 <0b100100 at protonmail dot ch>
# Contributor: Ashley Roll (ash@digitalnemesis.com)
# Contributor: Erez Raviv (erezraviv@gmail.com)

pkgname=chirp-next
pkgver=20260828
pkgrel=1
epoch=1
pkgdesc="GUI tool for programming ham radios"
arch=('any')
url="https://chirpmyradio.com/projects/chirp/wiki/Home"
license=('GPL-3.0-or-later')
depends=('python-pyserial' 'python-requests' 'python-suds'
         'python-yattag' 'python-wxpython' 'python-lark-parser')
optdepends=(
        'hamradio-menus: XDG menus for ham radio software'
        'ipython: enhanced interactive developer shell'
)
makedepends=('python-build' 'python-installer' 'python-wheel' 'python-setuptools')
options=(!emptydirs !debug)
conflicts=('chirp' 'chirp-daily' 'chirp-next-bin')
provides=(chirp)
install=$pkgname.install
source=("https://github.com/GaryScottMartin/chirp-next-mirror/releases/download/${pkgver}/chirp-${pkgver}.tar.gz")
# Checksums: https://github.com/GaryScottMartin/chirp-next-mirror/releases/download/20260814/checksums.txt
sha256sums=('163889128c0dc59e0c30b549bffc9fe16058d8dd28b3c8c9b6662fb96be681c4')
# User-Agent override workaround for nitpicky Cloudflare config; see:
# https://wiki.archlinux.org/title/Nonfree_applications_package_guidelines#Custom_DLAGENTS

build() {
    cd "chirp-${pkgver}"
    python -m build --wheel --no-isolation
}

package() {
  _site_packages=$(python -c "import site; print(site.getsitepackages()[0])")
  cd "chirp-$pkgver"
  python -m installer --destdir="${pkgdir}" dist/*.whl
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirpw.1" "${pkgdir}/usr/share/man/man1/chirp.1"
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirp.desktop" "${pkgdir}/usr/share/applications/chirp.desktop"
  install -D -m644 "${srcdir}/chirp-${pkgver}/chirp/share/chirp.png" "${pkgdir}/usr/share/pixmaps/chirp.png"
  cp -dr --preserve=mode,timestamp "${srcdir}/chirp-${pkgver}/chirp/locale/" "${pkgdir}${_site_packages}/chirp/locale"
}
