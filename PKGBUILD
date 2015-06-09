# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=unity-system-compositor
_actual_ver=0.0.5
_extra_ver=+15.04.20141204
_ubuntu_rel=0ubuntu1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="System compositor for Ubuntu"
arch=(i686 x86_64)
url="https://launchpad.net/unity-system-compositor"
license=(GPL)
depends=(boost cairo lightdm mesa-mir mir protobuf qt5-base xorg-server-mir)
makedepends=(cmake)
options=(!emptydirs)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff.gz")
sha512sums=('99920086983801d472d200a7bb30c14ceafd0981bb709664985cc555549e8f1eb4059718ea8909ad75bae178cd3cc50c653ce833ad6ffede0ef6ff53f727f88b'
            'df928f17813e7682300da4f1e70a5c7f3f76f8d28c895844f4d14c415476169ad83cfebcca3671d495207232bc3ee78afc8cb94bebc9eaf2187d67003d7dda88')

prepare() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"
  patch -p1 -i "../${pkgname}_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff"
}

build() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DMIR_ENABLE_TESTS=OFF
  make
}

package() {
  cd "${pkgname}-${_actual_ver}${_extra_ver}"
  make DESTDIR="${pkgdir}/" install

  mv "${pkgdir}"/usr/{sbin/*,bin/}

  install -dm755 "${pkgdir}"/usr/share/lightdm/lightdm.conf.d/
  install -m644 debian/10-unity-system-compositor.conf \
                "${pkgdir}"/usr/share/lightdm/lightdm.conf.d/

  install -m755 debian/unity-system-compositor.sleep "${pkgdir}"/usr/bin/
  sed -i 's/sbin/bin/g' "${pkgdir}"/usr/bin/unity-system-compositor.sleep
}
