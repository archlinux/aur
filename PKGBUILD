# Maintainer: William Varmus <0@willvar.tw>

pkgname=ossfs2-bin
pkgver=2.0.10
pkgrel=1
pkgdesc='High-performance FUSE client to mount Alibaba Cloud OSS buckets'
arch=('x86_64')
url="https://www.alibabacloud.com/help/en/oss/developer-reference/ossfs-2-0/"
license=('unknown')
depends=('fuse3')
makedepends=('patchelf')
provides=('ossfs2')
source=("ossfs2_${pkgver}_linux_x86_64.rpm::https://gosspublic.alicdn.com/ossfs/ossfs2_${pkgver}_linux_x86_64.rpm")
sha256sums=('efaa427b7fe19d6cb7018d81ece5b8aec39ca0d321c78ca02a69d04cdf1cf0f9')

prepare() {
  cd "${srcdir}"
  # Extract RPM contents using bsdtar
  bsdtar -xf "ossfs2_${pkgver}_linux_x86_64.rpm"
}

package() {
  cd "${srcdir}"
  # Install binary
  install -Dm755 usr/local/bin/ossfs2 "${pkgdir}/usr/bin/ossfs2"
  # Install mount helper for fstab integration
  ln -s ossfs2 "${pkgdir}/usr/bin/mount.ossfs2"
  # Install bundled fuse3 library
  install -Dm755 usr/local/lib64/ossfs2/libfuse3.so.3 "${pkgdir}/usr/lib/ossfs2/libfuse3.so.3"
  # Patch RPATH to find bundled libfuse3
  patchelf --set-rpath '/usr/lib/ossfs2' "${pkgdir}/usr/bin/ossfs2"
}
