# Maintainer: Lahfa Samy <akechishiro-aur@lahfa.xyz>
# Contributor: Chih-Hsuan Yen <base64_decode("eWFuMTIxMjUgQVQgYXJjaGxpbnV4IERPVCBvcmc=")>
# Forked from aur/barrier-git
# Contributor: Pellegrino Prevete <pellegrinoprevete@gmail.com>

_pkgname=input-leap-inputcapture
pkgbase=$_pkgname
pkgname=($_pkgname-headless $_pkgname)
pkgver=2.4.0+677+gc5bb9dca
pkgrel=1
pkgdesc="Open-source KVM software"
arch=(x86_64)
url="https://github.com/input-leap/input-leap"
license=("custom:GPL2WithOpenSSLException")
source=("${_pkgname}::git+${url}.git"
        "gulrak-filesystem::git+https://github.com/gulrak/filesystem.git")
sha512sums=('SKIP'
            'SKIP')
_core_deps=(glibc gcc-libs libx11 libxrandr libxext libxinerama xorgproto libxtst libxi openssl)
_gui_deps=(glibc gcc-libs libx11 openssl avahi qt5-base qt5-tools)
makedepends=(${_core_deps[@]} ${_gui_deps[@]}
             # referenced in CMakeLists.txt but does not seem to be actually used
             curl libsm libice
             git cmake gmock gtest libportal-inputcapture libportal-inputcapture-gtk3 libportal-inputcapture-gtk4 libportal-inputcapture-qt5 libportal-inputcapture-docs libei)

pkgver() {
  cd $_pkgname
  git describe --tags | sed 's/-/+/g;s/^v//'
}

prepare() {
  cd $_pkgname
  git submodule init
  git config submodule.ext/gulrak-filesystem.url "$srcdir"/gulrak-filesystem
  git -c protocol.file.allow=always submodule update ext/gulrak-filesystem
}

build() {
  cmake -B build -S $_pkgname \
      -D CMAKE_VERBOSE_MAKEFILE:BOOL=true \
      -D CMAKE_BUILD_TYPE:STRING=None \
      -D CMAKE_INSTALL_PREFIX:STRING=/usr \
      -D INPUTLEAP_VERSION_STAGE:STRING=snapshot \
      -D INPUTLEAP_USE_EXTERNAL_GTEST:bool=true \
      -D INPUTLEAP_BUILD_LIBEI=TRUE
  cmake --build build
}

_package_common() {
  # Install binaries:
  DESTDIR="${pkgdir}" cmake --install build

  # Install the license:
  cd $_pkgname
  install -Dm644 -D LICENSE -t "$pkgdir"/usr/share/licenses/$pkgname
}

package_input-leap-inputcapture-headless() {
  pkgdesc+=" (client and server CLI binaries)"
  depends=(${_core_deps[@]}
  libportal-inputcapture libportal-inputcapture-gtk3 libportal-inputcapture-gtk4 libportal-inputcapture-qt5 libportal-inputcapture-docs)
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

package_input-leap-inputcapture() {
  pkgdesc+=" (GUI)"
  depends=(input-leap-inputcapture-headless ${_gui_deps[@]}
  libportal-inputcapture libportal-inputcapture-gtk3 libportal-inputcapture-gtk4 libportal-inputcapture-qt5 libportal-inputcapture-docs)
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

