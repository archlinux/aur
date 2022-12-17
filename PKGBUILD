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
        GDCA_TrustAUTH_R5_ROOT:2.8.125.9.151.254.240.71.234.122.tmp-p11-kit \
        Hongkong_Post_Root_CA_1:2.2.3.232.tmp-p11-kit \
        Hongkong_Post_Root_CA_3:2.20.8.22.95.138.76.165.236.0.201.147.64.223.196.198.174.35.184.28.90.164.tmp-p11-kit \
        CFCA_EV_ROOT:2.4.24.74.204.214.tmp-p11-kit \
        Verisign_Class_1_Public_Primary_Certification_Authority_-_G3:2.17.0.139.91.117.86.132.84.133.11.0.207.175.56.72.206.177.164.tmp-p11-kit \
        Verisign_Class_2_Public_Primary_Certification_Authority_-_G3:2.16.97.112.203.73.140.95.152.69.41.231.176.166.217.80.91.122.tmp-p11-kit \
        vTrus_ECC_Root_CA:2.20.110.106.188.89.170.83.190.152.57.103.162.210.107.164.59.230.109.28.214.218.tmp-p11-kit \
        vTrus_Root_CA:2.20.67.227.113.19.216.179.89.20.93.183.206.140.253.53.253.111.188.5.141.69.tmp-p11-kit
}
