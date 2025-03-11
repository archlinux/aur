# Maintainer: Michael Lass <bevan@bi-co.net>
# Contributor: Tolga HOŞGÖR <fasdfasdas@gmail.com>
# Contributor: Henning Mueller <henning@orgizm.net>

# This PKGBUILD is maintained on github:
# https://github.com/michaellass/AUR

pkgname=fritzing

# We drop the "b" at the end of the version number. It probably means beta
# while there is also "d" for development versions. This would not be correctly
# parsed by `pkgver` anyway (d > b), so let's leave out the b suffix entirely.
pkgver=1.0.4
pkgrel=2

# Tag version can be obtained from github release page. Sometimes this is the
# version number itself, sometimes some CD-magicnumber thing. There can be
# multiple CD-magicnumberthings for the same version number so it's a bit of a
# guess what corresponds to the latest official release.
#_tagver=0.9.8

# This is probably close to what has been released
_gitrev=a8c6ef7cf66f7a42b9b233d6137f1b70a9573a25

# Parts come from a different respository and are not versioned anymore since
# 2016. Sometimes we can get the revision by downloading the release build,
# unpacking it and using `git show` on the resources/parts folder. Nowadays the
# release build seems to be hidden behind a paywall. Then we need to guess
# based on the master branch of the fritzing-parts repository and the date when
# the release archive was created.
_partsrev=76235099ed556e52003de63522fdd74e61d53a36

pkgdesc='PCB layout prototyping application'
arch=('aarch64' 'i686' 'x86_64')
url=http://fritzing.org
license=('GPL-3.0-only AND CC-BY-SA-3.0 AND BSL-1.0') # fritzing, fritzing-parts, svgpp
install=fritzing.install
makedepends=('boost' 'git' 'qt6-tools')
depends=('libgit2' 'polyclipping' 'qt6-serialport' 'qt6-svg' 'quazip-qt6' 'ngspice')
source=("git+https://github.com/fritzing/fritzing-app.git#commit=${_gitrev}"
        "git+https://github.com/fritzing/fritzing-parts.git#commit=${_partsrev}"
        svgpp-1.3.1.tar.gz::https://github.com/svgpp/svgpp/archive/refs/tags/v1.3.1.tar.gz
        0001-Quick-Dirty-patch-to-allow-finding-quazip-qt6-on-Arc.patch
        0002-Quick-Dirty-patch-to-allow-finding-ngspice-on-Arch-L.patch
        0003-Quick-Dirty-patch-to-allow-finding-Clipper1-on-Arch-.patch)
sha256sums=('dd76c7c9c4e24663b01ba240757bbce07b5b2733b8255449929444ec7da80074'
            '0078203d4ce7d6d94270a5e4f23451a175ad0e05782a036c6b1e5799dab7d8f4'
            'be8a89df72d01cf062cc9815dd64c9576b4d20910d6d7aee7f0ea26484dc5e76'
            'd783b463f84bb0efad20070ccc189fd70c89d027bf9aeea5ec28d802057c4a85'
            '845111a3e46e78b5410c2129f00b219fdcab8b5df27906541b8225fc7374e2b7'
            '852d32cce399cd00896455701c51b7f4373e5a26ec664d7e3c299714f8038e6c')

prepare() {
  cd "${srcdir}"/fritzing-app

  # Allow use of newer Qt versions
  git revert -n 1bf5a03f27b7401631baaedb1ceb9c313a5ffe3d
  git revert -n 20eeb4c2f95f3de669e90a1f3fa2ac49cdcc33ac
  sed -i 's/RECOMMENDED_QT_VERSION = 6.4.3/RECOMMENDED_QT_VERSION = 6.5.3/g' "${srcdir}"/fritzing-app/phoenix.pro

  # Allow finding quazip-qt6 on Arch Linux
  patch -p1 < "${srcdir}/0001-Quick-Dirty-patch-to-allow-finding-quazip-qt6-on-Arc.patch"

  # Allow finding ngspice on Arch Linux
  patch -p1 < "${srcdir}/0002-Quick-Dirty-patch-to-allow-finding-ngspice-on-Arch-L.patch"

  # Allow finding Clipper1 on Arch Linux
  patch -p1 < "${srcdir}/0003-Quick-Dirty-patch-to-allow-finding-Clipper1-on-Arch-.patch"

  # Dynamically link against system libgit2
  sed -i 's/LIBGIT_STATIC = true/LIBGIT_STATIC = false/' phoenix.pro

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
