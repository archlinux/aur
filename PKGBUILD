# Maintainer: Zitro <u4595650016@protonmail.com>
# Contributor: Adam Fontenot <adam.m.fontenot+AUR1@gmail.com>
# Contributor: Faheem Pervez < trippin1 gmail >

_pkgname=colord-kde
pkgname="${_pkgname}-git"
pkgver=26.08.2.r13.gba85bf0
pkgrel=1
pkgdesc='Interfaces and session daemon to colord for KDE (git)'
arch=('x86_64' 'aarch64')
url='https://invent.kde.org/graphics/colord-kde'
license=('GPL-2.0-or-later')
depends=(
  colord
  glibc
  kcmutils
  kcoreaddons
  kdbusaddons
  ki18n
  kirigami
  kitemmodels # QML
  kwidgetsaddons
  lcms2
  libstdc++
  libx11
  libxrandr
  qt6-base
  qt6-declarative
)
makedepends=(
  extra-cmake-modules
  git
  kwindowsystem # fixx11h.h
)
optdepends=('displaycal: calibrate devices')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${_pkgname}::git+${url}.git#branch=master")
sha256sums=('SKIP')

pkgver() {
  cd "${_pkgname}"

  # KDE Gear tags releases on the release/* branches; those commits are never
  #   merged back into master, so `git describe` reports the ancient v24.01.90 tag.
  # Use the newest release tag plus the number of commits since it.
  local _latest_tag _commit_count _commit_hash
  _latest_tag=$(git tag --sort=-v:refname | sed -n '1p')
  _commit_count=$(git rev-list "${_latest_tag}..HEAD" --count)
  _commit_hash=$(git rev-parse --short=7 HEAD)

  echo "${_latest_tag}.r${_commit_count}.g${_commit_hash}" | sed 's/^v//'
}

build() {
  # Configure here, not in prepare(): makepkg only exports CFLAGS/CXXFLAGS/
  #   LDFLAGS to the environment after prepare() has run.
  cmake -B build -S "${_pkgname}" \
    -DBUILD_TESTING=OFF
  cmake --build build --parallel
}

package() {
  DESTDIR="${pkgdir}" cmake --install build
}
