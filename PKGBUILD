# Maintainer: yjun <jerrysteve1101 at gmail dot com>
# Based on aur/freej2me-git

pkgbase='freej2me-plus-git'
pkgname=("freej2me-plus-git" "libretro-freej2me-plus-git")
pkgver=1.51.r1173.79a4030c
pkgrel=1
pkgdesc='A free J2ME emulator with libretro, awt frontends.'
arch=('any')
url='https://github.com/TASEmulators/freej2me-plus'
license=('GPL-3.0-only' 'custom')
depends=('java-runtime' 'sh')
makedepends=('git' 'ant' 'java-environment')
source=("git+${url}" 'freej2me-plus.sh' 'freej2me-plus.desktop')
md5sums=('SKIP'
         'c63d23b3eee3f177363a19bf0b256ec9'
         '172dc3882f25b3b786bfba42f16b4048')

pkgver() {
  cd "${srcdir}/${pkgname%-git}"
  _version=$(sed -n 's/.*final String VERSION = "\([^"]*\)";.*/\1/p' src/org/recompile/freej2me/AWTGUI.java)
  printf "%s.r%s.%s" ${_version} "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname%-git}"
  ant
  cd src/libretro
  make
}

package_freej2me-plus-git() {
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  cd "${srcdir}/${pkgbase%-git}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 build/freej2me.jar "${pkgdir}/usr/share/java/freej2me-plus/freej2me.jar"
  install -Dm755 "${srcdir}/freej2me-plus.sh" "${pkgdir}/usr/bin/freej2me-plus"
  install -Dm644 resources/org/recompile/icon.png "${pkgdir}/usr/share/pixmaps/freej2me-plus.png"
  install -Dm644 "${srcdir}/freej2me-plus.desktop" "${pkgdir}/usr/share/applications/freej2me-plus.desktop"
}

package_libretro-freej2me-plus-git() {
  arch=('x86_64')
  pkgdesc="A free J2ME emulator with libretro, awt frontends. (Libretro core)"
  depends=('java-runtime')
  provides=("${pkgname%-git}")
  conflicts=("${pkgname%-git}")
  install=libretro-freej2me-plus.install
  cd "${srcdir}/${pkgbase%-git}"

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
  install -Dm644 build/freej2me-lr.jar "${pkgdir}/usr/share/java/freej2me-plus/freej2me-lr.jar"
  install -Dm644 src/libretro/freej2me_libretro.so "${pkgdir}/usr/lib/libretro/freej2me_plus_libretro.so"
  install -Dm644 src/libretro/freej2me_libretro.info "${pkgdir}/usr/share/libretro/info/freej2me_plus_libretro.info"
}

# vim: set sw=2 ts=2 et:
