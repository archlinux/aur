# $Id: PKGBUILD 203202 2014-01-05 10:51:18Z bpiotrowski $
# Maintainer: Nikos Fytilis <n-fit@live.com>
# Repo Maintainer: Daniel Isenmann <daniel@archlinux.org>
# Contributor: Carlos Ruiz <cailovirtual@gmail.com>

_pkgbase=taglib-sharp
pkgname=$_pkgbase-git
pkgver=2.1.0.0.r248.g60e7588
pkgrel=2
pkgdesc="Library for reading and writing metadata in media files for Mono - source from git for working opus files"
arch=('i686' 'x86_64')
url="https://github.com/mono/taglib-sharp"
license=('LGPL2.1')
depends=('mono')
conflicts=(taglib-sharp)
provides=("taglib-sharp=${pkgver%%.r*}")
source=(git+https://github.com/mono/taglib-sharp.git
sign.patch)
md5sums=('SKIP'
         'fb6bb9fc76b88a449fb1466569194da0')
pkgver() {
  cd "$srcdir/$_pkgbase"
  git describe --long | sed 's/^taglib-sharp-//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/$_pkgbase"
  git reset --hard 60e7588b53868a2b37dd0bc92868b740da2eeded
  patch src/Makefile.am "$srcdir/sign.patch"
}

build() {
  cd "$srcdir/$_pkgbase"
  ./autogen.sh --prefix=/usr --disable-docs
  make
}

package() {
  cd "$srcdir/$_pkgbase"
  make DESTDIR=${pkgdir} install
}
