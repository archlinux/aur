# Maintainer: 0x9fff00 <0x9fff00+git@protonmail.ch>
# Contributor: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Christoph Zeiler <archNOSPAM_at_moonblade.dot.org>

pkgname=oggvideotools
pkgver=0.9.1
pkgrel=2
pkgdesc='A collection of tools for manipulating Ogg video files'
arch=('x86_64')
url="https://sourceforge.net/projects/$pkgname/"
license=('GPL-2.0-or-later')
depends=('bc' 'gd' 'libtheora' 'libvorbis')
makedepends=('boost' 'cmake' 'libogg')
_debian_patches='https://salsa.debian.org/multimedia-team/oggvideotools/-/raw/122047a7cf644e282906370f277ae83b4672e5e4/debian/patches'
source=(
  "https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.bz2"
  "$_debian_patches/mayhem-crash-oggjoin.patch"
  "$_debian_patches/oggThumb-zero-getopt-long.patch"
  "$_debian_patches/init-for-valgrind.patch"
  "$_debian_patches/1010-kate-header-buffer-read-past-end.patch"
  "$_debian_patches/1020-CVE-2020-21723-null-pointer-crash.patch"
  'https://src.fedoraproject.org/rpms/oggvideotools/raw/2dd078ea81773a34cc0c4817ebbf3c4038b8098c/f/stream-serializer.diff'
)
sha256sums=('d9dbf7897b7cea98612209d80b9127473c97d6ee6cb0dccfc2b38fe3e8e29523'
            '831a83e271eae70e8ae5dece54d283d6ff8336e8ee2a0470c92b505571f02fa4'
            '21fa0557ab6acf6311c8fc6c56bc55575c9371d737c9603aea1394617190b84d'
            'f25786fbc10bc49d31c96803ad8efb2f432acf6eb3928ba67c435f93737d8859'
            '6aaa951ad4cda71440f476718570190ff949a650455810486d4ec94376ac1272'
            'e32a8d65f2432a31ecf2d7ca7aca16273717e07259708485a203010666b8e069'
            '13ea168060c2208e2a93a2967bc982b02ed18db1a0ddf81d7cc00f686da2f9b7')

prepare() {
  cd "$pkgname-$pkgver"

  # add missing include
  sed -i '8i #include <cstring>' src/base/test/decoderTest.cpp

  # fixes from Debian
  patch -Np1 -i "$srcdir/mayhem-crash-oggjoin.patch"
  patch -Np1 -i "$srcdir/oggThumb-zero-getopt-long.patch"
  patch -Np1 -i "$srcdir/init-for-valgrind.patch"
  patch -Np1 -i "$srcdir/1010-kate-header-buffer-read-past-end.patch"
  patch -Np1 -i "$srcdir/1020-CVE-2020-21723-null-pointer-crash.patch"

  # CVE-2020-21724 fix from Fedora
  patch -Np1 -i "$srcdir/stream-serializer.diff"

  # don't disable optimizations
  sed -i s/-O0// CMakeLists.txt

  # man pages location fix
  sed -i 's|man/|share/\0|' docs/CMakeLists.txt

  # install to /usr/bin instead of /usr/sbin
  sed -Ei 's/s(bin)/\1/' scripts/CMakeLists.txt
}

build() {
  local cmake_options=(
    -B build
    -S "$pkgname-$pkgver"
    -DCMAKE_INSTALL_PREFIX=/usr
    -DCMAKE_POLICY_VERSION_MINIMUM=3.5
  )
  cmake "${cmake_options[@]}"
  make -C build
}

check() {
  build/src/base/test/decoderTest > /dev/null
  build/src/base/test/encoderTest > /dev/null
}

package() {
  make -C build DESTDIR="$pkgdir" install
  chmod +x "$pkgdir/usr/bin/mkThumbs"
}
