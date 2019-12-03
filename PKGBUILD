# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=i2c-piix4-aura-dkms
_pkgbase=${pkgname%-dkms}
pkgver=5.4.1
pkgrel=1
pkgdesc="The i2c-piix4 kernel driver, patched to be used with OpenAuraSDK: https://gitlab.com/CalcProgrammer1/OpenAuraSDK"
arch=('x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=202587"
license=('GPL2')
depends=('dkms')
source=("i2c-piix4-${pkgver}.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/i2c/busses/i2c-piix4.c?h=v${pkgver}"
	"https://gitlab.com/CalcProgrammer1/OpenAuraSDK/uploads/241ead031b210fba3772ea2b648fec05/piix4-2.diff"
        'dkms.conf'
        'Makefile'
	'90-i2c-aura.rules'
	'i2c-aura.conf')
md5sums=('26cff2ae6e3a2356fefe1c698ce16e77'
         'be2def5b9080bdbde94631043fb9575e'
         'dadbad0c5a8bec3ff66161d3f150bbb7'
         '55c9591930d320e3f9912d315c4682ba'
         'e44ab261a99faa252fc142cc5569502c'
         'f1cd62671d9f2e4a3e4877b6533bd604')

prepare() {
  mkdir -p "${srcdir}/${_pkgbase}" && cd "${srcdir}/${_pkgbase}"

  cp ../dkms.conf ../Makefile .
  cp ../i2c-piix4-${pkgver}.c i2c-piix4.c

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
  cp -r ${_pkgbase}/{i2c-piix4.c,Makefile} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # udev rule to alow users part of the 'wheel' group to access i2c without root privileges
  install -Dm644 90-i2c-aura.rules "${pkgdir}/usr/lib/udev/rules.d/90-i2c-aura.rules"

  # modprobe needed modules at boot
  install -Dm644 i2c-aura.conf "${pkgdir}/usr/lib/modules-load.d/i2c-aura.conf"
}
