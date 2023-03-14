# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.6.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('x86_64')
license=('custom')
depends=('crypto++' 'sqlite' 'c-ares' 'ffmpeg' 'freeimage'
         'libsodium' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="778f83d7ed3780c536da5f05dc1205cffe5917e7"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
    "fix-ffmpeg-compile.patch")
sha512sums=('2b7fbeaf4f3be4e0061d872f264c5a1aec8f117d7acba2b8cbc3dc951d3c15630444480608c895de6aaf121dc4c02d972b0f2db5b518beb7c028df02dc9ae8f9'
            '06534a1a8ee9e22cd293210581c9a2c8498a202658a6be3ef19fc8f7d91bf98c903b1953b0bf1a6c894b7052efcfeb7cccbe68f82e99d44636a6db5a2006ed44'
            'cb29bd8be1aacd5b5de6c433a8857711b1bbce1e6e64cbb891d7ea1957f81d56070dda672b59dc3c7fff4472b0e891f4a461e336251d68dff36989aec85642b6')

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

  for completion_cmd in ${pkgdir}/usr/bin/mega*;
  do
    completion_cmd=$(basename "$completion_cmd")
    ln -s "${pkgname}" "${pkgdir}/usr/share/bash-completion/completions/$completion_cmd"
  done

  install -Dm644 LICENSE ${pkgdir}/usr/share/licenses/${pkgname}/LICENSE
}

# vim:set ts=2 sw=2 et:
