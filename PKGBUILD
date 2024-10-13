# Maintainer: Fabio 'Lolix' Loli <fabio.loli@disroot.org> -> https://github.com/FabioLolix
# Maintainer: C. R. <crdaley at gmail>
# Contributor: Chris Rizzitello <sithlord48@gmail.com>
# Contributor: Lahfa Samy <akechishiro-aur@lahfa.xyz>
# Contributor: Chih-Hsuan Yen <base64_decode("eWFuMTIxMjUgQVQgYXJjaGxpbnV4IERPVCBvcmc=")>
# Forked from aur/barrier-git
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=input-leap
pkgbase=$_pkgname
pkgname=($_pkgname-headless $_pkgname)
pkgver=3.0.2
pkgrel=1
pkgdesc="Open-source KVM software"
arch=(x86_64)
url="https://github.com/input-leap/input-leap"
license=("custom:GPL2WithOpenSSLException")

source=("${_pkgname}::git+${url}.git#tag=v${pkgver}")
sha512sums=('a26c365b5c1e482d14d9b72e38ae7abfb738e241cfe0bf81806ea9cf5418fc58ad2af8e47fc97b2a537768acfe1b584b409019bf1e3389cfc4d567931e3bbe59')
_core_deps=(glibc gcc-libs libx11 libxrandr libxext libxinerama xorgproto libxtst libxi openssl libei libportal)
_gui_deps=(glibc gcc-libs libx11 openssl avahi qt6-base xdg-desktop-portal)
makedepends=(${_core_deps[@]} ${_gui_deps[@]}
             # referenced in CMakeLists.txt but does not seem to be actually used
             libsm libice qt6-tools
             git cmake gmock gtest)

optdepends=(libportal-gtk3 libportal-gtk4 libportal-qt5 libportal-qt6)

prepare() {
  cd $_pkgname
  git submodule init
}

build() {
  cmake -B build -S $_pkgname \
      -D CMAKE_VERBOSE_MAKEFILE:BOOL=true \
      -D CMAKE_BUILD_TYPE:STRING=None \
      -D CMAKE_INSTALL_PREFIX:STRING=/usr \
      -D INPUTLEAP_VERSION_STAGE:STRING=release \
      -D INPUTLEAP_USE_EXTERNAL_GTEST:bool=true \
      -D INPUTLEAP_BUILD_LIBEI=TRUE \
      -D QT_DEFAULT_MAJOR_VERSION=6
  cmake --build build
}

_package_common() {
  # Install binaries:
  DESTDIR="${pkgdir}" cmake --install build

  # Install the license:
  cd $_pkgname
  install -Dm644 -D LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_input-leap-headless() {
  pkgdesc+=" (client and server CLI binaries)"
  depends=(${_core_deps[@]})
  provides=("input-leap-headless=$pkgver" "barrier-headless=$pkgver")
  conflicts=(input-leap-headless barrier-headless)

  # Install all the files:
  _package_common

  # Install the manpages:
  install -Dm644 doc/*.1 -t "$pkgdir"/usr/share/man/man1

  # Install the examples:
  install -Dm644 doc/input-leap.conf* -t "$pkgdir"/usr/share/doc/$pkgname

  # Now go and delete the GUI-related files:
  for file in /usr/bin/input-leap /usr/share/applications /usr/share/icons /usr/share/metainfo; do
    rm -rv "${pkgdir}/${file}"
  done
}

package_input-leap() {
  pkgdesc+=" (GUI)"
  depends=(input-leap-headless ${_gui_deps[@]})
  provides=("input-leap=$pkgver" "barrier=$pkgver")
  conflicts=(input-leap barrier)

  # Install all the files:
  _package_common

  # Now go and delete files that are already in
  # input-leap-headless-git:
  for file in /usr/bin/input-leap{s,c} /usr/share/man; do
    rm -rv "${pkgdir}/${file}"
  done
}
