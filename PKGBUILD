# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Patches applied by: Lito Parra <lito.15@proton.me>

pkgname=kwin-hifps-git
pkgver=6.4.90.r622.ga8e1ccfd5d
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=1
pkgdesc='An easy to use, but flexible, Wayland compositor - patched for high refresh rate animation smoothness'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze-git
         gcc-libs
         glibc
         plasma-activities-git
         kauth-git
         kcmutils-git
         kcolorscheme-git
         kconfig-git
         kcoreaddons-git
         kcrash-git
         kdbusaddons-git
         kdeclarative-git
         kdecoration-git
         kglobalaccel-git
         kglobalacceld-git
         kguiaddons-git
         ki18n-git
         kidletime-git
         kirigami-git
         kitemmodels-git
         knewstuff-git
         knotifications-git
         kpackage-git
         kquickcharts-git
         kscreenlocker-git
         kservice-git
         ksvg-git
         kwayland-git
         kwidgetsaddons-git
         kwindowsystem-git
         kxmlgui-git
         lcms2
         libcanberra
         libdisplay-info
         libdrm
         libei
         libepoxy
         libinput
         libpipewire
         libqaccessibilityclient-qt6
         libxcb
         libxcvt
         libxkbcommon
         mesa
         pipewire-session-manager
         libplasma-git
         qt6-5compat
         qt6-base-hifps
         qt6-declarative
         qt6-sensors
         qt6-svg
         qt6-tools
         systemd-libs
         wayland
         xcb-util-cursor
         xcb-util-keysyms
         xcb-util-wm)
makedepends=(extra-cmake-modules
             kdoctools
             krunner
             plasma-wayland-protocols
             python
             wayland-protocols
             xorg-xwayland
             git
             rsync)
optdepends=('maliit-keyboard: virtual keyboard')
conflicts=('kwin')
provides=('kwin' 'kwin-git')
groups=(plasma)
source=(git+https://invent.kde.org/plasma/kwin.git)
# unused: 0001-retick.patch::https://invent.kde.org/plasma/kwin/-/merge_requests/7980.patch
sha256sums=('SKIP')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

pkgver() {
	pushd "${srcdir}/kwin" >/dev/null
	git describe --long --always 2>/dev/null | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
	popd >/dev/null
}

prepare() {
  #echo ">>> Syncing official Arch kwin repo files..."
  #bash "$srcdir/sync_official.sh" "$PWD"

  echo ">>> This is the Git version. Compiling latest commit in branch..."

  cd "$srcdir/kwin"

  # sanity check
  if [ ! -f CMakeLists.txt ]; then
    echo ">>> ERROR: CMakeLists.txt not found after checkout!"
    ls -la
    return 1
  fi

  echo ">>> Fixing docbook URLs (if any)..."
  find "$srcdir" -name index.docbook -print0 | xargs -0 sed -i -e 's|url=" http|url="http|g' || true

  echo ">>> Patches applied!" 
}

build() {
  cmake -B build -S "$srcdir/kwin" \
    -DCMAKE_INSTALL_LIBEXECDIR=lib \
    -DBUILD_TESTING=OFF
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
