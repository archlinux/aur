# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.4.0
pkgrel=5
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('any')
license=('custom')
depends=('crypto++' 'zlib' 'sqlite' 'openssl' 'curl' 'c-ares' 'freeimage' 'libsodium'
         'readline' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="2337aca38daaca6deedd04d8ea400293503f00ff"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
    "remove-dupe-am-init-automake.patch")
sha512sums=('f2695e70a01e94e3d66e74af7d4fe9be5a1c111db96de815d94843e6cc1a623e113a7e8961aab5fc224381a829de719994cf1394c8ee9c58f59c425433557fe9'
            'f980a2fd2b402aac74a3f739e6dbfe73372a5a5fd5aac18c9f9cdb0d70d0d1d797266bf98759c83ceba3ca587c2d01f95b91ea02dbd07313508c716e6ea9857d'
            '7d372039346969a3518fff5b81ec68a2a44a467b4bfc3476aa5173573ab6a28cc74234f130d7363997db21ab637de81822926eecfe95ea69138ab919f7085645')

prepare() {
  cd "MEGAcmd-${pkgver}_Linux"

  rm -r sdk
  ln -sf "../sdk-${_sdkhash}" sdk

  patch --forward --strip=1 --input="${srcdir}/remove-dupe-am-init-automake.patch"
}

build() {
  cd "MEGAcmd-${pkgver}_Linux"

  ./autogen.sh
  ./configure \
    --prefix=/usr \
    --without-ffmpeg # disabled until #523 is fixed (-ffmpeg dep)
  make
}

package() {
  cd "MEGAcmd-${pkgver}_Linux"

  make DESTDIR=${pkgdir} install

  # change completions location
  rm -rf ${pkgdir}/usr/etc/
  install -Dm644 src/client/megacmd_completion.sh ${pkgdir}/usr/share/bash-completion/completions/${pkgname}

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
