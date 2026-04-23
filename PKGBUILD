# Maintainer: Felix Yan <felixonmars@archlinux.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname=cdparanoia-overread
pkgver=10.2
pkgrel=3
pkgdesc="Compact Disc Digital Audio extraction tool patched for lead-out overread support"
arch=('x86_64')
url="https://www.xiph.org/paranoia/"
license=('GPL')
depends=('glibc')
options=('!makeflags' '!staticlibs')
conflicts=('cdparanoia')
provides=('cdparanoia')
source=("https://downloads.xiph.org/releases/cdparanoia/cdparanoia-III-$pkgver.src.tgz"
	cdparanoia-10.2-overread.patch # Patch for lead-out overread support
        cdparanoia-r15388.patch # svn diff -c 15338 https://svn.xiph.org/trunk/cdparanoia/
        cdparanoia-10.2-format-security.patch # Patch from Fedora
        cdparanoia-10.2-ldflags.patch) # Patch from Fedora
sha512sums=('4ab0a0f5ef44d56c1af72d1fc1035566a1a89c4eeddb9e8baea675fe51c06138d913342afc8bed167d9fa55672fa25a2763ce21f7e24c1232e4739aff20733a7'
            'eae9f767b3b1ed84441daf21f740615898600e9c2c35cc629fdbb751164846c917e24f9ef94de9c7ad1a202eff8e398e1046a1a77e4b488bdfd20e81e8b7cd57'
            'bcae1e3850f1780d3e731d6f662f62c82a5e698612d3ef84cacdd8e7179ef84c1571d45799336f019694b727bf526af9889422e608ea695593d0b9083fb651be'
            '56532fc71b357e91a767f94a30ebdc528fdd44661bd982e5a2930bb5f48a7b0fa68b03ae89fbf726c0c310d3af40ac294e68dd0e6417d034923e64193ad1bfa1'
            '1df9724b72efd1be330a8991b7a56e3eef39fea48d648402ad9b613d6456a13e479be455e477bdfd3f4ff3fc6d7f6cbbe83db9af9bbb07fa462e290e2d010b85')

prepare() {
  cd cdparanoia-III-$pkgver
  # Apply overread patch
  patch -p1 -i "$srcdir"/cdparanoia-10.2-overread.patch
  # Fix for 'private' becoming a reserved keyword as of GCC 4.3+
  patch -p0 -i "$srcdir"/cdparanoia-r15388.patch
  # Add missing printf format strings for `-Wformat -Werror=format-security`
  patch -p1 -i "$srcdir"/cdparanoia-10.2-format-security.patch
  # Use LDFLAGS
  patch -p1 -i "$srcdir"/cdparanoia-10.2-ldflags.patch
}

build() {
  cd cdparanoia-III-$pkgver
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd cdparanoia-III-$pkgver
  make prefix="$pkgdir"/usr MANDIR="$pkgdir"/usr/share/man install
}
