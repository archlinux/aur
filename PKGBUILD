# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.6.3
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('x86_64')
license=('custom')
depends=('crypto++' 'sqlite' 'c-ares' 'ffmpeg' 'freeimage'
         'libsodium' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="965e4c7cd518d48c5b2fbf0084a244fdecc44b35"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
    "fix-ffmpeg-compile.patch")
sha512sums=('425584a1350e5965aea8a09076bb447b4d6a00fc0305e9a19ad91ed8292eae5b758e4c1a41ea7c0887c2f8e0644cf1d1154e3b33503ddcf4713e4a13dd80a6f6'
            '97158dee4c8f2075124d576c67780d6cffa9f39713730d1c99adeb6632b6953bb3867e09eaa1c9babbe0c5aa83029ceb581dd930b5c884b396512f56240f37f7'
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
