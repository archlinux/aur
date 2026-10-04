# Maintainer: Adrian <adrian@mxlinux.org>

# PKGBUILD for building on the Open Build Service.
#
# OBS build VMs have no network, so every source has to be present in the
# package's OBS sources before the build starts. This consumes the Debian
# native tarball that release builds commit to debs/ - it carries the complete
# source tree - instead of fetching a GitHub tarball the way aur/PKGBUILD does.
#
# Keep pkgver in step with debian/changelog: it names the tarball.

pkgname=mx-packageinstaller
pkgver=26.10
pkgrel=1
pkgdesc="MX Package Installer - a tool for managing packages and Flatpaks"
arch=("x86_64")
url="https://github.com/MX-Linux/mx-packageinstaller"
license=("GPL3")
depends=("qt6-base" "polkit" "flatpak")
makedepends=("cmake" "ninja" "qt6-tools")
optdepends=("paru: AUR helper for AUR tab operations and Snap setup (snapd is built from the AUR)")
source=("https://github.com/MX-Linux/mx-packageinstaller/archive/refs/tags/36.03.1.tar.gz")
sha256sums=('0f82787823f53019846e9e2ec79e474c26849b9097d10072599d2fa9b61b9d86')

# dpkg-source packed this tarball from a directory called "src", so that - not
# ${pkgname}-${pkgver} - is what it unpacks to.
_srcdir="mx-packageinstaller-36.03.1"

build() {
  cd "${srcdir}/${_srcdir}"
  mkdir -p build
  cd build

  # Pin the version. CMakeLists falls back to the root PKGBUILD's stale
  # pkgver=${PKGVER:-26.06.2} when dpkg-parsechangelog is missing, which is
  # always the case on Arch - so without this the binary reports the wrong
  # version while the package carries the right one.
  cmake -G Ninja .. \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DPROJECT_VERSION_OVERRIDE="${pkgver}" \
    -DCMAKE_EXPORT_COMPILE_COMMANDS=ON

  ninja
}

package() {
  cd "${srcdir}/${_srcdir}/build"
  DESTDIR="${pkgdir}" ninja install

  install -Dm755 mx-packageinstaller "${pkgdir}/usr/bin/mx-packageinstaller"

  install -dm755 "${pkgdir}/usr/share/mx-packageinstaller/locale"
  install -Dm644 *.qm "${pkgdir}/usr/share/mx-packageinstaller/locale/" 2>/dev/null || true

  install -dm755 "${pkgdir}/usr/lib/mx-packageinstaller"
  install -Dm755 helper "${pkgdir}/usr/lib/mx-packageinstaller/helper"
  install -Dm755 ../scripts/mxpi-lib "${pkgdir}/usr/lib/mx-packageinstaller/mxpi-lib"
  install -Dm755 ../scripts/mxpi-maintenance-pacman "${pkgdir}/usr/lib/mx-packageinstaller/mxpi-maintenance"
  install -Dm644 org.mxlinux.pkexec.mxpi-helper.policy \
    "${pkgdir}/usr/share/polkit-1/actions/org.mxlinux.pkexec.mxpi-helper.policy"

  install -Dm644 ../mx-packageinstaller.desktop "${pkgdir}/usr/share/applications/mx-packageinstaller.desktop"

  install -Dm644 ../icons/mx-packageinstaller.png "${pkgdir}/usr/share/icons/hicolor/64x64/apps/mx-packageinstaller.png"
  install -Dm644 ../icons/mx-packageinstaller.png "${pkgdir}/usr/share/pixmaps/mx-packageinstaller.png"
  install -Dm644 ../icons/mx-packageinstaller.svg "${pkgdir}/usr/share/icons/hicolor/scalable/apps/mx-packageinstaller.svg"

  install -Dm644 ../debian/mx-packageinstaller.1 "${pkgdir}/usr/share/man/man1/mx-packageinstaller.1"

  install -dm755 "${pkgdir}/usr/share/doc/mx-packageinstaller"
  install -Dm644 ../help/mx-package-installer-pacman.html \
    "${pkgdir}/usr/share/doc/mx-packageinstaller/mx-package-installer-pacman.html"
  install -Dm644 ../help/license.html "${pkgdir}/usr/share/doc/mx-packageinstaller/license.html"
  for shot in pacman-1.png pacman-2.png pacman-3.png pacman-4.png; do
    if [ -f "../help/${shot}" ]; then
      install -Dm644 "../help/${shot}" "${pkgdir}/usr/share/doc/mx-packageinstaller/${shot}"
    fi
  done
    # namcap flags a declared license= with nothing under
    # /usr/share/licenses. The file is in the source; it was simply never
    # installed.
    # package() runs in build/, so LICENSE is one level up.
    install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
