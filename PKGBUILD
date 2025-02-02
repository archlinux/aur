# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

_Name="LuaJIT"
_name="${_Name,,}"
pkgname="lib32-${_name}"
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=a4f56a459a588ae768801074b46ba0adcfb49eb1
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1736781742
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc="Just-in-time compiler and drop-in replacement for Lua 5.1 (32-bit)"
arch=('x86_64')
url="https://luajit.org"
_url="https://github.com/${_Name}/${_Name}"
license=('MIT')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}>=${pkgver}")
provides=("lib${_name}-5.1.so")
options=('emptydirs')
_pkgsrc="${_Name}-${_commit}"
source=("LuaJIT-${_commit}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('b4120332a4191db9c9da2d81f9f11f0d4504fc4cff2dea0f642d3d8f1fcebd0e')
b2sums=('847d1ce1a73986fddaa3c43d7dc6c49e942231758ad2fc06276769df82e0ca4239ad1e8481a7177ad43bf60af5afc58ae9e3f8c77bf051d06d8cf268f0bcfd7e')

build() {
  export CFLAGS+=" -m32"
  export CXXFLAGS+=" -m32"
  export LDFLAGS+=" -m32"
  export PKG_CONFIG_PATH='/usr/lib32/pkgconfig'

  cd "${srcdir}/${_pkgsrc}"
  # Avoid early stripping
  make amalg PREFIX='/usr' MULTILIB='lib32' BUILDMODE=dynamic TARGET_STRIP=" @:"
}

check() {
  cd "${srcdir}/${_pkgsrc}"
  # Make sure that _ct was updated
  test "${_ct}" == "$(cat .relver)"
}

package() {
  cd "${srcdir}/${_pkgsrc}"
  make install DESTDIR="${pkgdir}" PREFIX='/usr' MULTILIB='lib32'

  cd "${pkgdir}/usr"
  rm -rf "bin" "include" "share"
}

