# Maintainer: Felix Morgner <felix.morgner@gmail.com>

_pkgname=cyber
pkgname=${_pkgname}-dkms
pkgver=42.1815
pkgrel=1
pkgdesc="CYBER for your system (DKMS)"
arch=('i686' 'x86_64')
url="https://github.com/fmorgner/dev-cyber"
license=('GPL2')
depends=('dkms')
source=("https://github.com/fmorgner/dev-cyber/archive/v${pkgver}.tar.gz"
        "dkms.conf"
        "10-cyber.conf")
sha256sums=('bbdcda5d30d972300b0bf6f4856e6e25120dce3b71642de8bd7b38a7c05ab18d'
            '44a852c8ce455d9345f927e4daa194b41de2e67c4cdaf6f2fe870c92a1739541'
            '99100ac04db2147ef246377b1ea4fc0c17106d37286e5d61cc02201301a85bbb')

package() {
  cd "${srcdir}"

  local install_dir="${pkgdir}/usr/src/${_pkgname}-${pkgver}"

  install -Dm644 10-cyber.conf "${pkgdir}/etc/modules-load.d/10-cyber.conf"

  install -Dm644 dkms.conf "${install_dir}/dkms.conf"

  sed -e "s/@_PKGBASE@/${_pkgname}/" \
      -e "s/@PKGVER@/${pkgver}/" \
      -i "${install_dir}/dkms.conf"

  cd "dev-${_pkgname}-${pkgver}"

  for d in $(find . -type d -and -not -name '.vscode' ); do
    install -dm755 "${install_dir}/$d"
  done

  for f in $(find . -path './.vscode' -prune -prune -or \( -type f -and -not -name '.gitignore' -and -print \)); do
    install -m644 "$f" "${install_dir}/$f"
  done
}
