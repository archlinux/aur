# Maintainer: Charles Villard <charles at villard (dot) it>

# This installs a proprietary driver for the 0a5c:586* fingerprint reader. The driver is distributed in binary
# form by its manufacturer and follows their own copyright - please refer to their license at the source
# or the LICENSE file installed by this package

pkgname=libfprint-2-tod1-broadcom-cv3plus
_pkgdirname=libfprint-2-tod1-broadcom-cv3plus
_fw_ver=6.4.334
pkgver=6.4.054.0
pkgrel=1
pkgdesc="Proprietary driver for the Dell ControlVault3 Plus (0a5c:586*) fingerprint reader"
arch=(x86_64)
url="https://packages.broadcom.com/artifactory/dell-controlvault-drivers/"
license=(custom)
depends=(libfprint-tod)
makedepends=(git)
checkdepends=()
optdepends=()
provides=("libfprint-2-tod1-broadcom-cv3plus=${pkgver}")
conflicts=('libfprint-2-tod1-broadcom-cv3plus')
options=('!strip')
groups=(fprint)


source=("${url}brcm_linux_fp_${_fw_ver}_${pkgver}.tgz")
sha256sums=('SKIP')

package() {
  cd "$srcdir/brcm_linux_fp"
  # Create target directories in the package and use -Dm after to avoid repeating long filenames

  install -dm 755 "$pkgdir/usr/lib/libfprint-2/tod-1/"
  install -dm 755 "$pkgdir/usr/lib/udev/rules.d/"
  install -dm 755 "$pkgdir/var/lib/fprint/.broadcomCv3plusFW/"

  # 2. Install Licence
  install -Dm 644 ./LICENCE.broadcom "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  # 3. Install Driver (Mapping Debian path to Arch path)
  install -Dm 755 usr/lib/x86_64-linux-gnu/libfprint-2/tod-1/libfprint-2-tod-1-broadcom-cv3plus.so "$pkgdir/usr/lib/libfprint-2/tod-1/"

  # 4. Install Udev Rules
  cp -r lib/udev/rules.d/* "$pkgdir/usr/lib/udev/rules.d/"

  # 5. Install Firmware (using copy to grab hidden files inside)
  cp -r var/lib/fprint/.broadcomCv3plusFW/* "$pkgdir/var/lib/fprint/.broadcomCv3plusFW/"
  
}
