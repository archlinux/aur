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
        BJCA_Global_Root_CA1:2.16.85.111.101.227.180.217.144.106.27.9.209.108.62.192.108.32.tmp-p11-kit \
        BJCA_Global_Root_CA2:2.16.44.23.8.125.100.42.192.254.133.24.89.6.207.180.74.235.tmp-p11-kit \
        CFCA_EV_ROOT:2.4.24.74.204.214.tmp-p11-kit \
        GDCA_TrustAUTH_R5_ROOT:2.8.125.9.151.254.240.71.234.122.tmp-p11-kit \
        Hongkong_Post_Root_CA_3:2.20.8.22.95.138.76.165.236.0.201.147.64.223.196.198.174.35.184.28.90.164.tmp-p11-kit \
        TrustAsia_Global_Root_CA_G3:2.20.100.246.14.101.119.97.106.171.59.180.234.133.132.187.177.137.184.113.147.15.tmp-p11-kit \
        TrustAsia_Global_Root_CA_G4:2.20.79.35.100.184.142.151.99.158.198.83.129.193.118.78.203.42.116.21.214.215.tmp-p11-kit \
        TrustAsia_SMIME_ECC_Root_CA:2.20.90.194.248.41.79.227.125.197.94.29.24.111.59.147.32.31.255.123.186.45.tmp-p11-kit \
        TrustAsia_SMIME_RSA_Root_CA:2.20.90.238.113.223.222.12.87.133.181.187.54.34.215.184.118.70.2.115.202.255.tmp-p11-kit \
        TrustAsia_TLS_ECC_Root_CA:2.20.54.116.225.77.124.101.19.201.172.131.85.37.160.62.82.126.47.80.104.199.tmp-p11-kit \
        TrustAsia_TLS_RSA_Root_CA:2.20.28.24.216.207.229.83.63.34.53.70.83.84.36.60.108.71.209.92.74.156.tmp-p11-kit \
        UCA_Extended_Validation_Root:2.16.79.210.43.143.245.100.200.51.158.79.52.88.102.35.112.96.tmp-p11-kit \
        UCA_Global_G2_Root:2.16.93.223.177.218.90.163.237.93.190.90.101.32.101.3.144.239.tmp-p11-kit \
        vTrus_ECC_Root_CA:2.20.110.106.188.89.170.83.190.152.57.103.162.210.107.164.59.230.109.28.214.218.tmp-p11-kit \
        vTrus_Root_CA:2.20.67.227.113.19.216.179.89.20.93.183.206.140.253.53.253.111.188.5.141.69.tmp-p11-kit
}
