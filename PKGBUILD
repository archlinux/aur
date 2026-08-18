# Maintainer: Koutheir Attouchi <koutheir at gmail dot com>
# Contributor: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Contributor: txtsd <aur.archlinux@ihavea.quest>
# Contributor: Marcel Korpel <marcel[dot]korpel[at]gmail>
# Contributor: Olaf Bauer <hydro@freenet.de>

pkgname=makemkv-working
_pkgname=makemkv
pkgver=1.17.7
pkgrel=1
pkgdesc="DVD and Blu-ray to MKV converter, latest working version 1.17.7"
arch=(x86_64 i686 aarch64)
url="https://www.makemkv.com"
license=('LicenseRef-GuinpinSoft-inc-EULA' LGPL-2.1-or-later)
depends=(qt5-base ffmpeg libavcodec.so)
optdepends=('java-runtime: bdjava https://www.makemkv.com/bdjava/')
provides=('makemkv')
conflicts=('makemkv')
install=makemkv.install
source=(https://codeberg.org/koutheir/aur-makemkv/raw/branch/master/makemkv-bin-1.17.7.tar.gz
        https://codeberg.org/koutheir/aur-makemkv/raw/branch/master/makemkv-oss-1.17.7.tar.gz
        ffmpeg9.patch
        makemkv.1
        makemkvcon.1
        )
sha256sums=('8c5bc831bc952b1f873cc8450c64e392db0b2479b626d180f0ffc965668951d0'
            '762e552d46f9ec75a7c62dcb7d97c0fd9e6a15120d0ef6f5a080cee291d3a0ef'
            'f3be28dff3c0aeea0bca440686e753ddec3ff9ed1a70a0be601f532eb39dba52'
            '5573b2e4bade10d8cd258a7c235eb46f66ef8c8c97e5d5eb090c38fa0f94389b'
            'f12c0facf2f0071a9f728b138986f0a4c2b4ff6ace2dfb2e96364e215e9fda6f')

prepare() {
  cd "${_pkgname}-oss-${pkgver}"
  patch --forward --strip=1 < ../ffmpeg9.patch
}

build() {
  cd "${srcdir}/${_pkgname}-oss-${pkgver}"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-oss-${pkgver}"
  make DESTDIR="${pkgdir}" install

  cd "${srcdir}/${_pkgname}-bin-${pkgver}"
  install --directory tmp
  echo accepted > tmp/eula_accepted
  make DESTDIR="${pkgdir}" install

  install -D --mode=644 src/eula_en_linux.txt "${pkgdir}/usr/share/licenses/${pkgname}/eula_en_linux.txt"

  cd "${srcdir}/"
  install --directory "${pkgdir}/usr/share/man/man1/"
  install --mode=644 "--target-directory=${pkgdir}/usr/share/man/man1/" makemkv.1 makemkvcon.1
}
