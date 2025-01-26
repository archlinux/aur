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
_commit=fe71d0fb54ceadfb5b5f3b6baf29e486d97f6059
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1731601260
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc="Just-in-time compiler and drop-in replacement for Lua 5.1 (32-bit)"
arch=('x86_64')
url="https://luajit.org"
_url="https://github.com/${_Name}/${_Name}"
license=('MIT')
depends=('lib32-gcc-libs' 'lib32-glibc' "${_name}>=${pkgver}")
options=('emptydirs')
_pkgsrc="${_Name}-${_commit}"
source=("LuaJIT-${_commit}.tar.gz::${_url}/archive/${_commit}.tar.gz")
sha256sums=('92325f209b21aaf0a67b099bc73cf9bbac5789a9749bdc3898d4a990abb4f36e')
b2sums=('07b8a9f1457db314785f9ab6ad87907b48a2dcee2a8a85e231779661ffe9b92e8b32cf790955537e86b519d61a8316848260fb83e7ba6746a816e2e0e59976e0')

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

