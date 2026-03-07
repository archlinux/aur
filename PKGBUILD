# Maintainer: nardholio <nardholio@gmail.com>

pkgname=dod-pki-setup
pkgver=5.14
pkgrel=3
pkgdesc="One-click setup for DoD/DoW CAC/PKI on Arch Linux: Install drivers, certs, register PKCS#11 in browser. Works out of the box on most modern browsers."
arch=('any')
url="https://public.cyber.mil/pki-pke/"
license=('0BSD')
depends=('pcsclite' 'ccid' 'opensc' 'nss' 'p11-kit' 'openssl' 'ca-certificates-utils')
install="$pkgname.install"
source=("certs.zip") #https://dl.dod.cyber.mil/wp-content/uploads/pki-pke/zip/unclass-certificates_pkcs7_DoD.zip
sha256sums=('32595adbe752df5823cedd2c6a4f206c07fcc3c1520fb831015204e9fbb75711')
options=(!strip !debug)

package() {
  # Name of extracted cert bundle
  local bundle_dir="$srcdir/Certificates_PKCS7_v${pkgver//./_}_DoD"

  if [[ ! -d "$bundle_dir" ]]; then
    echo "Error: Expected cert bundle directory not found: $bundle_dir"
    exit 1
  fi

  # Convert the PEM-encoded cert bundle

  local main_pem_p7b="$bundle_dir/Certificates_PKCS7_v${pkgver//./_}_DoD.pem.p7b"
  if [[ -f "$main_pem_p7b" ]]; then
    install -dm755 "$pkgdir/etc/ca-certificates/trust-source/anchors"
    openssl pkcs7 -print_certs -in "$main_pem_p7b" -out "$pkgdir/etc/ca-certificates/trust-source/anchors/dod-cas.crt" || {
      echo "Error: Failed to extract certificates from main PEM bundle"
      exit 1
    }
  else
    echo "Error: Main PEM bundle not found: $main_pem_p7b"
    exit 1
  fi
}
