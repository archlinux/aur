# Maintainer:
# Contributor: Rustmilian Rustmilian@proton.me

_pkgname="calamares"
pkgname="$_pkgname"
pkgver=3.4.2
pkgrel=2
pkgdesc="Distribution-independent installer framework"
url="https://codeberg.org/Calamares/calamares"
license=("GPL-3.0-or-later")
arch=('i686' 'x86_64')

depends=(
  'kcoreaddons'
  'kpmcore'
  'libpwquality'
  'qt6-declarative'
  'qt6-svg'
  'yaml-cpp'
)
makedepends=(
  'extra-cmake-modules'
  'libglvnd'
  'ninja'
  'qt6-tools'
  'qt6-translations'
)

_pkgext="tar.gz"
source=("$_pkgname-$pkgver.$_pkgext"::"$url/releases/download/v$pkgver/$_pkgname-$pkgver.$_pkgext")
sha256sums=('733bbbb00dc9f84874bd5c22960952f317ea2537565431179fa2152b2fbfdccc')

build() {
  local _skip_modules=(
    dracut
    dracutlukscfg
    dummycpp
    dummyprocess
    dummypython
    dummypythonqt
    initramfs
    initramfscfg
    interactiveterminal
    packagechooser
    packagechooserq
    services-openrc
  )

  # Correct source directory (inside src/)
  local _pkgsrc_dir="$srcdir/$_pkgname-$pkgver"

  local _cmake_options=(
    -B build
    -S "$_pkgsrc_dir"
    -G Ninja
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_INSTALL_PREFIX='/usr'
    -DCMAKE_INSTALL_LIBDIR='lib'
    -DWITH_QT6=ON
    -DINSTALL_CONFIG=ON
    -DSKIP_MODULES="${_skip_modules[*]}"
    -DBUILD_TESTING=OFF

    # Explicit KDE install dirs to suppress warnings
    -DKDE_INSTALL_BINDIR=/usr/bin
    -DKDE_INSTALL_SBINDIR=/usr/sbin
    -DKDE_INSTALL_LIBDIR=/usr/lib
    -DKDE_INSTALL_LIBEXECDIR=/usr/libexec
    -DKDE_INSTALL_INCLUDEDIR=/usr/include
    -DKDE_INSTALL_LOCALSTATEDIR=/var
    -DKDE_INSTALL_SHAREDSTATEDIR=/usr/share
    -DKDE_INSTALL_DATAROOTDIR=/usr/share
    -DKDE_INSTALL_DATADIR=/usr/share
    -DKDE_INSTALL_LOCALEDIR=/usr/share/locale
    -DKDE_INSTALL_MANDIR=/usr/share/man
    -DKDE_INSTALL_INFODIR=/usr/share/info
    -DKDE_INSTALL_SYSCONFDIR=/etc

    -Wno-dev
  )

  cmake "${_cmake_options[@]}"
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
