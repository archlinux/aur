# Maintainer:	        EndlessEden <endlesseden@users.noreply.github.com> 
# Previous Maintainer:  Oleg Tsvetkov <oleg@tsvetkov.dev>
# Contributor:          João Figueiredo & chaotic-aur <islandc0der@chaotic.cx>
# Contributor:          Felix Golatofski <contact@xdfr.de>
# Contributor:          Antonio Rojas <arojas@archlinux.org>
# Contributor:          Henri Chain <henri@henricha.in>
#
# PKGBUILD is based on one from Chaotic AUR GitHub and was published here since the actual kpipewire-git wasn't in AUR already but is required by many packages in plasma. Be free
# (all respective contributors apply herein)

pkgname=kpipewire-git
pkgver=6.3.80_r575.gb6eafe9
pkgrel=1
pkgdesc="KDE Plasma Kpipewire"
arch=($CARCH)
url="https://community.kde.org/Frameworks"
license=(LGPL)
depends=(kcoreaddons kconfig ki18n kcodecs iso-codes pipewire ffmpeg libepoxy)
makedepends=(git extra-cmake-modules doxygen qt5-tools qt5-wayland kwayland plasma-wayland-protocols)
conflicts=(${pkgname%-git})
provides=(${pkgname%-git})
groups=(kf6-git)
source=("git+https://github.com/KDE/${pkgname%-git}.git"
"https://invent.kde.org/endlesseden/kpipewire/-/commit/021d6ff710e2b6231df78c1c2ae9950ba336e86d.patch")
sha256sums=('SKIP'
'ddb87c474c10f113712e6d434b71311ac1f30f1fcd5a0cc6f8cae338f01a31b9')

pkgver() {
  cd ${pkgname%-git}
  _ver="$(grep -m1 'project(KPipewire VERSION' CMakeLists.txt | cut -d '"' -f2 | tr - .)"
  echo "${_ver}_r$(git rev-list --count HEAD).g$(git rev-parse --short HEAD)"
}

prepare() {
cd $srcdir/${pkgname%-git}
if [ $(cat src/h264vaapiencoder.cpp | grep -c 'm_avCodecContext->profile = AV_PROFILE_H264_CONSTRAINED_BASELINE') -lt '1' ]; then
patch -p1 -i $srcdir/021d6ff710e2b6231df78c1c2ae9950ba336e86d.patch # see ffmpeg n7.1 depreciation fix (see: https://invent.kde.org/plasma/kpipewire/-/merge_requests/200)
fi
}

build() {
  cmake -B build -S ${pkgname%-git} \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
