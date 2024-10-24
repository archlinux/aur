# Maintainer: Kyuunex <kyuunex at protonmail dot ch>

# Based on rtl-sdr from extra by:
# Contributor: George Rawlinson <grawlinson@archlinux.org>
# Contributor: Kyle Keen <keenerd@gmail.com>
# Contributor: Michael Düll <mail@akurei.me>

pkgname=rtl-sdr-blog
pkgver=1.3.6
pkgrel=1
epoch=1
pkgdesc='Modified Osmocom drivers with enhancements for RTL-SDR Blog V3 and V4 units.'
arch=('x86_64')
url='https://github.com/rtlsdrblog/rtl-sdr-blog'
license=('GPL-2.0-only')
depends=('glibc' 'libusb')
makedepends=('git' 'cmake')
provides=('rtl-sdr')
conflicts=('rtl-sdr' 'rtl-sdr-git' 'rtl-sdr-librtlsdr-git' 'rtl-sdr-blog-git')
install=rtl-sdr-blog.install
source=(
  "$pkgname::git+https://github.com/rtlsdrblog/rtl-sdr-blog#tag=v$pkgver"
  'fix-udev-directory.patch'
  "$pkgname.sysusers"
)
sha512sums=('bbaf2c605c8fe47197cb012bddc3e7f43cdc64d9e0e59b08f09383a60c74d6227426d276ad450b21f0b37bbfcbdecc55a6a126783fb0bd87fc7c6ffafb2cc057'
            '196c87cf3ccc2fb01cf44c3c3dd035268411c5d06c1d5b880f8b43946cea96b92b1c1478e2b9053f65a23c8d5734a76b0dbae2077bde48f285b26b2188336054'
            '121661a5f4bce17dd5abb72c26bb2015bc0a86b65ae78758bace9fa8b1b19ccb2736ed3f3bddea0c940cacfbbba89301071abe65ec9c386f679314591469378c')

prepare() {
  cd "$pkgname"

  # ensure udev rules get installed to correct directory
  patch -p1 -i "$srcdir/fix-udev-directory.patch"

  # fix udev rules and allow access to any user that is locally logged in or in the rtlsdr group
  # https://bugzilla.redhat.com/show_bug.cgi?id=815093
  sed -e 's/GROUP="plugdev"/GROUP="rtlsdr", TAG+="uaccess"/' -i rtl-sdr.rules
}

build() {
  cmake \
    -S "$pkgname" \
    -B build \
    -D CMAKE_INSTALL_PREFIX=/usr \
    -D CMAKE_C_FLAGS="$CFLAGS -ffat-lto-objects" \
    -D DETACH_KERNEL_DRIVER=ON \
    -D INSTALL_UDEV_RULES=ON \
    -W no-dev

  cmake --build build
}

package() {
  DESTDIR="$pkgdir" cmake --install build

  # rtlsdr group creation
  install -vDm644 $pkgname.sysusers "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"

  cd "$pkgname"

  # module blacklisting rules
  install -vDm644 debian/rtl-sdr-blacklist.conf "$pkgdir/usr/lib/modprobe.d/rtlsdr.conf"

  # man pages
  install -vDm644 -t "$pkgdir/usr/share/man/man1" debian/*.1
}

# vim:set ts=2 sw=2 et:
