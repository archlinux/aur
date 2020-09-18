# Maintainer: Jean-Marc Lenoir <archlinux "at" jihemel "dot" com>

pkgname=vmware-thinprint
pkgver=2.0.21
_vmware_ver=16.0.0_16894299
pkgrel=2
pkgdesc='Thinprint support on VMware guests'
arch=('i686' 'x86_64')
url='https://www.vmware.com/products/workstation-for-linux.html'
license=(custom)
install="vmware-thinprint.install"
depends=(
  cups
)
makedepends=(
  p7zip
)
backup=(
  'etc/tpvmlp.conf'
)
source=(
  "https://download3.vmware.com/software/player/file/VMware-Player-${_vmware_ver/_/-}.${CARCH}.bundle"
  'vmware-thinprint.service'
)
sha256sums=(
  '3b1546928858cbf498d198dac96868b2f3f5f507550111630973b4ba91ce67ae'
  '02971c67bdbb289accd3faa6f0a8f1803e8145713235f4ba69671c16a9938dcc'
)

if [ "$CARCH" = "x86_64" ]; then
  _arch=amd64
else
  _arch=i386
fi

prepare() {
  extracted_dir="$srcdir/extracted"

  rm -rf "$extracted_dir"
  bash \
    "$(readlink -f "$srcdir/VMware-Player-${_vmware_ver/_/-}.${CARCH}.bundle")" \
    --extract "$extracted_dir"

  7z x "$extracted_dir"/vmware-virtual-printer/VirtualPrinter-Linux.iso "thinprint_${pkgver}-2_${_arch}.deb" -y > /dev/null

  mkdir -p deb_package
  ar p "thinprint_${pkgver}-2_${_arch}.deb" data.tar.gz | tar xz -C deb_package
}

package() {
  install -d -m 755 "$pkgdir"/usr/{bin,lib/tpvmlp/conf,share/licenses/"$pkgname"}

  install -Dm 644 "$srcdir"/vmware-thinprint.service "$pkgdir/usr/lib/systemd/system/vmware-thinprint.service"

  cd "$srcdir"/deb_package

  cp -r usr/lib/tpvmlp/bin "$pkgdir"/usr/lib/tpvmlp

  install -Dm 644 etc/tpvmlp.conf "$pkgdir"/etc/tpvmlp.conf

  install -Dm 755 usr/lib/cups/backend/tpvmgp "$pkgdir"/usr/lib/cups/backend/tpvmgp
  install -Dm 755 usr/lib/cups/backend/tpvmlp "$pkgdir"/usr/lib/cups/backend/tpvmlp

  install -Dm 644 usr/share/doc/thinprint/copyright "$pkgdir"/usr/share/licenses/"${pkgname}"/copyright

  ln -s /usr/lib/tpvmlp/bin/tpvmlp-2.0.135.1 "$pkgdir"/usr/bin/tpvmlp
  ln -s /usr/lib/tpvmlp/bin/tpvmlp-2.0.135.1 "$pkgdir"/usr/bin/tpvmlpadm
  ln -s /usr/lib/tpvmlp/bin/tpvmlpd-2.0.41.1 "$pkgdir"/usr/bin/tpvmlpd

  ln -s etc/tpvmlp.conf "$pkgdir"/usr/lib/tpvmlp/conf/tpvmlp.conf-2.0.2
}
