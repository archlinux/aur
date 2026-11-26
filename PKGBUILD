# Maintainer: Serhii Starovoitov <drommer.94@gmail.com>

pkgname=dvb-firmware-siliconlabs
pkgver=22.06
pkgrel=1
pkgdesc="Silicon Labs firmware for Geniatech MyGica (August, eyeTV T2, Evolveo Sigma T2, Openbox), GoTView MasterHD 3, Hauppauge WinTV, PCTV QuatroStick / tripleStick, DVBSky, Evromedia Full Hybrid Full HD, TechnoTrend, Terratec."
arch=('any')
license=('LicenseRef-SiliconLabs-Redistribution')
url="https://www.silabs.com"
makedepends=('zstd')
source=("https://archive.org/download/$pkgname/$pkgname.tar.gz")
sha256sums=('7f0fcb5c38a0fa80f37eb51673e81c79d0c1e4a1b0581597654656b6fa072952')

package() {
  cd "$pkgname"

  # Version selection: edit the values in the FW_VER. Available values:
  declare -A FW_VER=(
    ["dvb_driver_si2141_rom61"]="1.1.12" # 1.1.12 | 1.1.11 | 1.1.10
    ["dvb_driver_si2157_rom50"]="3.1.3"  # 3.1.3 | 3.0.5
    ["dvb_driver_si2158_rom51"]="2.1.9"  # 2.1.9 | 2.1.6 | 4.1.3 (*)
    ["dvb-demod-si2168-a20-01"]="2.0.35" # 2.0.35 | 2.0.30 | 2.0.28 | 2.0.x
    ["dvb-demod-si2168-a30-01"]="3.0.19" # 3.0.19 | 3.0.16 | 3.0.11 | 3.0.10
    ["dvb-demod-si2168-b40-01"]="4.0.31" # 4.0.31 | 4.0.25 | 4.0.19 | 4.0.11 | 4.0.7 | 4.0.4
    ["dvb-demod-si2168-d60-01"]="6.0.17" # 6.0.17 | 6.0.13 | 6.0.2
)
  # (*) I'm not sure if v4.1.3 is actually compatible with this revision of the Si2158 chip.

  local f key fwpath="usr/lib/firmware"
  for key in "${!FW_VER[@]}"; do
    zstd -fv "${key}_v${FW_VER[$key]}.fw" -o "$key.fw.zst"
    install -vDm644 "$key.fw.zst" -t "$pkgdir/$fwpath"
  done

  for f in *.fw; do
    key=${f%.fw}; key=${key%_v*}
    [[ -n ${FW_VER[$key]+x} ]] && continue
    zstd -fv "$f" -o "$key.fw.zst"
    install -vDm644 "$key.fw.zst" -t "$pkgdir/$fwpath"
  done

  ln -sfv "dvb-demod-si2168-d60-01.fw.zst" "$pkgdir/$fwpath/dvb-demod-si2183-b60-01.fw.zst"
  ln -sfv "dvb_driver_si2157_rom50.fw.zst" "$pkgdir/$fwpath/dvb_driver_si2147_rom50.fw.zst"
  ln -sfv "dvb_driver_si2157_rom50.fw.zst" "$pkgdir/$fwpath/dvb_driver_si2177_rom50.fw.zst"
  ln -sfv "dvb_driver_si2141_rom61.fw.zst" "$pkgdir/$fwpath/dvb-tuner-si2141-a10-01.fw.zst"
  ln -sfv "dvb_driver_si2157_rom50.fw.zst" "$pkgdir/$fwpath/dvb-tuner-si2157-a30-01.fw.zst"
  ln -sfv "dvb_driver_si2158_rom51.fw.zst" "$pkgdir/$fwpath/dvb-tuner-si2158-a20-01.fw.zst"

  install -vDm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
