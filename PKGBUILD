# Maintainer: Andrew Koidan <deathangel908@gmail.com>
pkgname=http-remote-pc-control
pkgver=1.1.0
commit=04c2737
pkgrel=1
pkgdesc="HTTP remote PC control tool"
arch=('x86_64')
url="https://github.com/akoidan/http-remote-pc-control"
license=('MIT')
depends=(
  'libxtst'
  'xcb-util-wm'
  'xorg-setxkbmap'
)
source=(
  "http-remote-pc-control::${url}/releases/download/${commit}/app.elf"
  "${pkgname}@.service"
  "san.cnf"
)

sha256sums=(
  '9009e02dda80354cf591ff8812dcf6b3e0ca8f59549cc823f54b3416214cb232'
  'SKIP'
  'SKIP'
)

post_install() {
  # Create a system user for the app if it doesn't exist
  if ! id -u httpremote &>/dev/null; then
    useradd --system --no-create-home --shell /usr/bin/nologin httpremote
  fi

  if [ !  -d "/var/lib/http-remote-pc-control/certs" ] ; then
    cat > /path/to/filename.conf <<EOF
    [req]
    distinguished_name = req_distinguished_name
    req_extensions = v3_req
    prompt = no

    [req_distinguished_name]
    C = US
    ST = CA
    L = SF
    O = Example Org
    CN = localhost

    [v3_req]
    subjectAltName = @alt_names

    [alt_names]
    DNS.1 = *
EOF

    # Create directory for certs with correct ownership
    install -d -m700 -o httpremote -g httpremote /var/lib/http-remote-pc-control
    mkdir -p /var/lib/http-remote-pc-control/certs/ca
    mkdir -p /var/lib/http-remote-pc-control/certs/server

    # Generate CA Key and Certificate
    openssl genrsa -out /var/lib/http-remote-pc-control/certs/ca/ca-key.pem 2048
    openssl req -new -x509 -key /var/lib/http-remote-pc-control/certs/ca/ca-key.pem -out /var/lib/http-remote-pc-control/certs/ca/ca-cert.pem -days 3650 -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=Example Root CA"

    # Generate Server Key and CSR
    openssl genrsa -out /var/lib/http-remote-pc-control/certs/key.pem 2048
    openssl req -new -key /var/lib/http-remote-pc-control/certs/key.pem -out /var/lib/http-remote-pc-control/certs/csr.pem -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=localhost"

    # Sign Server Certificate with CA including SAN
    openssl x509 -req -in /var/lib/http-remote-pc-control/certs/csr.pem -CA /var/lib/http-remote-pc-control/certs/ca/ca-cert.pem -CAkey /var/lib/http-remote-pc-control/certs/ca/ca-key.pem -CAcreateserial -out /var/lib/http-remote-pc-control/certs/cert.pem -days 365 -extfile san.cnf -extensions v3_req

    # Generate Client Key and CSR
    openssl genrsa -out /var/lib/http-remote-pc-control/certs/client/key.pem 2048
    openssl req -new -key /var/lib/http-remote-pc-control/certs/client/key.pem -out /var/lib/http-remote-pc-control/certs/client/csr.pem -subj "/C=US/ST=CA/L=SF/O=Example Org/CN=Client"

    # Sign Client Certificate with CA
    openssl x509 -req -in /var/lib/http-remote-pc-control/certs/client/csr.pem -CA /var/lib/http-remote-pc-control/certs/ca/ca-cert.pem -CAkey /var/lib/http-remote-pc-control/certs/ca/ca-key.pem -CAcreateserial -out /var/lib/http-remote-pc-control/certs/client/cert.pem -days 365

    cp /var/lib/http-remote-pc-control/certs/ca/ca-cert.pem /var/lib/http-remote-pc-control/certs/client/ca-cert.pem
    cp /var/lib/http-remote-pc-control/certs/ca/ca-cert.pem /var/lib/http-remote-pc-control/certs/ca-cert.pem

    rm /var/lib/http-remote-pc-control/certs/ca/ca-cert.pem
    rm /var/lib/http-remote-pc-control/certs/ca/ca-cert.srl

    rm /var/lib/http-remote-pc-control/certs/csr.pem
    rm /var/lib/http-remote-pc-control/certs/client/csr.pem

    chown -R httpremote:httpremote /var/lib/http-remote-pc-control/
  fi
}

package() {
  install -D -m755 "${srcdir}/http-remote-pc-control" "${pkgdir}/usr/bin/http-remote-pc-control"
  install -D -m644 "${srcdir}/${pkgname}@.service" "${pkgdir}/usr/lib/systemd/system/${pkgname}@.service"
}