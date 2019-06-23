# Maintainer: nous(at)artixlinux.org

pkgname=input-veikk-dkms
_pkgname=input-veikk
pkgver=r42.0359cc1
pkgrel=1
pkgdesc="Linux driver providing pressure sensitivity for VEIKK drawing tablets (S640, A50, A30)"
arch=('i686' 'x86_64')
url="https://github.com/jlam55555/veikk-s640-driver"
license=('GPL')
depends=('dkms' 'git')
source=(${_pkgname}::git+${url}.git
        'veikk.conf'
        'dkms.conf')
sha1sums=('SKIP'
          '58ea5a020380c922d62b43c6403b4310a18967b4'
          '35423db037910181d6fcada916180b09c28ff8ad')

pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

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
