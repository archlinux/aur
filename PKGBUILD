# Maintainer: BrLi <brli at chakralinux dot org>
# Contributor: hexchain <i at hexchain dot org>

pkgname=ca-certificates-blacklist-anti-china
_pkgver=$(pacman -Q ca-certificates-mozilla | cut -d ' ' -f 2 | cut -d '-' -f 1)
pkgver=$_pkgver
pkgrel=1
pkgdesc="A set of Chinese CAs' certificates which should be avoided"
url="https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS"
arch=(any)
license=('MPL' 'GPL')
depends=('ca-certificates-utils')
makedepends=('python')
source=("https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_${pkgver//./_}_RTM/src/nss-${pkgver}.tar.gz"
        "certdata2pem.py")
_sha=$(curl https://ftp.mozilla.org/pub/security/nss/releases/NSS_${pkgver//./_}_RTM/src/SHA256SUMS | head -n 1 | cut -d ' ' -f 1)
sha256sums=("$_sha"
            'd2a1579dae05fd16175fac27ef08b54731ecefdf414085c610179afcf62b096c')

prepare() {
    mkdir -p certs

    cd "nss-$pkgver"
    ln -sfr nss/lib/ckfw/builtins/certdata.txt ../certs/
}


build() {
    cd certs
    python ../certdata2pem.py
}

package() {
    cd "$srcdir/certs"
    install -Dm644 -t "$pkgdir/usr/share/ca-certificates/trust-source/blacklist/" \
        Certum_Root_CA:2.3.1.0.32.tmp-p11-kit \
        Certum_Trusted_Network_CA_2:2.16.33.214.208.74.79.37.15.201.50.55.252.170.94.18.141.233.tmp-p11-kit \
        Certum_Trusted_Network_CA:2.3.4.68.192.tmp-p11-kit \
        GDCA_TrustAUTH_R5_ROOT:2.8.125.9.151.254.240.71.234.122.tmp-p11-kit \
        CFCA_EV_ROOT:2.4.24.74.204.214.tmp-p11-kit \
        Verisign_Class_1_Public_Primary_Certification_Authority_-_G3:2.17.0.139.91.117.86.132.84.133.11.0.207.175.56.72.206.177.164.tmp-p11-kit \
        Verisign_Class_2_Public_Primary_Certification_Authority_-_G3:2.16.97.112.203.73.140.95.152.69.41.231.176.166.217.80.91.122.tmp-p11-kit
}
