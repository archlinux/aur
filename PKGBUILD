#!i/hint/bash
# Maintainer :  gosi <gosi@aon.at>
# Contributor : bartus <arch-user-repository{at}bartus.33mail.com>
# Contributor : Lars Hagström <lars@foldspace.nu>
# Contributor : Nephyrin Zey <nephyrin@doublezen.net>
# Contributor : John Schoenick <john@pointysoftware.net>
# Contributor : Geoffrey Teale <tealeg@googlemail.com>

pkgname=google-breakpad
pkgver=v2023.06.01
pkgrel=3
_lssver=v2024.02.01
pkgdesc="An open-source multi-platform crash reporting system"
arch=('i686' 'x86_64' 'armv7h')
url="https://chromium.googlesource.com/breakpad/breakpad/"
license=('BSD')
makedepends=('git')
depends=('gcc-libs')
options=('staticlibs' '!strip')
conflicts=('google-breakpad-git')
provides=('google-breakpad')
source=("${pkgname}-${pkgver}.tar.gz::https://chromium.googlesource.com/breakpad/breakpad/+archive/refs/tags/${pkgver}.tar.gz"
        "lss-${_lssver}.tar.gz::https://chromium.googlesource.com/linux-syscall-support/+archive/refs/tags/${_lssver}.tar.gz"
        "find_if.patch")
noextract=("lss-${_lssver}.tar.gz")
sha256sums=('SKIP'
            'SKIP'
            '0744d7e2238d7e4a4a284e1508ee0ebc81a1ffccdd0c92dd7851a2e87d78ea23')

prepare() {
mkdir -p src/third_party/lss
bsdtar -xf lss-${_lssver}.tar.gz -C src/third_party/lss
patch -Np0 -i ../find_if.patch
}

build() {
  echo "Configuring"
  autoreconf
  ./configure --prefix=/usr --libexecdir=/usr/lib/${pkgname}
  echo "Building"
  make
}

package() {
  make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/$pkgname/LICENSE"
}
