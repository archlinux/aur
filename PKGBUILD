# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=i2c-piix4-aura-dkms
_pkgbase=${pkgname%-dkms}
pkgver=1
pkgrel=2
pkgdesc="The i2c-piix4 kernel driver, patched to be used with OpenAuraSDK: https://gitlab.com/CalcProgrammer1/OpenAuraSDK"
arch=('x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=202587"
license=('GPL2')
depends=('dkms')
source=("https://raw.githubusercontent.com/torvalds/linux/master/drivers/i2c/busses/i2c-piix4.c"
	"https://gitlab.com/CalcProgrammer1/OpenAuraSDK/uploads/241ead031b210fba3772ea2b648fec05/piix4-2.diff"
        'dkms.conf'
        'Makefile'
	'90-i2c-aura.rules'
	'i2c-aura.conf')
md5sums=('4dcf2942137d29bb51fe3d7b72e274ed'
         'be2def5b9080bdbde94631043fb9575e'
         'dadbad0c5a8bec3ff66161d3f150bbb7'
         '55c9591930d320e3f9912d315c4682ba'
         'da25a44c35095f6571632e4347834b70'
         'f1cd62671d9f2e4a3e4877b6533bd604')

prepare() {
  mkdir -p "${srcdir}/${_pkgbase}" && cd "${srcdir}/${_pkgbase}"

  cp ../dkms.conf ../i2c-piix4.c ../Makefile .

  patch --no-backup-if-mismatch -Np4 < ../piix4-2.diff
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${_pkgbase}"/{i2c-piix4.c,Makefile} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # udev rule to alow users part of the 'wheel' group to access i2c without root privileges
  install -Dm644 90-i2c-aura.rules "${pkgdir}/usr/lib/udev/rules.d/90-i2c-aura.rules"

  # modprobe needed modules at boot
  install -Dm644 i2c-aura.conf "${pkgdir}/usr/lib/modules-load.d/i2c-aura.conf"
}
