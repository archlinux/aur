# Maintainer: kevku <kevku@gmx.com>
pkgname=qdigidoc4
pkgver=4.12.0.0+aeaca6c
_rls_tag=v4.11.2
pkgrel=1
pkgdesc="DigiDoc4 Client is an application for digitally signing and encrypting documents; the software includes functionality to manage Estonian ID-card - change pin codes, update certificates etc."
arch=('x86_64')
url="https://www.id.ee/"
license=('LGPL-2.1-or-later')
depends=('zlib' 'openssl' 'libdigidocpp>=4.5.0' 'libldap' 'pcsclite' 'opensc' 'qt6-base' 'qt6-svg' 'hicolor-icon-theme')
makedepends=('git' 'cmake' 'gettext' 'flatbuffers' 'qt6-tools' 'qt6-translations')
optdepends=('ccid: Smart Card support'
            'python-nautilus: Nautilus Extension')
source=("$pkgname-$pkgver::git+https://github.com/open-eid/DigiDoc4-Client.git?#commit=aeaca6c"
        "open-eid-common::git+https://github.com/open-eid/qt-common.git"
        "open-eid-libcdoc::git+https://github.com/open-eid/libcdoc.git"
        "eu-lotl.xml-$pkgver::https://ec.europa.eu/tools/lotl/eu-lotl.xml"
        "EE.xml-$pkgver::https://sr.riik.ee/tsl/estonian-tsl.xml"
        "config.json-$pkgver::https://id.eesti.ee/config.json"
        "config.rsa-$pkgver::https://id.eesti.ee/config.rsa"
        "config.pub-$pkgver::https://id.eesti.ee/config.pub")
sha256sums=('c0dd90e382159628d3c6aa7aeff7e6e3e3f7387f460bf6d2d6e7e79a08430b42'
            'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP')
validpgpkeys=(
    'D1EBC666EFCBFBD3CFC2EBAA90C0B5E75C3B195D'  # Raul Metsma https://github.com/metsma.gpg
)

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  git submodule init
  git config submodule.common.url $srcdir/open-eid-common
  git config submodule.client/libcdoc.url $srcdir/open-eid-libcdoc
  git -c protocol.file.allow=always submodule update

  [[ -d "$pkgname-build" ]] && rm -r "$pkgname-build"
  mkdir -p "$pkgname-build"
  # https://github.com/open-eid/DigiDoc4-Client/wiki/DeveloperTips
  cp "$srcdir/eu-lotl.xml-$pkgver"  "client/eu-lotl.xml"
  cp "$srcdir/EE.xml-$pkgver"       "client/EE.xml"
  cp "$srcdir/config.json-$pkgver"  "common/config.json"
  cp "$srcdir/config.rsa-$pkgver"   "common/config.rsa"
  cp "$srcdir/config.pub-$pkgver"   "common/config.pub"
}

build() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
  # export BUILD_NUMBER=${pkgver##*.}
  cmake .. -DCMAKE_C_FLAGS:STRING="${CFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_CXX_FLAGS:STRING="${CXXFLAGS} -ffile-prefix-map=$srcdir=." \
           -DCMAKE_EXE_LINKER_FLAGS:STRING="${LDFLAGS}" \
           -DCMAKE_INSTALL_PREFIX="/usr" \
           -DCMAKE_INSTALL_LIBDIR="lib" \
           -DCMAKE_INSTALL_SYSCONFDIR="/etc"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver/$pkgname-build"
  make DESTDIR="$pkgdir/" install
}
