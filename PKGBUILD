# Maintainer: libele <libele@disroot.org>
# Contributor: Jonathan Liu <net147@gmail.com>

pkgname=inform7
_pkgname=inform
pkgver=10.1.2
_inwebver=7.2.0
_intestver=2.1.0
pkgrel=2
pkgdesc="A design system for interactive fiction based on natural language"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://ganelson.github.io/inform"
license=('Artistic2.0')
makedepends=('rsync')
provides=('inform' 'inform7')
groups=(inform)
options=(!buildflags !makeflags)

source=("$_pkgname-$pkgver.tar.gz::https://github.com/ganelson/inform/archive/refs/tags/v$pkgver.tar.gz"
	"inweb-$_inwebver.tar.gz::https://github.com/ganelson/inweb/archive/refs/tags/v$_inwebver.tar.gz"
	"intest-$_intestver.tar.gz::https://github.com/ganelson/intest/archive/refs/tags/v$_intestver.tar.gz"
	'make-integration-settings.mk'
	'wrapper.sh')

sha256sums=('145cae27638c2dde4979f37b67d60de3243f6ee6456b808426fb9dcbda850dd0'
            '0fa772ed3b2e7c7242be6dbfad319bc213f49881eba56549248f90ea1a47fbcf'
            '3a5c86005212b3aa68064e133abed54529a83c7c6963a845afadbcc7db1d647e'
            '5a42023a0de9ba0e8bc9fb0d17713d6d4827d297dbd28c9a84c6a2267098d845'
            'acd2313b91b9bc0d3b55da3691b2e8fd7fefd3550ff2983f7648fbf61cabf3cb')

build() {
  cd "$srcdir"
  mv "inweb-$_inwebver" inweb
  mv "intest-$_intestver" intest

  bash inweb/scripts/first.sh linux
  bash intest/scripts/first.sh

  cd "$_pkgname-$pkgver"
  bash scripts/first.sh
  ../intest/Tangled/intest inform7 -show Acidity
  make

  make retrospective
}

check() {
  cd "$_pkgname-$pkgver"
  make check
}

package() {
  cd "$_pkgname-$pkgver"
  make forceintegration

  cd "$srcdir"
  cp -a dist/* "$pkgdir"

  install -Dm755 wrapper.sh "$pkgdir/usr/bin/inform7"

  cd "$_pkgname-$pkgver/retrospective/6L02"
  install -Dm755 cBlorb "$pkgdir/usr/lib/$_pkgname/retrospective/6L02/cBlorb"
  install -Dm755 ni "$pkgdir/usr/lib/$_pkgname/retrospective/6L02/ni"
  cp -ar Extensions "$pkgdir/usr/lib/$_pkgname/retrospective/6L02/Extensions"

  cd ../6L38
  install -Dm755 cBlorb "$pkgdir/usr/lib/$_pkgname/retrospective/6L38/cBlorb"
  install -Dm755 ni "$pkgdir/usr/lib/$_pkgname/retrospective/6L38/ni"
  cp -ar Internal "$pkgdir/usr/lib/$_pkgname/retrospective/6L38/Internal"

  cd ../6M62
  install -Dm755 cBlorb "$pkgdir/usr/lib/$_pkgname/retrospective/6M62/cBlorb"
  install -Dm755 ni "$pkgdir/usr/lib/$_pkgname/retrospective/6M62/ni"
  cp -ar Internal "$pkgdir/usr/lib/$_pkgname/retrospective/6M62/Internal"
}
