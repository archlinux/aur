# Maintainer: fathoni(dot)id(at)gmail(dot)com

pkgname=input-veikk-dkms
pkgver=2.0
_pkgname="veikk-linux-driver-${pkgver}"
pkgrel=1
pkgdesc="Linux driver providing pressure sensitivity for VEIKK drawing tablets (S640, A50, A30)"
arch=('i686' 'x86_64')
url="https://github.com/jlam55555/veikk-s640-driver"
license=('GPL')
depends=('dkms' 'git')
optdepends=('input-veikk-config')
source=("https://github.com/jlam55555/veikk-linux-driver/archive/refs/tags/v${pkgver}.tar.gz"
        'veikk.conf'
        'dkms.conf')
sha256sums=('a8c1dbd393f94c210a17c7ba2f71c0ceffa371a4c591f379e384c1fff59e8436'
            '0756ecb5963f925653b56343ea6d40c589773499fe80d0993ec696a842efa5a1'
            'fca1624365efab225c8be9069aef92059945677faacc6002bcca2a0eda2f917f')

package() {
  # Installation directory
  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  cd "${srcdir}/${_pkgname}"

  sed -i "s/@MODULE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf"
  sed -i "s/@MODULE_VERSION@/${pkgver}/" "${srcdir}/dkms.conf"
  install -D -m644 -t "${install_dir}/" "${srcdir}/dkms.conf"
 
  # Install source files
  for file in {Makefile,*.c,*.h}; do
    [ -f "$file" ] || continue
    install -D -m644 -t "${install_dir}/" "${file}"
  done
  # Load the module at boot
  install -Dm644 ${srcdir}/veikk.conf ${pkgdir}/etc/modules-load.d/veikk.conf
} 
