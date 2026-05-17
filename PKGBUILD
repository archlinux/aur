# Maintainer: WorMzy Tykashi <wormzy.tykashi@gmail.com>

pkgname=openxcom-extended
pkgver=8.6.1
epoch=1
# Repo doesn't use tags, so set which commit this version corresponds to in
# https://github.com/MeridianOXC/OpenXcom/commits/oxce-plus/src/version.h
_commit=602847529e79bde07aa73bb5d5fde11fef74ebc1
pkgrel=2
pkgdesc="An extended version of the open-source reimplementation of X-COM (OXCE)"
arch=('i686' 'x86_64')
url="https://openxcom.org/forum/index.php/topic,5251.0.html"
license=('GPL-3.0-or-later')
depends=('glibc' 'hicolor-icon-theme' 'libgcc' 'libgl' 'libstdc++' 'sdl'
         'sdl_gfx' 'sdl_image' 'sdl_mixer' 'yaml-cpp')
makedepends=('boost' 'cmake' 'docbook-xml' 'docbook-xsl'
             'doxygen' 'git' 'glu' 'xmlto' 'xorgproto')
optdepends=('openxcom-data-steam: pacman-tracked X-COM data files from Steam'
            'openxcom-tftd-data-steam: pacman-tracked Terror From The Deep data files from Steam')
provides=('openxcom' 'openxcom-git')
conflicts=('openxcom')
install="${pkgname}.install"
source=(${pkgname}::git+"https://github.com/MeridianOXC/OpenXcom.git#commit=${_commit}"
        https://github.com/MeridianOXC/OpenXcom/commit/911ca487fc0adf18be049c46c34b197a079023d7.patch)
md5sums=('1d3914bc3105a7b56e5d27a8b716ae53'
         '8e2703f68107f156b7fc23133f77f3ad')
sha1sums=('44a09c236ceb632cca422d641d5c76b0959e7a57'
          'ce88f9061fb5291f6c0c3c8c41d1249c548fe6a7')

prepare() {
  cd openxcom-extended
  patch -p1 -i "${srcdir}/911ca487fc0adf18be049c46c34b197a079023d7.patch"
}

build() {
  cmake -B build -S ${pkgname} -DCMAKE_INSTALL_PREFIX="/usr" -DTARGET_PLATFORM="linux" \
        -DCMAKE_BUILD_TYPE="None" -DDEV_BUILD="Off" \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  cd build
  make
}

package() {
  cd build
  make DESTDIR="${pkgdir}" install

  # Fix manpage location
  install -Dm644 "${srcdir}/${pkgname}/docs/openxcom.6" "${pkgdir}/usr/share/man/man6/openxcom.6"
}
