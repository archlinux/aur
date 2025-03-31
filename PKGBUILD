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
_commit=538a82133ad6fddfd0ca64de167c4aca3bc1a2da
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1741730670
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
sha256sums=('7acbc36be8f21072422eb9a5e5fc468d0eaa55bec1b70260d651e845684621e2')
b2sums=('d95324b6a12919107f33d12e168ac798a91e829d8ddda7a2362dd6dff893e68e5fcc68322023216ab84352507107a2bff9934a87c1aa1427185645157cc78fc8')

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

