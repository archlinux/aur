# Maintainer: Nelly <ffhhjsxu@gmail.com>
pkgname=s3dns
pkgver=0.2.20
pkgrel=5
pkgdesc="Find S3 AWS/GCP/Azure buckets while surfing. S3DNS acts as DNS server."
arch=('any')
url="https://github.com/olizimmermann/s3dns"
license=('MIT')
depends=('python' 'python-dnspython' 'python-requests' 'python-yaml')
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('f67508a7f12ffdc21cae1427b44bf7a635ed442296d65781dedde0eb1deeceb3')

prepare() {
    cd "${pkgname}-${pkgver}"
    sed -i 's/"s3dns.log"/"\/tmp\/s3dns.log"/g' s3dns.py
}

package() {
    cd "${pkgname}-${pkgver}"
    
    install -d "$pkgdir/usr/share/${pkgname}"
    install -d "$pkgdir/usr/bin"

    install -m644 s3dns.py "$pkgdir/usr/share/${pkgname}/"
    cp -r helpers ip_ranges patterns images "$pkgdir/usr/share/${pkgname}/"
    
    cat << EOF > "$pkgdir/usr/bin/${pkgname}"
#!/bin/sh
cd /usr/share/${pkgname}
exec python3 s3dns.py "\$@"
EOF
    
    chmod 755 "$pkgdir/usr/bin/${pkgname}"
    
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 README.md "$pkgdir/usr/share/doc/${pkgname}/README.md"
}
