# Maintainer: Fabio 'Lolix' Loli <lolix@disroot.org> -> https://github.com/FabioLolix
 
pkgname=vvave-git
pkgver=r317.5081063
pkgrel=1
pkgdesc='Music player for KDE'
arch=(x86_64 i686 arm armv6h armv7h aarch64)
url="https://vvave.kde.org/"
license=(GPL3)
depends=(ki18n knotifications qt5-quickcontrols2 qt5-svg qt5-webengine qt5-websockets taglib kio mauikit-git kirigami2
         gst-plugins-base gst-plugins-good gst-libav)
makedepends=(git)
optdepends=(gst-plugins-bad gst-plugins-ugly)
provides=(vvave)
conflicts=(vvave)
#replaces=(babe babe-qt babe-git)
source=("${pkgname}::git+https://github.com/mauikit/vvave"
        "git+https://github.com/maui-project/mauikit"
        "git://anongit.kde.org/breeze-icons"
        "git://anongit.kde.org/kirigami"
        "git+https://github.com/Nitrux/luv-icon-theme")
sha256sums=('SKIP'
            'SKIP'
            'SKIP'
            'SKIP'
            'SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
  cd "$pkgname"
  install -d build

  git submodule init
  git config 'submodule.mauikit.url' "${srcdir}/mauikit"
  git config 'submodule.3rdparty/breeze-icons.url' "${srcdir}/breeze-icons"
  git config 'submodule.3rdparty/kirigami.url' "${srcdir}/kirigami"
  git config 'submodule.3rdparty/luv.url' "${srcdir}/luv-icon-theme"
  git submodule update
}

build() {
  cd "$pkgname/build"
  qmake-qt5 -o Makefile ../vvave.pro
  make
}
 
package() {
  cd "$pkgname/build"
  make INSTALL_ROOT="$pkgdir" install
}
