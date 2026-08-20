# Maintainer: AeCw <aecbanana@outlook.com>
pkgname=lenovo-print-driver-lj2400-m7400-bin
pkgver=5.0.3
pkgrel=3
pkgdesc="LJ2400Pro LJ2405 LJ2405D LJ2605D LJ2655DN LJ2680DN M7400Pro M7400W M7405D M7405DW M7450FPro M7455DNF M7460 M7480 M7490DNF M7605D M7605DW M7615DNA M7625DWA M7626DNA M7628DNA M7655DHF M7675DXF M7680D M7685DXF M7686DXF M7690DNA"
arch=('x86_64')
url="https://www.lenovo.com"
license=('custom:lenovo')
depends=('cups' 'glibc' 'perl' 'bash' 'coreutils' 'findutils')
optdepends=('python: for additional printer management scripts')

install=lenovo-print-driver.install

thisdebpackagefrom="https://www.chinauos.com/resource/download-drivers/result?keyword=lenovo+M7615dna"

source=(
    "drive-service_signed_com.lenovo.lenovoprints_5.0.3-2_amd64.deb"
    "lenovo-print-driver.install"
)
sha256sums=('17da4287011a53118f34f2af8d7e39af162b554d33d6a86c78f56507d4ae9a8f'
            '94dff3996c6dac1d166e38abf01175b730e92fd2e0944437b237f533ec737231')

package() {
  cd "$srcdir"

  # bsdtar 解 deb 只会解出 4 个 ar 成员(debian-binary/control.tar.*/data.tar.*/sign),
  # 实际驱动文件在 data.tar.* 里,必须再解一次。
  # --no-same-owner: 不尝试恢复 deb 里的属主(避免在 fakeroot/沙箱里 chown 失败),
  # 属主统一由 fakeroot 记为 root,权限随后统一规范化。
  bsdtar --no-same-owner -xf "drive-service_signed_com.lenovo.lenovoprints_5.0.3-2_amd64.deb" -C "$pkgdir"

  cd "$pkgdir"
  for datafile in data.tar.*; do
    if [ -f "$datafile" ]; then
      tar --no-same-owner -xf "$datafile" -C "$pkgdir"
    fi
  done

  # 清理 deb 元数据残留,避免它们被装到系统根目录 /
  rm -f debian-binary control.tar.* data.tar.* sign
  # 清理 deb 里遗留的空目录
  rm -rf "$pkgdir/usr/share/cups/model/new"

  # 去除 deb 包内 uos 属主带出的不安全权限(组/其他可写 0775→0755)。
  # CUPS 会拒绝执行带组写/其他写位的过滤器,否则报错:
  #   "File ... has insecure permissions (0100775/uid=0/gid=0)"
  # 目录统一 755,可执行文件 755,数据文件 644。
  find "$pkgdir" -type d -exec chmod 755 {} \;
  find "$pkgdir" -type f -perm /u+x -exec chmod 755 {} \;
  find "$pkgdir" -type f ! -perm /u+x -exec chmod 644 {} \;

  install -dm755 "$pkgdir/usr/bin"
  install -dm755 "$pkgdir/usr/lib/cups/filter"
  install -dm755 "$pkgdir/usr/lib32/cups/filter"
  install -dm755 "$pkgdir/usr/libexec/cups/filter"
  install -dm755 "$pkgdir/var/spool/lpd"
}
