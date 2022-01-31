# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.5.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('any')
license=('custom')
depends=('crypto++' 'zlib' 'sqlite' 'openssl' 'curl' 'c-ares' 'freeimage' 'libsodium'
         'readline' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="f6438d55fa6b1ef54eb2b8832a1da7502a56df13"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz")
sha512sums=('65a07becbcbca5b7dfe0916a92fd68522f640ae3b33b1564b954ff405b72bd4565e062e018c4c4cef6dc892f2850511d7d627c195d2b8fe39e50842f7e25b3eb'
            '8072885bf1f9b8e4de57eeac183ceaec3414289cbd7644fce64d270a98b23f2ff1825dcecb6ed50e1e8e88c92947c6128396bcf781ac72488c073ea1961ce4e9')

prepare() {
  cd "MEGAcmd-${pkgver}_Linux"

  rm -r sdk
  ln -sf "../sdk-${_sdkhash}" sdk
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
