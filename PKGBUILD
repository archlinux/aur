# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Maintainer: Antonio Rojas <arojas@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Patches applied by: Lito Parra <lito.15@proton.me>

pkgname=kwin-hifps
pkgver=6.4.5
_dirver=$(echo $pkgver | cut -d. -f1-3)
pkgrel=4
pkgdesc='An easy to use, but flexible, Wayland compositor - patched for high refresh rate animation smoothness'
arch=(x86_64)
url='https://kde.org/plasma-desktop/'
license=(LGPL-2.0-or-later)
depends=(aurorae
         breeze
         gcc-libs
         glibc
         plasma-activities
         kauth
         kcmutils
         kcolorscheme
         kconfig
         kcoreaddons
         kcrash
         kdbusaddons
         kdeclarative
         kdecoration
         kglobalaccel
         kglobalacceld
         kguiaddons
         ki18n
         kidletime
         kirigami
         kitemmodels
         knewstuff
         knotifications
         kpackage
         kquickcharts
         kscreenlocker
         kservice
         ksvg
         kwayland
         kwidgetsaddons
         kwindowsystem
         kxmlgui
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
         libplasma
         qt6-5compat
         qt6-base
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
provides=('kwin')
groups=(plasma)
source=(git+https://github.com/KDE/kwin.git
        0001-retick.patch::https://invent.kde.org/plasma/kwin/-/merge_requests/7980.patch
        0002_set_interval_1ms.patch
        sync_official.sh)
sha256sums=('SKIP'
            'SKIP'
            '50c1f127360a655fa3794218bbd6b1d6fb90c23da2b950355d103b7040a5aee2'
            '26b1d0926ab098d9da0b60270a368959887a6f2ee90e3f1c2c358e7325e8129c')
validpgpkeys=('E0A3EB202F8E57528E13E72FD7574483BB57B18D'  # Jonathan Esk-Riddell <jr@jriddell.org>
              '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D'  # Bhushan Shah <bshah@kde.org>
              'D07BD8662C56CB291B316EB2F5675605C74E02CF'  # David Edmundson <davidedmundson@kde.org>
              '90A968ACA84537CC27B99EAF2C8DF587A6D4AAC1'  # Nicolas Fella <nicolas.fella@kde.org>
              '1FA881591C26B276D7A5518EEAAF29B42A678C20') # Marco Martin <notmart@gmail.com>

# Dynamically sets pkgver by following the official Arch kwin package.
# This way, the package automatically tracks upstream versions, allowing
# us to apply our custom patches without manually updating the PKGBUILD each time.

pkgver() {
  local tmpdir
  tmpdir=$(mktemp -d)
  pushd "$tmpdir" >/dev/null

  # Clone official PKGBUILD repo (last public version)
  git clone --depth=1 https://gitlab.archlinux.org/archlinux/packaging/packages/kwin.git . >/dev/null 2>&1

  # Extract key variables from PKGBUILD
  local official_pkgver
  local official_pkgrel
  official_pkgver=$(grep -E '^pkgver=' PKGBUILD | cut -d= -f2)
  official_pkgrel=$(grep -E '^pkgrel=' PKGBUILD | cut -d= -f2)
  #official_pkgver=6.5.0
  #official_pkgrel=1

  popd >/dev/null
  rm -rf "$tmpdir"

  # Export pkgver for build
  pkgver="$official_pkgver"
  pkgrel="$official_pkgrel"
  echo "$pkgver"
}

prepare() {
  echo ">>> Syncing official Arch kwin repo files..."
  bash "$srcdir/sync_official.sh" "$PWD"

  echo ">>> Checking out kwin source at tag v${pkgver}..."

  cd "$srcdir/kwin"

  # Checkout exact tag
  if git rev-parse "v${pkgver}" >/dev/null 2>&1; then
    git checkout "v${pkgver}"
  elif git rev-parse "Plasma/${pkgver}" >/dev/null 2>&1; then
    git checkout "Plasma/${pkgver}"
  else  find "$srcdir" -name index.docbook -print0 | xargs -0 sed -i -e 's|url=" http|url="http|g' || true
    echo ">>> WARNING: tag v${pkgver} not found; using master branch as fallback."
    git checkout master
  fi

  # sanity check
  if [ ! -f CMakeLists.txt ]; then
    echo ">>> ERROR: CMakeLists.txt not found after checkout!"
    ls -la
    return 1
  fi

  echo ">>> Applying MR 7980 patch for frame pacing fixes..."
  patch -Np1 -i "${srcdir}/0001-retick.patch"

  echo ">>> Applying additional patches..."
  patch -Np1 -i "${srcdir}/0002_set_interval_1ms.patch"


  echo ">>> Fixing docbook URLs (if any)..."
  find "$srcdir" -name index.docbook -print0 | xargs -0 sed -i -e 's|url=" http|url="http|g' || true
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
