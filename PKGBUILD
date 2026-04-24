# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing

# We drop the "b" at the end of the version number. It probably means beta
# while there is also "d" for development versions. This would not be correctly
# parsed by `pkgver` anyway (d > b), so let's leave out the b suffix entirely.
pkgver=1.0.7
pkgrel=1

# Tag version can be obtained from github release page. Sometimes this is the
# version number itself, sometimes some CD-magicnumber thing. There can be
# multiple CD-magicnumberthings for the same version number so it's a bit of a
# guess what corresponds to the latest official release.
#_tagver=0.9.8

# This is probably close to what has been released
_gitrev=394a8bb4791424ffd99f99ebc330264d4becea63

# Parts come from a different respository and are not versioned anymore since
# 2016. Sometimes we can get the revision by downloading the release build,
# unpacking it and using `git show` on the resources/parts folder. Nowadays the
# release build seems to be hidden behind a paywall. Then we need to guess
# based on the master branch of the fritzing-parts repository and the date when
# the release archive was created.
_partsrev=70a1773402e8c76a77795637de482a83db3ca6d7

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
        0004-Remove-Qt-version-requirements.patch)
sha256sums=('SKIP'
            'SKIP'
            'be8a89df72d01cf062cc9815dd64c9576b4d20910d6d7aee7f0ea26484dc5e76'
            '8e95f863f72a4d31a2e541cf550d0d81582a64f04d7b07519114496fa054e3e6'
            '960209b2ad321d33efb856c82a650be67a0952681291befa83d8d6424014659d'
            '1ddf6b7166e60df8b2c63daf74aadf406e0b2add391c8b8b2c5be11403c99caa'
            '5eb7da57529d7136bf831e0d21489d232b9c82fdd7bc510bf292b6821533098b')

prepare() {
  cd "${srcdir}"/fritzing-app

  # Allow finding quazip-qt6 on Arch Linux
  patch -p1 < "${srcdir}/0001-Quick-Dirty-patch-to-allow-finding-quazip-qt6-on-Arc.patch"

  # Allow finding ngspice on Arch Linux
  patch -p1 < "${srcdir}/0002-Quick-Dirty-patch-to-allow-finding-ngspice-on-Arch-L.patch"

  # Allow finding Clipper1 on Arch Linux
  patch -p1 < "${srcdir}/0003-Quick-Dirty-patch-to-allow-finding-Clipper1-on-Arch-.patch"

  # Allow use of newer Qt versions
  patch -p1 < "${srcdir}/0004-Remove-Qt-version-requirements.patch"

  # Disable broken font scaling (#3221)
  sed -i 's/Exec=Fritzing/Exec=env QT_AUTO_SCREEN_SCALE_FACTOR=0 Fritzing/' org.fritzing.Fritzing.desktop
}

build() {
  cd "${srcdir}"/fritzing-app

  # build translations
  /usr/bin/lrelease-pro6 phoenix.pro

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
