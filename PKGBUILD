# Maintainer: Elia Nitsche <nitscheelia at gmail.com>
# Contributor: envolution
# Contributor: l-koehler <lorenz.koehler@posteo.de>
# Contributor: katt <magunasu.b97@gmail.com>
# Contributor: Antonio Rojas <arojas@archlinux,org>
# Contributor: Felix Yan <felixonmars@archlinux.org>
# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Pierre Schmitz <pierre@archlinux.de>
# shellcheck shell=bash disable=SC2034,SC2154

pkgname=dolphin-git
_pkgname=dolphin
pkgver=25.04.0.r76.gd7d3838
pkgrel=1
pkgdesc='KDE File Manager (git)'
arch=(x86_64)
url='https://invent.kde.org/system/dolphin'
license=(LGPL-2.0-or-later)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}")
depends=(baloo
  baloo-widgets
  gcc-libs
  glibc
  kbookmarks
  kcmutils
  kcodecs
  kcolorscheme
  kcompletion
  kconfig
  kconfigwidgets
  kcoreaddons
  kcrash
  kdbusaddons
  kfilemetadata
  kguiaddons
  ki18n
  kiconthemes
  kio
  kio-extras
  kjobwidgets
  knewstuff
  knotifications
  kparts
  kservice
  ktextwidgets
  kuserfeedback
  kwidgetsaddons
  kwindowsystem
  kxmlgui
  phonon-qt6
  qt6-base
  solid)
makedepends=(extra-cmake-modules
  kdoctools
  git)
optdepends=('ffmpegthumbs: video thumbnails'
  'kde-cli-tools: for editing file type options'
  'kdegraphics-thumbnailers: PDF and PS thumbnails'
  'kdenetwork-filesharing: samba usershare properties menu'
  'kio-admin: for managing files as administrator'
  'konsole: terminal panel'
  'purpose: share context menu')
groups=(kde-applications
  kde-system)
source=("${pkgname}::git+${url}#branch=master")
#source=("${pkgname}::git+https://github.com/KDE/dolphin.git")
sha256sums=('SKIP')

pkgver() {
	cd "${pkgname}"
	# the latest tags are not in the commit history
	_latest_tag=$(git tag --sort=-v:refname | head -n 1)
	_commit_count=$(git rev-list ${_latest_tag}..HEAD --count)
	_commit_hash=$(git rev-parse --short=7 HEAD)
	echo "${_latest_tag}.r${_commit_count}.g${_commit_hash}" | sed 's/^v//'
}

prepare() {
	cmake -B build -S ${pkgname} \
		-DBUILD_TESTING=OFF
}

build() {
	cmake --build build --parallel
}

package() {
	DESTDIR="${pkgdir}" cmake --install build
}
# vim:set ts=2 sw=2
