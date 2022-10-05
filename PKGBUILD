

# Maintainer: Jiachen YANG <farseerfc@archlinux.org>
# Contributor: xyzzy <628208@gmail.com>

pkgname=flameshot-old
_pkgname=flameshot
pkgver=0.10.2
pkgrel=2
pkgdesc="Powerful yet simple to use screenshot software(The last version where non-English language translations work correctly)"
arch=('x86_64')
url="https://github.com/flameshot-org/flameshot"
license=('GPL')
depends=('qt5-svg' 'hicolor-icon-theme')
provides=('flameshot')
conflicts=('flameshot' 'flameshot-git')
makedepends=('make' 'qt5-tools' 'cmake' 'git')
optdepends=(
    'gnome-shell-extension-appindicator: for system tray icon if you are using Gnome'
    'grim: for wlroots wayland support'
    'xdg-desktop-portal: for wayland support, you will need the implementation for your wayland desktop environment'
)
# fixed to the commit in v0.10.2 branch instead of tagged release, see: https://github.com/flameshot-org/flameshot/issues/2119#issuecomment-980037011 
source=("${_pkgname}-${pkgver}::git+https://github.com/flameshot-org/flameshot.git#commit=cda5a0f148ade1536d390ed988091848ecf62d13")
#source=("${_pkgname}-v${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('SKIP')

prepare() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
}

build() {
  cd "${srcdir}/${_pkgname}-${pkgver}"
  mkdir build
  cd build
  cmake .. -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}-${pkgver}/build"
  make DESTDIR="${pkgdir}" install
  
  # zsh _flameshot completion is provided by zsh-completions so exclude from packaging
  rm -rf ${pkgdir}/usr/share/zsh/
}
