# Maintainer: Your Name <youremail@domain.com>
_pkgname='SAP-Dissection-plug-in-for-Wireshark'
pkgname=wireshark-sap-dissector
pkgver=0.9.1
pkgrel=1
pkgdesc="Wireshark dissector for SAP's NI, Message Server, Router, Diag, Enqueue, IGS, SNC and HDB protocols."
arch=('x86_64')
url="https://www.secureauth.com/labs/open-source-tools/sap-dissection-plug-in-for-wireshark/"
license=('GPL2')
depends=('wireshark-cli>=3.4')
makedepends=(cmake)
source=("https://github.com/SecureAuthCorp/${_pkgname}/archive/v${pkgver}.tar.gz"
        001-fix-config-include.patch
        002-install-system-wide.patch)
sha512sums=('d540b790ab5ba518dcff663b5be1bd1c2a64d569246c454ed3b5d56a66e4c454ac336b49e9761674fcad59918d9fcfb3ec757c2979daaeaa7c415e3dd6959645'
            'b48bbe2b98752a2adf572a4241e5644cd239ac63813b5b92d9b274608c52f73137a1778ac4b66b63a7c6d9680b27299e3c3c8bbcf2fe0142b9ff191ec5582461'
            '51e71b3248ca2efed44ac9b3eb641219ebda153ac9a68780cca025aed9027d631d64f3739107077953831a5ded272c4327523e2a4ea96eef3b5e0fa42db33b6d')

prepare() {
  local f

  cd "${_pkgname}-${pkgver}"
  for f in "${source[@]}"; do
    if [[ "$f" == *.patch ]]; then
      patch -p1 -i "$srcdir/$f"
    fi
  done
}

build() {
  mkdir -p "build-${pkgver}"
  cd "build-${pkgver}"
  cmake "${srcdir}/${_pkgname}-${pkgver}"
  make
}

package() {
  cd "build-${pkgver}"
  make DESTDIR="${pkgdir}/" install
}
