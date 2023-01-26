# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing

# We drop the "b" at the end of the version number. It probably means beta
# while there is also "d" for development versions. This would not be correctly
# parsed by `pkgver` anyway (d > b), so let's leave out the b suffix entirely.
pkgver=0.9.10
pkgrel=2

# Tag version can be obtained from github release page. Sometimes this is the
# version number itself, sometimes some CD-magicnumber thing. There can be
# multiple CD-magicnumberthings for the same version number so it's a bit of a
# guess what corresponds to the latest official release.
#_tagver=0.9.8

# This is probably closest to what has been released as 0.9.10.
_gitrev=29c2cede3a0475ed770db1ee502fdebf6bf3a23d

# Parts come from a different respository and are not versioned anymore since
# 2016. Sometimes we can get the revision by downloading the release build,
# unpacking it and using `git show` on the resources/parts folder. Nowadays the
# release build seems to be hidden behind a paywall. Then we need to guess
# based on the master branch of the fritzing-parts repository and the date when
# the release archive was created.
_partsrev=4713511c894cb2894eae505b9307c6555afcc32c

pkgdesc='PCB layout prototyping application'
arch=('aarch64' 'i686' 'x86_64')
url=http://fritzing.org
license=(GPL3)
install=fritzing.install
makedepends=('boost' 'git')
depends=('libgit2' 'qt5-serialport' 'qt5-svg' 'quazip-qt5' 'ngspice')
source=("git+https://github.com/fritzing/fritzing-app.git#commit=${_gitrev}"
        "git+https://github.com/fritzing/fritzing-parts.git#commit=${_partsrev}"
        0001-Quick-Dirty-patch-to-allow-finding-quazip-qt5-on-Arc.patch)
sha256sums=('SKIP'
            'SKIP'
            '65e0818e959f07209928907ddeb76c3e73229fdc0a049c433c842621d59e6e32')

prepare() {
  cd "${srcdir}"/fritzing-app

  # Allow finding quazip-qt5 on Arch Linux
  patch -p1 < "${srcdir}/0001-Quick-Dirty-patch-to-allow-finding-quazip-qt5-on-Arc.patch"

  # Dynamically link against system libgit2
  sed -i 's/LIBGIT_STATIC = true/LIBGIT_STATIC = false/' phoenix.pro

  # Disable broken font scaling (#3221)
  sed -i 's/Exec=Fritzing/Exec=env QT_AUTO_SCREEN_SCALE_FACTOR=0 Fritzing/' org.fritzing.Fritzing.desktop
}

build() {
  cd "${srcdir}"/fritzing-app

  mkdir build && cd build
  qmake-qt5 ..
  make
}

package() {
  cd "${srcdir}"/fritzing-app/build
  make INSTALL_ROOT="${pkgdir}" install

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
