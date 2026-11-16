# Maintainer: Rasmus Moorats <xx+aur@nns.ee>

pkgname=qdigidoc4-git
_pkgname=qdigidoc4
pkgver=4.12.0.r1418.g5c97e96
pkgrel=1
pkgdesc="DigiDoc4 Client for digitally signing and encrypting documents and managing the Estonian ID-card (git master)"
arch=('x86_64')
url="https://github.com/open-eid/DigiDoc4-Client"
license=('LGPL-2.1-or-later')
depends=('glibc' 'libgcc' 'libstdc++' 'hicolor-icon-theme' 'libdigidocpp>=4.6.0' 'libldap' 'libxml2'
  'opensc' 'openssl' 'pcsclite' 'qt6-base' 'qt6-svg' 'zlib')
makedepends=('cmake' 'flatbuffers' 'gettext' 'git' 'qt6-tools' 'qt6-translations')
optdepends=('ccid: smart card reader support'
  'python-nautilus: Nautilus extension')
provides=("$_pkgname=${pkgver%%.r*}")
conflicts=("$_pkgname")
# Trust lists and central configuration are fetched here so that build() needs no network.
source=("$_pkgname::git+https://github.com/open-eid/DigiDoc4-Client.git"
  "open-eid-qt-common::git+https://github.com/open-eid/qt-common.git"
  "open-eid-libcdoc::git+https://github.com/open-eid/libcdoc.git"
  "eu-lotl.xml::https://ec.europa.eu/tools/lotl/eu-lotl.xml"
  "EE.xml::https://sr.riik.ee/tsl/estonian-tsl.xml"
  "config.json::https://id.eesti.ee/config.json"
  "config.ecc::https://id.eesti.ee/config.ecc"
  "config.ecpub::https://id.eesti.ee/config.ecpub")
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')

pkgver() {
  cd "$_pkgname"
  printf '%s.r%s.g%s' \
    "$(sed -n 's/^project([^ ]* VERSION \([0-9.]*\).*/\1/p' CMakeLists.txt)" \
    "$(git rev-list --count HEAD)" \
    "$(git rev-parse --short=7 HEAD)"
}

prepare() {
  cd "$_pkgname"
  git submodule init
  git config submodule.common.url "$srcdir/open-eid-qt-common"
  git config submodule.client/libcdoc.url "$srcdir/open-eid-libcdoc"
  git -c protocol.file.allow=always submodule update

  cp "$srcdir/eu-lotl.xml" "$srcdir/EE.xml" client/
  cp "$srcdir/config.json" "$srcdir/config.ecc" "$srcdir/config.ecpub" common/
}

build() {
  BUILD_NUMBER=$(git -C "$_pkgname" rev-list --count HEAD) \
    cmake -B build -S "$_pkgname" -Wno-dev \
    -DCMAKE_BUILD_TYPE=None \
    -DCMAKE_INSTALL_PREFIX=/usr \
    -DCMAKE_INSTALL_LIBDIR=lib \
    -DCMAKE_INSTALL_SYSCONFDIR=/etc
  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build
}
