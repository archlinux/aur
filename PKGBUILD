# Maintainer: David Bernheisel <david+aur at bernheisel dot com>
# Based on the brscan4 PKGBUILD by Harey

pkgname=brscan5
pkgver=1.2.11_0
pkgrel=0
pkgdesc='SANE drivers from Brother for compatible models'
arch=('i686' 'x86_64')
license=('GPL' 'custom:Brother')
url="http://support.brother.com"
depends=('sane' 'libusb-compat')
optdepends=('gtk2: for running brscan_gnetconfig')
source=(
  'mk-udev-rules'
  'brother5.conf'
)

md5sums=(
  '197a2583e4cc7a14db350b140a27485d'
  '90bf4aa2e87b68ba2ea1aa7e43b019d9'
)
source_x86_64=("https://download.brother.com/welcome/dlf104036/${pkgname}-${pkgver/_/-}.x86_64.rpm")
md5sums_x86_64=('b4eacf7266b791ef6c8f76238e96378a')
source_i686=("https://download.brother.com/welcome/dlf104035/${pkgname}-${pkgver/_/-}.i386.rpm")
md5sums_i686=('dca083bd72991c0d87ec43698721cd65')
install="brscan5.install"

build() {
  mkdir -p usr/lib/udev/rules.d
  ./mk-udev-rules opt/brother/scanner/brscan5/{brscan5.ini,models/*.ini} > "usr/lib/udev/rules.d/40-$pkgname.rules"
}

package() {
  cp -r "$srcdir/etc" "$pkgdir"
  cp -r "$srcdir/opt" "$pkgdir"
  cp -r "$srcdir/usr" "$pkgdir"

  rm -rf "$pkgdir/etc/udev"

  install -D -m644 "$srcdir/opt/brother/scanner/brscan5/doc/LICENSE_ENG.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_ENG.txt"
  install -D -m644 "$srcdir/opt/brother/scanner/brscan5/doc/LICENSE_JPN.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE_JPN.txt"
  install -D -m644 "brother5.conf" "$pkgdir/etc/sane.d/dll.d/brother5.conf"

  mkdir -p "$pkgdir/usr/lib/sane"
  cd "$pkgdir/usr/lib/sane" || exit 1
  mv "$pkgdir/opt/brother/scanner/brscan5/libsane-brother5.so.1.0.7" "$pkgdir/usr/lib/sane"
  ln -sf libsane-brother5.so.1.0.7 libsane-brother5.so.1
  ln -sf libsane-brother5.so.1 libsane-brother5.so

  cd "$pkgdir/usr/lib" || exit 1
  mv "$pkgdir/opt/brother/scanner/brscan5/libLxBsScanCoreApi.so.3.2.0" "$pkgdir/usr/lib"
  ln -sf "libLxBsScanCoreApi.so.3.2.0" "libLxBsScanCoreApi.so.3"
  ln -sf "libLxBsScanCoreApi.so.3" "libLxBsScanCoreApi.so"

  libs=(libLxBsNetDevAccs libLxBsDeviceAccs libLxBsUsbDevAccs)
  for lib in "${libs[@]}"; do
    mv "$pkgdir/opt/brother/scanner/brscan5/${lib}.so.1.0.0" "$pkgdir/usr/lib"
    ln -sf "$lib.so.1.0.0" "$lib.so.1"
    ln -sf "$lib.so.1" "$lib.so"
  done
}

# ADS-1200 ADS-1250W ADS-1700W ADS-2400N ADS-2800W ADS-3000N ADS-3600W DCP-7090 DCP-7095D DCP-7190DN DCP-7195DW DCP-9030CDN DCP-B7500D DCP-B7520DW DCP-B7530DN DCP-B7535DW DCP-J1100DW DCP-J572DW DCP-J572N DCP-J577N DCP-J582N DCP-J772DW DCP-J774DW DCP-J972N DCP-J973N DCP-J978N DCP-J981N DCP-J982N DCP-J988N DCP-L2510D DCP-L2530DW DCP-L2535D DCP-L2535DW DCP-L2537DW DCP-L2550DN DCP-L2550DW DCP-L2551DN DCP-L3510CDW DCP-L3550CDW DCP-L3551CDW DCP-L5500D DCP-L5500D DCP-L5500DN DCP-L5500DN DCP-L5502DN DCP-L5502DN DCP-L5600DN DCP-L5600DN DCP-L5602DN DCP-L5602DN DCP-L5650DN DCP-L5650DN DCP-L5652DN DCP-L5652DN DCP-L6600DW DCP-L6600DW DCP-T310 DCP-T510W DCP-T710W FAX-L2710DN HL-J6000CDW HL-J6000DW HL-J6100DW HL-L2390DW HL-L2395DW HL-L3290CDW MFC-7390 MFC-7490D MFC-7890DN MFC-7895DW MFC-8530DN MFC-8530DN MFC-8535DN MFC-8535DN MFC-8540DN MFC-8540DN MFC-9150CDN MFC-9350CDW MFC-B7700D MFC-B7715DW MFC-B7720DN MFC-J1300DW MFC-J1500N MFC-J1605DN MFC-J2330DW MFC-J2730DW MFC-J3530DW MFC-J3930DW MFC-J491DW MFC-J497DW MFC-J5330DW MFC-J5335DW MFC-J5630CDW MFC-J5730DW MFC-J5830DW MFC-J5845DW MFC-J5930DW MFC-J5945DW MFC-J6530DW MFC-J6535DW MFC-J6545DW MFC-J6580CDW MFC-J6583CDW MFC-J6730DW MFC-J690DW MFC-J6930DW MFC-J6935DW MFC-J6945DW MFC-J6947DW MFC-J6980CDW MFC-J6983CDW MFC-J6995CDW MFC-J6997CDW MFC-J6999CDW MFC-J738DN MFC-J775DW MFC-J805DW MFC-J815DW MFC-J890DW MFC-J893N MFC-J895DW MFC-J898N MFC-J903N MFC-J995DW MFC-J998DN MFC-L2690DW MFC-L2710DN MFC-L2710DW MFC-L2713DW MFC-L2715D MFC-L2715DW MFC-L2717DW MFC-L2730DN MFC-L2730DW MFC-L2770DW MFC-L3710CW MFC-L3730CDN MFC-L3735CDN MFC-L3745CDW MFC-L3750CDW MFC-L3770CDW MFC-L5700DN MFC-L5700DN MFC-L5700DW MFC-L5700DW MFC-L5702DW MFC-L5702DW MFC-L5750DW MFC-L5750DW MFC-L5755DW MFC-L5755DW MFC-L5800DW MFC-L5800DW MFC-L5802DW MFC-L5802DW MFC-L5850DW MFC-L5850DW MFC-L5900DW MFC-L5900DW MFC-L5902DW MFC-L5902DW MFC-L6700DW MFC-L6700DW MFC-L6702DW MFC-L6702DW MFC-L6750DW MFC-L6750DW MFC-L6800DW MFC-L6800DW MFC-L6900DW MFC-L6900DW MFC-L6902DW MFC-L6902DW MFC-T4500DW MFC-T810W MFC-T910DW
