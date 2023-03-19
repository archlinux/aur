#!i/hint/bash
# Maintainer :  gosi <gosi@aon.at>
# Contributor : bartus <arch-user-repository{at}bartus.33mail.com>
# Contributor : Lars Hagström <lars@foldspace.nu>
# Contributor : Nephyrin Zey <nephyrin@doublezen.net>
# Contributor : John Schoenick <john@pointysoftware.net>
# Contributor : Geoffrey Teale <tealeg@googlemail.com>

pkgname=google-breakpad
pkgver=v2022.07.12
pkgrel=1
_lssver=v2022.10.12
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
        "lss-${_lssver}.tar.gz::https://chromium.googlesource.com/linux-syscall-support/+archive/refs/tags/${_lssver}.tar.gz")
noextract=("lss-${_lssver}.tar.gz")
sha256sums=('SKIP'
            'SKIP')

prepare() {
mkdir -p src/third_party/lss
bsdtar -xf lss-${_lssver}.tar.gz -C src/third_party/lss
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
