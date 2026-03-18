# Maintainer: Nikolay Bryskin <nbryskin@gmail.com>
pkgname=gopass-secret-service
pkgver=0.2.0
pkgrel=2
pkgdesc="D-Bus Secret Service provider using GoPass as backend"
arch=('x86_64' 'aarch64')
url="https://github.com/nikicat/gopass-secret-service"
license=('MIT')
depends=('gopass')
makedepends=('go')
optdepends=(
    'libsecret: for secret-tool CLI'
    'python-secretstorage: for Python applications'
)
provides=('secret-service' 'org.freedesktop.secrets')
conflicts=('gnome-keyring')
backup=('etc/gopass-secret-service/config.yaml')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/nikicat/${pkgname}/archive/v${pkgver}.tar.gz")
sha256sums=('99fe5da77ee5a999473fcd60e10e9d48e9fb616a03ba94d4f4e01d21b33e0b51')

build() {
    cd "${pkgname}-${pkgver}"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o ${pkgname} ./cmd/gopass-secret-service
}

package() {
    cd "${pkgname}-${pkgver}"

    # Install binary
    install -Dm755 "${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    # Install systemd user service
    install -Dm644 /dev/stdin "${pkgdir}/usr/lib/systemd/user/${pkgname}.service" <<EOF
[Unit]
Description=GoPass Secret Service
Documentation=https://github.com/nikicat/gopass-secret-service

[Service]
Type=simple
ExecStart=/usr/bin/gopass-secret-service
Restart=on-failure

[Install]
WantedBy=default.target
EOF

    # Install D-Bus service file for activation
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/dbus-1/services/org.freedesktop.secrets.service" <<EOF
[D-BUS Service]
Name=org.freedesktop.secrets
Exec=/usr/bin/gopass-secret-service
EOF

    # Install default config
    install -Dm644 /dev/stdin "${pkgdir}/etc/${pkgname}/config.yaml" <<EOF
# GoPass Secret Service configuration

# Prefix in gopass for Secret Service entries
prefix: secret-service

# Default collection name (used for "default" alias)
default_collection: default

# Logging level: debug, info, warn, error
log_level: info
EOF

    # Install license
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
