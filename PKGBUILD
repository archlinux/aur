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
_commit=c6ffc141a8762b41703f9287d63d93622a13dd8f
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1788856981
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
sha256sums=('6e5fec07750add912e7c3eae0c194d24cd6d023714e1f04a0298a5b4819e4457')
b2sums=('1dd16b18f2310fd61ee6c3b8352c7a79d09b02da5ac13a8e00f6b67fdac9adcd40c7333428a2f6b3cf22b20797061bdfdba9fa211b9b10ee63a99546831e7da1')

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

