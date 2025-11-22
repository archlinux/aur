# Maintainer: YOURNAME <you@example.com>
# Based on brother-dcp-9020cdn (libook <libook7@gmail.com>)

pkgname="brother-dcp-9030cdn"
pkgver="1.0.2"
pkgrel=1
pkgdesc="LPR and CUPS driver for the Brother DCP-9030CDN"
url="https://support.brother.com/g/b/downloadtop.aspx?c=cn&lang=zh&prod=dcp9030cdn_cn"
arch=('i686' 'x86_64')
license=('custom:Brother-EULA')
depends=('cups')
depends_x86_64=('lib32-glibc')
makedepends=('libarchive')
source=("https://d.brother-movie.com/201911/dcp9030cdnpdrv-${pkgver}-0.i386.deb")
sha256sums=('a627ec6e6e682108efdb53ec134b7ad163869c550cc223ef675c03fcfbbb3c91')

package() {
  cd "$srcdir"

  # 解 deb 得到 data.tar.gz
  bsdtar -xf "dcp9030cdnpdrv-${pkgver}-0.i386.deb"
  bsdtar -xf data.tar.gz -C "$pkgdir"

  # 确保标准 CUPS 目录存在
  install -d "$pkgdir/usr/lib/cups/filter"
  install -d "$pkgdir/usr/share/cups/model/Brother"
  install -d "$pkgdir/usr/share/ppd/Brother"
  install -d "$pkgdir/usr/share/licenses/$pkgname"

  # Brother 自己放在 /opt/brother 里的 cupswrapper 内容
  local basedir="$pkgdir/opt/brother/Printers/dcp9030cdn"
  local cwdir="$basedir/cupswrapper"

  # 安装 CUPS filter
  install -m755 "$cwdir/brother_lpdwrapper_dcp9030cdn" \
    "$pkgdir/usr/lib/cups/filter/brother_lpdwrapper_dcp9030cdn"

  # 安装 PPD（两份，兼容不同查找路径）
  install -m644 "$cwdir/brother_dcp9030cdn_printer_en.ppd" \
    "$pkgdir/usr/share/cups/model/Brother/brother_dcp9030cdn_printer_en.ppd"

  install -m644 "$cwdir/brother_dcp9030cdn_printer_en.ppd" \
    "$pkgdir/usr/share/ppd/Brother/brother_dcp9030cdn_printer_en.ppd"

  # 安装许可证（从 /opt/brother 里搬一份出来）
  install -m644 "$basedir/LICENSE_ENG.txt" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"

  # 权限规范一点（可选）
  chmod -R go-w "$pkgdir/opt/brother"
}
