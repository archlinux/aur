# Maintainer: Zhang Hai <dreaming.in.code.zh@gmail.com>
# Contributor: Vlad M. <vlad@archlinux.net>
# Contributor: Gordin <9ordin @t gmail dot com>
# Contributor: Christoph Bayer <chrbayer@criby.de>

pkgname=adb-arm64
pkgver=5.1.1
pkgrel=1
pkgdesc='adb for Raspberry 3'
arch=('aarch64')
url='http://developer.android.com/sdk/index.html'
license=('custom')
depends=('zlib' 'ncurses' 'repo')
provides=('adb')
conflicts=('adb')
source=("adb.service"
        "license.html"
	"Makefile")
sha1sums=('49a40c129199844603afe71fce69c0908e062393'
          'bfb91be7e0b602d765b7a1fcaf0ce1b7e1a93faa'
	  'SKIP')

_branch='android-5.1.1_r9'

build() {
  mkdir -p system external
  test -d system/core || \
    git clone -b "$_branch" https://android.googlesource.com/platform/system/core system/core
  test -d system/extras || \
    git clone -b "$_branch" https://android.googlesource.com/platform/system/extras system/extras
  test -d external/zlib || \
    git clone -b "$_branch" https://android.googlesource.com/platform/external/zlib external/zlib
  test -d external/openssl || \
    git clone -b "$_branch" https://android.googlesource.com/platform/external/openssl external/openssl
  test -d external/libselinux || \
    git clone -b "$_branch" https://android.googlesource.com/platform/external/libselinux external/libselinux
  grep --quiet '#include <sys/sysmacros.h>' 'system/core/adb/usb_linux.c' || \
    sed -i '1s|^|#include <sys/sysmacros.h>\n|' 'system/core/adb/usb_linux.c'
  cp Makefile system/core/adb/Makefile
  cd system/core/adb
  make
}

package() {
  install -Dm644 "${srcdir}/adb.service" "${pkgdir}/usr/lib/systemd/system/adb.service"
  install -Dm644 "${srcdir}/license.html" "${pkgdir}/usr/share/licenses/${pkgname}/license.html"

  install -d "${pkgdir}/etc/profile.d"
  echo 'export PATH="${PATH}:/opt/android-sdk/platform-tools"' >"${pkgdir}/etc/profile.d/${pkgname}.sh"
  echo 'setenv PATH "${PATH}:/opt/android-sdk/platform-tools"' >"${pkgdir}/etc/profile.d/${pkgname}.csh"
  chmod 755 "${pkgdir}/etc/profile.d/${pkgname}".{csh,sh}

  install -d "${pkgdir}/opt/android-sdk/"
  install -Dm755 "${srcdir}/system/core/adb/adb" "${pkgdir}/usr/bin/adb"
}
