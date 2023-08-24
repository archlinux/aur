# Maintainer: Behnam Momeni <sbmomeni [at the] gmail [dot] com>
# Contributor: Lukas Fleischer <lfleischer@archlinux.org>
# Contributor: Bartłomiej Piotrowski <bpiotrowski@archlinux.org>
# Contributor: Chris Brannon <chris@the-brannons.com>
# Contributor: Paulo Matias <matiasΘarchlinux-br·org>
# Contributor: Anders Bergh <anders1@gmail.com>

pkgname=lib32-luajit
# LuaJIT has a "rolling release" where you should follow git HEAD
_commit=0b5bf71e37b973aad8022f2b3d25e03434e23987
# The patch version is the timestamp of the above git commit, obtain via `git show -s --format=%ct`
_ct=1692711441
pkgver="2.1.${_ct}"
pkgrel=1
pkgdesc='Just-in-time compiler and drop-in replacement for Lua 5.1 (32-bit)'
arch=('x86_64')
url="https://luajit.org/"
license=('MIT')
depends=('lib32-gcc-libs' 'luajit')
source=("LuaJIT-${_commit}.tar.gz::https://repo.or.cz/luajit-2.0.git/snapshot/${_commit}.tar.gz")
sha256sums=('7ca886daebb441152aace8573dddad63e2f49478176e4ea175d652a1c166ee70')

build() {
  cd "luajit-2.0-${_commit::7}"
  # Avoid early stripping
  make amalg \
    CFLAGS="-m32" CXXFLAGS="-m32" LDFLAGS="-m32" MULTILIB="lib32" \
    PREFIX="/usr" BUILDMODE="dynamic" TARGET_STRIP=" @:"
}

package() {
  cd "luajit-2.0-${_commit::7}"
  make install DESTDIR="$pkgdir" MULTILIB="lib32" PREFIX="/usr"
  rm -r "$pkgdir/usr/"{bin,share,include}
}

