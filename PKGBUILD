# Maintainer: Leonidas Spyropoulos <artafinde at gmail dot com>
# Contributor: CyrIng <labs[at]cyring[dot]fr>

### BUILD OPTIONS
# Set the next variables to ANYTHING that is not null to enable them

# Enable transparency mode in terminal
_transparency=

### Do no edit below this line unless you know what you're doing

pkgbase=corefreq
pkgname=(corefreq-client corefreq-server corefreq-dkms)
_gitname=CoreFreq
pkgver=1.94.4
pkgrel=1
pkgdesc="A CPU monitoring software with BIOS like functionalities"
arch=('x86_64')
url='https://github.com/cyring/CoreFreq'
license=('GPL2')
depends=('dkms')
source=(${pkgbase}-${pkgver}.tar.gz::"${url}/archive/${pkgver}.tar.gz"
        'dkms.conf'
        'honor-archlinux-compiler-flags.patch')
b2sums=('1e810909d59880e4fef0cd4f39c4bcba7c776f14e8178fcc014d9930c0d0fe36636906be9cf3575b0e67a42fa8dc5217b4412731e5630fd25b71c22f889866f5'
        'c6d8849944f99195038ac252d010d3e3001cd1dcaee57218c4a7f58fa313aa38842e4ea991d4d9ff7d04063ebaa9900c06ff1eacfa6270341cf37fb752adc00c'
        '3f5f9a27863412d620864e8c19e2683e3ef2103c4b95c126438330a9b532e2434664ce4860b6191552298131e434c09f5531428696dde7d70a1cb171b4f13edf')

prepare(){
  cd "${_gitname}-${pkgver}"
  patch -Np1 < "$srcdir/honor-archlinux-compiler-flags.patch"
}

build() {
  cd "${_gitname}-${pkgver}"
  if [ -n "${_transparency}" ]; then
    make corefreqd corefreq-cli UI_TRANSPARENCY=1
  else
    make corefreqd corefreq-cli
  fi
}

package_corefreq-dkms() {
  pkgdesc="CoreFreq - kernel module sources"
  depends=('dkms')
  _kernelmodule=corefreqk

  # Copy simple dkms.conf
  install -Dm644 dkms.conf "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"
  # Set name and version
  sed -e "s/@_PKGBASE@/${pkgbase}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -e "s/@_KERNELMODULE@/${_kernelmodule}/" \
      -i "${pkgdir}/usr/src/${pkgbase}-${pkgver}/dkms.conf"

  # Copy sources (including Makefile)
  cp -r "${_gitname}-${pkgver}"/{*.c,*.h,Makefile} "${pkgdir}/usr/src/${pkgbase}-${pkgver}/"
}

package_corefreq-server() {
  pkgdesc="CoreFreq server"
  depends=("corefreq-dkms=$pkgver")

  cd "${_gitname}-${pkgver}"
  install -Dm755 corefreqd "${pkgdir}/usr/bin/corefreqd"
  install -Dm 0644 corefreqd.service "${pkgdir}/usr/lib/systemd/system/corefreqd.service"
}

package_corefreq-client() {
  pkgdesc="CoreFreq client"
  depends=("corefreq-server=$pkgver")

  cd "${_gitname}-${pkgver}"
  install -Dm755 corefreq-cli "${pkgdir}/usr/bin/corefreq-cli"
}
