# Maintainer: Franck Lucien Duriez <franck.lucien.duriez@gmail.com>

pkgname=fastboot-arm64
pkgver=5.1.1
pkgrel=1
pkgdesc='fastboot for Raspberry 3'
arch=('aarch64')
url='http://developer.android.com/sdk/index.html'
license=('custom')
depends=('zlib' 'ncurses' 'repo')
provides=('fastboot')
conflicts=('fastboot')
source=("license.txt"
	"Makefile")
sha1sums=('SKIP'
	  'SKIP')

_branch='android-5.1.1_r9'

build() {
  mkdir -p system external
  test -d system/core || \
    git clone -b "$_branch" https://android.googlesource.com/platform/system/core system/core
  test -d external/zlib || \
    git clone -b "$_branch" https://android.googlesource.com/platform/external/zlib external/zlib
  test -d system/extras || \
    git clone -b "$_branch" https://android.googlesource.com/platform/system/extras system/extras
  test -d external/libselinux || \
    git clone -b "$_branch" https://android.googlesource.com/platform/external/libselinux external/libselinux
  test -d external/pcre || \
    git clone -b "$_branch" https://android.googlesource.com/platform/external/pcre external/pcre
  grep --quiet '#include <sys/sysmacros.h>' 'system/core/fastboot/usb_linux.c' || \
    sed -i '1s|^|#include <sys/sysmacros.h>\n|' 'system/core/fastboot/usb_linux.c'
  sed -i 's|extern char \*sys_errlist|extern char const *const sys_errlist|' 'external/pcre/dist/pcregrep.c'
  cp Makefile system/core/fastboot/Makefile
  cd system/core/fastboot
  make
}

package() {
  install -Dm644 "${srcdir}/license.txt" "${pkgdir}/usr/share/licenses/${pkgname}/license.txt"
  install -d "${pkgdir}/etc/profile.d"
  install -Dm755 "${srcdir}/system/core/fastboot/fastboot" "${pkgdir}/usr/bin/fastboot"
}
