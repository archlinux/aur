# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.5.1
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('any')
license=('custom')
depends=('crypto++' 'zlib' 'sqlite' 'openssl' 'curl' 'c-ares' 'freeimage' 'libsodium'
         'readline' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="a1d391d6a9b747892e8033d60ce1f795d181df3c"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
    "fix-ffmpeg-compile.patch")
sha512sums=('8fb2af5753d52a8372a1ad4526c72cbb2be3ca93a2d19c00e1e41951ad7633afa903cb2277abf4e28ff222f94df0dac7dd469d687bf00c6131a76c7ea47b2d50'
            '1496a30617a184682fb21794bbf41686c79d0c6cb655512a3c2d1ee2658978a589d66996478f4279bc0ab1422d34648d1daa040b80581ef67f4010839a327075'
            '7ca79acfa969f0394c796ed99b77b954a620ea8cb989e921e7a539660a972124205cb2ddb1b21a8a191dd5ebc7000b61a78f37d59e5a3984662d2451edfd989a')

prepare() {
  cd "MEGAcmd-${pkgver}_Linux"

  rm -r sdk
  ln -sf "../sdk-${_sdkhash}" sdk

  cd sdk
  patch -Np1 < "${srcdir}"/fix-ffmpeg-compile.patch
}

build() {
  cd "MEGAcmd-${pkgver}_Linux"

  ./autogen.sh
  ./configure --prefix=/usr
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
