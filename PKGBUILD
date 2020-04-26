# Maintainer: Martin Sandsmark <martin.sandsmark@kde.org>
# Contributor: Térence Clastres <t.clastres@gmail.com>

pkgname=i2c-nct6775-dkms
_pkgbase=${pkgname%-dkms}
pkgver=5.6.7
pkgrel=1
pkgdesc='The i2c-nct6775 kernel driver'
arch=('any')
url='https://gitlab.com/CalcProgrammer1/OpenRGB'
license=('GPL2')
depends=('dkms')
conflicts=('linux>5.7' 'i2c-piix4-aura-dkms')
source=('i2c-nct6775.c'
        'dkms.conf'
        'Makefile'
        '90-i2c-aura.rules'
        'i2c-nct6775.conf')
md5sums=('6b41c8cd2bd4ecb9730245c2b64c969f'
         'e484b41b16f321b8db9804e18c699c40'
         '2c5e03996268bae865fd4395917512bd'
         'e44ab261a99faa252fc142cc5569502c'
         'a5cabc3bc60d2c9f6e02d1d56047cf8d')

prepare() {
  mkdir -p "${srcdir}/${_pkgbase}" && cd "${srcdir}/${_pkgbase}"

  cp ../dkms.conf ../Makefile .
  cp ../i2c-nct6775.c i2c-nct6775.c
}

package() {
  # Copy dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Set name and version
  sed -e "s/@_PKGBASE@/${_pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r ${_pkgbase}/{i2c-nct6775.c,Makefile} "${pkgdir}/usr/src/${_pkgbase}-${pkgver}/"

  # udev rule to alow users part of the 'wheel' group to access i2c without root privileges
  install -Dm644 90-i2c-aura.rules "${pkgdir}/usr/lib/udev/rules.d/90-i2c-aura.rules"

  # modprobe needed modules at boot
  install -Dm644 i2c-nct6775.conf "${pkgdir}/usr/lib/modules-load.d/i2c-nct6775.conf"
}
