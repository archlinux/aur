# Maintainer: Poscat <poscat@mail.poscat.moe>

pkgname=sni-modifier
pkgver=1.0.0
pkgrel=1
pkgdesc="A socks5 proxy that modifies sni header to bypass https firewalls"
arch=('x86_64' 'i686' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/poscat0x04/proxy"
license=("custom")
makedepends=("go" "easy-rsa")
source=("main.go"
        "sni-modifier.service"
        "LICENSE"
        "sni-modifier.install")
sha256sums=("c3528d2ec9a47113abab24d1c6b22cfe599c15d14a28dadabb71ea7b8b527379"
            "2f4f17fa1e7ba462f65aaac3057e64fb3d3b3603978f45a8574b5f104f9d3edd"
            "0a8c70ca29638bbe9f8f26d523240525b62da7182cac8652fc7e315fc1ee4139"
            "2a66a962763091939a56353b9083e99872d419de7458f7cf034f5ec02b18494e")


prepare() {
    #mkdir $srcdir/gopath
    export GOPATH="$srcdir/gopath"
    go get "github.com/Sirupsen/logrus"
    go get "github.com/armon/go-socks5"
    go get "github.com/miekg/dns"
    go get "golang.org/x/net/publicsuffix"
}

build() {
    export GOPATH="$srcdir/gopath"
    go build -o sni-modifier
    cp /etc/easy-rsa/openssl-easyrsa.cnf .
    easyrsa init-pki
    easyrsa --batch build-ca nopass
}

package() {
    install -D -m 0755 sni-modifier "$pkgdir/usr/bin/sni-modifier"
    install -D -m 0644 pki/ca.crt "$pkgdir/etc/sni-modifier/CA.crt"
    install -D -m 0600 pki/private/ca.key "$pkgdir/etc/sni-modifier/CA.key"
    install -D -m 0644 sni-modifier.service "$pkgdir/usr/lib/systemd/system/sni-modifier.service"
    install -D -m 0644 LICENSE "$pkgdir/usr/share/licenses/sni-modifier/LICENSE"
}
