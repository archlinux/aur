# Maintainer: libele <libele@disroot.org>

pkgname=inform7-git
_pkgname=inform7
_gitpkg=inform
pkgver=10.2.0_beta+6V50
pkgrel=1
pkgdesc="A design system for interactive fiction based on natural language (git version)"
arch=('aarch64' 'arm' 'armv6h' 'armv7h' 'i486' 'i686' 'pentium4' 'x86_64')
url="https://ganelson.github.io/inform"
license=('Artistic2.0')
makedepends=('git' 'rsync')
provides=('inform' 'inform7')
conflicts=('inform7')
groups=(inform)
options=(!buildflags !makeflags)

source=('git+https://github.com/ganelson/inform'
	'git+https://github.com/ganelson/inweb'
	'git+https://github.com/ganelson/intest'
	'make-integration-settings.mk'
	'wrapper.sh')

md5sums=('SKIP'
	 'SKIP'
	 'SKIP'
	 '085007a124028daedf369c0fa0549b2a'
	 '07fb211a928d44d3cf221f3760911957')

pkgver() {
  cd "$_gitpkg"
  head -n 3 < README.md | tail -n 1 | cut -d ' ' -f 2 | sed 's/-/_/g'
}

build() {
  cd "$srcdir"

  bash inweb/scripts/first.sh linux
  bash intest/scripts/first.sh

  cd "$_gitpkg"
  bash scripts/first.sh
  ../intest/Tangled/intest inform7 -show Acidity
  make

  make retrospective
}

check() {
  cd "$_gitpkg"
  make check
}

package() {
  cd "$_gitpkg"
  make forceintegration

  cd "$srcdir"
  cp -a dist/* "$pkgdir"

  install -Dm755 wrapper.sh "$pkgdir/usr/bin/inform7"

  cd "$srcdir/inform/retrospective/6L02"
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
