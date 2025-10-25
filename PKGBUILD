# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing

# We drop the "b" at the end of the version number. It probably means beta
# while there is also "d" for development versions. This would not be correctly
# parsed by `pkgver` anyway (d > b), so let's leave out the b suffix entirely.
pkgver=1.0.6
pkgrel=1

# Tag version can be obtained from github release page. Sometimes this is the
# version number itself, sometimes some CD-magicnumber thing. There can be
# multiple CD-magicnumberthings for the same version number so it's a bit of a
# guess what corresponds to the latest official release.
#_tagver=0.9.8

# This is probably close to what has been released
_gitrev=04e5bb0241e8f1de24d0fce9be070041c6d5b68e

# Parts come from a different respository and are not versioned anymore since
# 2016. Sometimes we can get the revision by downloading the release build,
# unpacking it and using `git show` on the resources/parts folder. Nowadays the
# release build seems to be hidden behind a paywall. Then we need to guess
# based on the master branch of the fritzing-parts repository and the date when
# the release archive was created.
_partsrev=73bc0559bb8399b2f895d68f032e41d7efc720c0

pkgdesc='PCB layout prototyping application'
arch=('aarch64' 'i686' 'x86_64')
url=http://fritzing.org
license=('GPL-3.0-only AND CC-BY-SA-3.0 AND BSL-1.0') # fritzing, fritzing-parts, svgpp
install=fritzing.install
makedepends=('boost' 'git' 'patchelf' 'qt6-tools')
depends=('gcc-libs' 'glibc' 'libgit2' 'polyclipping' 'qt6-base' 'qt6-serialport' 'qt6-svg' 'quazip-qt6' 'ngspice' 'zlib')
source=("git+https://github.com/fritzing/fritzing-app.git#commit=${_gitrev}"
        "git+https://github.com/fritzing/fritzing-parts.git#commit=${_partsrev}"
        svgpp-1.3.1.tar.gz::https://github.com/svgpp/svgpp/archive/refs/tags/v1.3.1.tar.gz
        0001-Quick-Dirty-patch-to-allow-finding-quazip-qt6-on-Arc.patch
        0002-Quick-Dirty-patch-to-allow-finding-ngspice-on-Arch-L.patch
        0003-Quick-Dirty-patch-to-allow-finding-Clipper1-on-Arch-.patch
        0004-Work-around-build-issues-with-Qt-6.9.patch)
sha256sums=('SKIP'
            'SKIP'
            'be8a89df72d01cf062cc9815dd64c9576b4d20910d6d7aee7f0ea26484dc5e76'
            'df4cf47c0888e3a718de511080db3844a4664fd316f44bbc6e3f96b2550047c5'
            'b01fe8785cc59545626ec87279fab8b248e0faae8ce2ce0d0b67892cc63f9639'
            '889b90766bcf293b3e351157eecb79ceb57bfb749499140a78b10250eccf21b1'
            'f74de1096e0bc8ed9841e98c83767a811cef29d7ea5215cc8b7209d6ee562230')

prepare() {
  cd "${srcdir}"/fritzing-app

  # Allow use of newer Qt versions
  git revert -n 1bf5a03f27b7401631baaedb1ceb9c313a5ffe3d
  git revert -n 20eeb4c2f95f3de669e90a1f3fa2ac49cdcc33ac

  # Allow finding quazip-qt6 on Arch Linux
  patch -p1 < "${srcdir}/0001-Quick-Dirty-patch-to-allow-finding-quazip-qt6-on-Arc.patch"

  # Allow finding ngspice on Arch Linux
  patch -p1 < "${srcdir}/0002-Quick-Dirty-patch-to-allow-finding-ngspice-on-Arch-L.patch"

  # Allow finding Clipper1 on Arch Linux
  patch -p1 < "${srcdir}/0003-Quick-Dirty-patch-to-allow-finding-Clipper1-on-Arch-.patch"

  # Fix build issues with Qt 6.9
  patch -p1 < "${srcdir}/0004-Work-around-build-issues-with-Qt-6.9.patch"

  # Disable broken font scaling (#3221)
  sed -i 's/Exec=Fritzing/Exec=env QT_AUTO_SCREEN_SCALE_FACTOR=0 Fritzing/' org.fritzing.Fritzing.desktop
}

build() {
  cd "${srcdir}"/fritzing-app

  # build translations
  /usr/lib/qt6/lrelease-pro phoenix.pro

  mkdir build && cd build
  qmake6 ..
  make
}

package() {
  cd "${srcdir}"/fritzing-app/build
  make INSTALL_ROOT="${pkgdir}" install

  # Remove RUNPATH that points to build dir from Fritzing binary
  patchelf --remove-rpath "${pkgdir}"/usr/bin/Fritzing

  # We want a system-wide installation of the parts library. Following steps are
  # derived from tools/linux_release_script/release.sh. However, we drop the .git
  # subfolder afterwards as it is not required at runtime.
  cp -dr "${srcdir}"/fritzing-parts "${pkgdir}"/usr/share/fritzing/
  "${pkgdir}"/usr/bin/Fritzing \
    -db "${pkgdir}"/usr/share/fritzing/fritzing-parts/parts.db \
    -pp "${pkgdir}"/usr/share/fritzing/fritzing-parts \
    -f  "${pkgdir}"/usr/share/fritzing \
    -platform offscreen
  rm -rf "${pkgdir}"/usr/share/fritzing/fritzing-parts/.git{,ignore}
}
