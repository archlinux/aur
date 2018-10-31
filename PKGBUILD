# Maintainer: Tinu Weber <http://ayekat.ch>

pkgname=perfutils-git
pkgver=r94.5676231
pkgrel=3
arch=(x86_64)

pkgdesc='Collection of eclectic tools for measuring performance using the cycle counter and pinning threads'
license=('custom:ISC')
url='https://github.com/PlatformLab/PerfUtils'

source=('git+https://github.com/PlatformLab/PerfUtils'
        perfutils.pc)
sha256sums=(SKIP
            76e254320a92fde75fd0b05e941fd5b79011ad10c06a14e706c4eab4b8705d40)

provides=(${pkgname%-git})
conflicts=(${pkgname%-git})

depends=(gcc-libs glibc)
makedepends=(git)

options=(staticlibs)

pkgver() {
  cd PerfUtils
  printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd PerfUtils
  make
  g++ -shared obj/*.o -o obj/libPerfUtils.so
}

package() {
  cd PerfUtils

  # libraries
  install -Dm0644 obj/libPerfUtils.a "$pkgdir"/usr/lib/libPerfUtils.a
  install -Dm0755 obj/libPerfUtils.so "$pkgdir"/usr/lib/libPerfUtils.so
  ln -sf libPerfUtils.so "$pkgdir"/usr/lib/libPerfUtils.so.0

  # headers
  install -dm0755 "$pkgdir"/usr/include/PerfUtils
  install -m0644 include/PerfUtils/* "$pkgdir"/usr/include/PerfUtils/

  # pkgconf
  install -Dm0644 "$srcdir"/perfutils.pc "$pkgdir"/usr/lib/pkgconfig/perfutils.pc

  # misc
  install -Dm0644 README.md "$pkgdir"/usr/share/doc/"${pkgname%-git}"/README.md
  install -Dm0644 LICENSE "$pkgdir"/usr/share/licenses/"${pkgname%-git}"/LICENSE
}
