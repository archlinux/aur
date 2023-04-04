# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.6.1
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('x86_64')
license=('custom')
depends=('crypto++' 'sqlite' 'c-ares' 'ffmpeg' 'freeimage'
         'libsodium' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="412e2691ae10d4dfc66c11bcc48cff0254843722"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
    "fix-ffmpeg-compile.patch")
sha512sums=('d56ce2ee834bfdd0a5aefbdca117e91f66bdd4f121e3d2c646fee0014053c0e594003716ed3cb16ce73db9bf24ea9598213d51c6de694a5a9ae9c773305681ba'
            '30d0228a070883cdb9f3699e5401052794d7071020973806b3bc74646a52a916fe4341889bb16839e5675fbddbe9b4a34624e319c55e833c470a97bca2d3b5d2'
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
