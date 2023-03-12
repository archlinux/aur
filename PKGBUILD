# Maintainer: Felix Morgner <felix.morgner@gmail.com>

_pkgname=cyber
pkgname=${_pkgname}-dkms
pkgver=42.1729.1906
pkgrel=1
pkgdesc="CYBER for your system (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/fmorgner/dev-cyber"
license=('GPL2')
depends=('dkms')
source=("https://github.com/fmorgner/dev-cyber/archive/v${pkgver}.tar.gz"
        "dkms.conf"
        "uaccess.patch"
        "10-cyber.conf")
sha256sums=('57d5206311e32cafe2ecebdaedc2808cc63c6f87ea46d78255e39e22b3d30365'
            'd976032e9f79a5cc679872b48e1c38124411891b6ce01527bfe24ff8f3df3a16'
            '365d11440e7dfaf281ad6d844a0f93a2f7eaca68880bfa89da5c58aaba0164e5'
            '99100ac04db2147ef246377b1ea4fc0c17106d37286e5d61cc02201301a85bbb')

package() {
  cd "${srcdir}"

  (cd "${srcdir}/dev-${_pkgname}-${pkgver}" && patch -p1 -i "${srcdir}/uaccess.patch")

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -Dm644 10-cyber.conf "${pkgdir}/etc/modules-load.d/10-cyber.conf"

  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}/dkms.conf"

  cd "dev-${_pkgname}-${pkgver}"

  for d in $(find . -type d); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -type f); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
