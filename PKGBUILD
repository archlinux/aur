
pkgname=gobi-firmware-mc8355
pkgver=1.0.45.0
pkgrel=1
pkgdesc="Firmware for Sierra Wireless MC8355 (Gobi 3000)"
arch=('any')
license=('custom')
optdepends=('gobi-loader: for automatic firmware loading')
makedepends=('innoextract' 'p7zip')
conflicts=('gobi-firmware')
url="http://support.lenovo.com/gb/en/downloads/migr-77035"
options=("!strip")
source=('https://download.lenovo.com/ibmdl/pub/pc/pccbbs/mobiles/8awt16ww.exe')
sha256sums=('d5b4ba982f01cc72688723112fcaa68ed7708426f9f3b1e4af30ce08bdf49341')

# There are 3 sets of firmwares:
# • DPRImages/3000/ - Dynamic Power Reduction, probably requires OS cooperation
# • Images/3000/ - dunno
# • 3000/ - dunno
# In each set there are 9 different firmwares, each for
# specific carrier or generic (this is taken from ImageInfo.xml):
# • <dir> - Carrier - MCC MCN code (Mobile Country Code, Mobile Network Code)
# • 0 - Vodafone - 454006,454015,228001,505003,262002,602002,202005,216070,272001,278001,530001,222010,214001,268001,286002,234015,234015,276002,242001,226001
# • 1 - Verizon - 310012
# • 2 - AT&T - 310150,310170,310380,310410
# • 3 - Sprint - ANY
# • 4 - T-Mobile - 262001,219001,219013,216030
# • 5 - »Doesn't exist«
# • 6 - Generic UMTS - ANY
# • 7 - Telefonica - 214007,334003,730002,730002,214007
# • 8 - Telecom Italia - 334003,730002,214007
# • 9 - Orange - 310260,310270,310250,310200,310031,310220,310160,310660,310240,310230,310210,310026,234030,234031,234032

firmware_type="Images/3000" # Path
firmware_carrier_id=6 # From list above

package() {
  cd $srcdir
  innoextract -e 8awt16ww.exe -I LenovoGobi3kSetup.exe
  cd app
  7z x LenovoGobi3kSetup.exe "${firmware_type}/Generic/${firmware_carrier_id}/*.mbn" -aou
  # Replace old files with newer ones
  cd "${firmware_type}/Generic/${firmware_carrier_id}/"
  for file in amss uqcn uqcn_nogps; do
    [ -f "${file}_1.mbn" ] && [ "${file}_1.mbn" -nt "${file}.mbn" ] && mv "${file}_1.mbn" "${file}.mbn"
  done

  install -d -m755 "${pkgdir}/usr/lib/firmware/gobi"
  install -m644 "amss.mbn" "${pkgdir}/usr/lib/firmware/gobi"
  #install -m644 "apps.mbn" "${pkgdir}/usr/lib/firmware/gobi"
  install -m644 "uqcn.mbn" "${pkgdir}/usr/lib/firmware/gobi" # Comment if you don't want GPS
  #install -m644 "uqcn_nogps.mbn" "${pkgdir}/usr/lib/firmware/gobi/uqcn.mbn" # Uncomment if you don't want GPS
}
