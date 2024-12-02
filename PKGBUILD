# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Ray Rashif <schiv@archlinux.org>

pkgbase="rakarrack"
pkgname=("${pkgbase}" "${pkgbase}-docs")
_commit_rel="9f8a085efbd7b162c8c5b791602c2015e1885ae2" # 0.6.2
_commit="a6208406d94a1da978f435605072ee5caefe1491" # r194
pkgver="0.6.2+r194+g${_commit::7}"
pkgrel=1
epoch=1
pkgdesc="Versatile guitar multi-effects processor"
arch=('x86_64' 'i686')
url="https://${pkgbase}.sourceforge.net"
_url="https://github.com/dtimms/${pkgbase}"
license=('GPL-2.0-only')
makedepends=('alsa-utils' 'fftw' 'fltk' 'jack' 'libsndfile' 'libxpm')
_pkgsrc="${pkgbase}-git-${_commit}"
source=("${_pkgsrc}.zip::https://sourceforge.net/code-snapshots/git/${pkgbase::1}/${pkgbase::2}/${pkgbase}/git.git/${_pkgsrc}.zip"
        "${pkgbase}_fix_manpage.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/0.6.1-9/debian/patches/04_fix_manpage.diff"
        "${pkgbase}_fix_format-security.patch::${_url}/commit/55b3362d9b4f7bec167e6ada2444259fbae48979.patch?full_index=1"
        "${pkgbase}_fix_segfault.patch::https://sources.debian.org/data/main/${pkgbase::1}/${pkgbase}/0.6.1-9/debian/patches/05_fix_segfault.diff"
        "${pkgbase}_fix_icons_destdir.patch"
        "${pkgbase}_fix_license_destdir.patch"
        "${pkgbase}_improve_desktop.patch")
b2sums=('f4ac8c66a4304d2c7a30ad6b72b9ce458189dcb0023ec1086ac77516294bb83f936d364f80eb866e3dc98232201a2764a43c5a1da362a82eb49a743722522b33'
        '778fe891dd2927e61539ce36a1cac419e0c05113a9f6a25ca13a6ea5155f11b1063bd8aa830c9c5ad4de732bd6901ccb13ea4414173ece3a99705103539fcafd'
        '6515010b01a4cb9001ebee541478f896f2a59385876a8d8319bf6aff87d7d1d829c614b06d8ae06156c54db6fbf42256eab26b0f6572cbd71696866a207d986f'
        '3a0aa5205e34a0aa03c06ec1ad773b0f2815ab096f0ed4d8b8451efb099cc0daacb5dda6a9ad856f5e1dd52cce307826a615691e322168aff8fb98c8ab0c9bec'
        '5c5ae27b8dcef87a87821d2c5ca96848a2757b30b79247a8b87611671edc6e304808de4da1383bdb2ccbc50309a21bb26b67456b720a0c055eddbd58ef15e7d0'
        '8df3a26a2d9f32aa1782ff04f448adffafd931e8bafc9f4f744a74eb55f2df04a0779e957ee1f093cc9c16e99918a8d24a5338ba7a906a695d6c5798ab63e6d1'
        'a4908058dee3564c18619309cf5aca39f232c8dbcb2ef046ad5b0c22cc446d8ccdbf677127a498b2be57e23b7328d5e1e21c219c9f68d3c8f0620a2c671096c9')

prepare() {
  cd "${srcdir}/${_pkgsrc}"
  patch -Np1 -i "../${pkgbase}_fix_manpage.patch"
  patch -Np1 -i "../${pkgbase}_fix_format-security.patch"
  patch -Np1 -i "../${pkgbase}_fix_segfault.patch"
  patch -Np1 -i "../${pkgbase}_fix_icons_destdir.patch"
  patch -Np1 -i "../${pkgbase}_fix_license_destdir.patch"
  patch -Np1 -i "../${pkgbase}_improve_desktop.patch"
}

build() {
  cd "${srcdir}/${_pkgsrc}"
  ./autogen.sh
  ./configure \
    --prefix='/usr' \
    --enable-datadir='yes' \
    --enable-docdir='yes'
  make
}

package_rakarrack() {
  depends=('alsa-lib' 'fftw' 'fltk' 'gcc-libs' 'glibc' 'hicolor-icon-theme'
           'jack' 'libsamplerate' 'libsndfile' 'libx11' 'libxpm')

  cd "${srcdir}/${_pkgsrc}"
  make DESTDIR="${pkgdir}" install

  cd "${pkgdir}/usr/share/doc/${pkgbase}"
  rm -rf "html"
}

package_rakarrack-docs() {
  pkgdesc+=" (documentation)"
  arch=('any')

  cd "${srcdir}/${_pkgsrc}/doc/help"
  make DESTDIR="${pkgdir}" install
}
