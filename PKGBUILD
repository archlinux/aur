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
pkgrel=3

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
            '7f4a5319d08ac26e335a6ea9ce9be5da1a5a5f475a26101e973e08a6a2b33d80'
            '02fe5f5bcd26e0106b0e7fab80b8327cb560c4b85225d11de554c042ae7d0a2d'
            'ca77b2fc9c5170388744bad976ca9d2e585d80a229e97d716f8f45541ca5b021'
            '17067bfcd00156d234ea94e6274066cd127250a84bbe3a18712a06126c286c9e')

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
