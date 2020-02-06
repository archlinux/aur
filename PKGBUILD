# SPDX-FileCopyrightText: 2018-2020 Michael Picht
#
# SPDX-License-Identifier: GPL-3.0-or-later

# Maintainer: Michael Picht <michael dot picht at ussenterprise dot de>

_pkgorg=gitlab.com/mipimipi
pkgname=smsync-git
_pkgname=smsync
pkgver=3.4.0.r1.gc34ff52
pkgrel=1
pkgdesc="smsync (Smart Music Sync) keeps huge music collections in sync and is takes care of conversions between different file formats. It's an easy-to-use command line application for Linux"
arch=('x86_64' 'i686')
url="https://$_pkgorg/$_pkgname/"
license=('GPL3')
depends=('ffmpeg')
makedepends=(
    dep
    git
    go-pie
)
source=("git+https://$_pkgorg/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
  cd "$_pkgname"
  git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  mkdir -p gopath/src/$_pkgorg
  ln -rTsf $_pkgname gopath/src/$_pkgorg/$_pkgname
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_pkgorg/$_pkgname
  dep ensure
}

build() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_pkgorg/$_pkgname
  make VERSION=$pkgver
}

package() {
  export GOPATH="$srcdir"/gopath
  cd gopath/src/$_pkgorg/$_pkgname
  make DESTDIR="$pkgdir" install
}
