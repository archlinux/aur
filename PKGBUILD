# Maintainer: Chris Lane <aur at chrislane dot com>
# Contributor: Stephanie Wilde-Hobbs <hi@stephanie.is>

pkgname=megacmd
pkgver=1.7.0
pkgrel=1
pkgdesc="MEGA Command Line Interactive and Scriptable Application"
url="https://github.com/meganz/MEGAcmd"
arch=('x86_64')
license=('custom')
depends=('crypto++' 'sqlite' 'c-ares' 'ffmpeg' 'freeimage'
         'libsodium' 'libmediainfo' 'pcre' 'libuv')
makedepends=('git' 'autoconf')
_sdkhash="e231d30c40bd4ebd1fdd9a3f20b1cda9641e0203"
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/meganz/MEGAcmd/archive/${pkgver}_Linux.tar.gz"
    "mega-sdk-${_sdkhash}.tar.gz::https://github.com/meganz/sdk/archive/${_sdkhash}.tar.gz"
    "fix-ffmpeg-compile.patch")
sha512sums=('9e29a318d062a7d01d2a7e7e7655ef3adf079f2ff64c2eee3c035816821f9c981411f3676c8749a6fc51c44fad06a1428b1db0d6b61f32be5e222553bd9bb0dd'
            '58c07d7c73b309bd187534068d18e2c91d2b2be8aa7ed0192f2b978ae1124461ac207736418f416994a7b2e029e00c1457f0755c4125d8dbfa830e6965522e30'
            'e843e40f72c69b05669478f13b092c115e37505692df1e781724f4466fc56b2339aa44470dbaec16c1cb06816fc779c08f57037cf8bfcf6d8aa966e00c3bf013')

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
