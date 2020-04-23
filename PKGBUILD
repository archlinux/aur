# Maintainer: Térence Clastres <t.clastres@gmail.com>

pkgname=i2c-piix4-aura-dkms
_pkgbase=${pkgname%-dkms}
pkgver=5.6.7
pkgrel=1
pkgdesc="The i2c-piix4 kernel driver, patched to be used with OpenRGB: https://gitlab.com/CalcProgrammer1/OpenRGB"
arch=('x86_64')
url="https://bugzilla.kernel.org/show_bug.cgi?id=202587"
license=('GPL2')
depends=('dkms')
source=("i2c-piix4-${pkgver}.c::https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/plain/drivers/i2c/busses/i2c-piix4.c?h=v${pkgver}"
	"piix4.patch::https://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git/patch/?id=f27237c174fd9653033330e4e532cd9d153ce824"
        'dkms.conf'
        'Makefile'
	'90-i2c-aura.rules'
	'i2c-aura.conf')
md5sums=('26cff2ae6e3a2356fefe1c698ce16e77'
         '904cc91bd8d73829c8bc58fd1c528d72'
         'dadbad0c5a8bec3ff66161d3f150bbb7'
         '55c9591930d320e3f9912d315c4682ba'
         'e44ab261a99faa252fc142cc5569502c'
         'f1cd62671d9f2e4a3e4877b6533bd604')

prepare() {
  mkdir -p "${srcdir}/${_pkgbase}" && cd "${srcdir}/${_pkgbase}"

  cp ../dkms.conf ../Makefile .
  cp ../i2c-piix4-${pkgver}.c i2c-piix4.c

  patch --no-backup-if-mismatch -Np4 < ../piix4.patch
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
