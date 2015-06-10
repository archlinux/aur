# Maintainer: Xiao-Long Chen <chenxiaolong@cxl.epac.to>

pkgname=unity-system-compositor
_actual_ver=0.0.5
_extra_ver=+15.10.20150506.1
_ubuntu_rel=0ubuntu1
pkgver=${_actual_ver}${_extra_ver/\+/.}
pkgrel=1
pkgdesc="System compositor for Ubuntu"
arch=(i686 x86_64)
url="https://launchpad.net/unity-system-compositor"
license=(GPL)
depends=(boost cairo lightdm mesa-mir mir protobuf xorg-server-mir)
makedepends=(cmake)
options=(!emptydirs)
source=("https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}.orig.tar.gz"
        "https://launchpad.net/ubuntu/+archive/primary/+files/${pkgname}_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff.gz")
sha512sums=('3aa87f419bd7a64733a1c532d406bbb886156616386d4a37e7f09c12bab81d0479443ff5d94a9f3cc5cfb1fda78bd4ceafd80c5f55640ce426fb9add826acb07'
            '097f12259754e19bded3f44c4bc068ed9793f9dce1cc12cfbf18c9eb714ec6944f257c993860222ffb14c1e4196aaac64b74b91c0e8c5dee59012c35b5b89b3d')

prepare() {
  cd "${pkgname}-${_actual_ver}${_extra_ver/.10./.04.}"
  patch -p1 -i "../${pkgname}_${_actual_ver}${_extra_ver}-${_ubuntu_rel}.diff"
}

build() {
  cd "${pkgname}-${_actual_ver}${_extra_ver/.10./.04.}"
  cmake . \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc \
    -DMIR_ENABLE_TESTS=OFF
  make
}

package() {
  cd "${pkgname}-${_actual_ver}${_extra_ver/.10./.04.}"
  make DESTDIR="${pkgdir}/" install

  mv "${pkgdir}"/usr/{sbin/*,bin/}

  install -dm755 "${pkgdir}"/usr/share/lightdm/lightdm.conf.d/
  install -m644 debian/10-unity-system-compositor.conf \
                "${pkgdir}"/usr/share/lightdm/lightdm.conf.d/

  install -m755 debian/unity-system-compositor.sleep "${pkgdir}"/usr/bin/
  sed -i 's/sbin/bin/g' "${pkgdir}"/usr/bin/unity-system-compositor.sleep
}
