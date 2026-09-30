# Maintainer: SpidFightFR <spidfight@swisscows.email>

pkgname=netbird-networkmanager-plugin
_reponame="network-manager-vpn-plugin"
pkgver=0.1.12
pkgrel=1
pkgdesc='NetworkManager VPN plugin for NetBird'
url='https://github.com/netbirdio/network-manager-vpn-plugin'
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64' 'riscv64')
license=('BSD-3-Clause')
depends=(
    'netbird'
    'networkmanager'
    'xdg-utils'
    'glibc'
    'glib2'
    'libnm'
)
makedepends=(
    'pkgconf'
    'gtk3'
    'libnma'
    'gtk4'
    'libnma-gtk4'
    'go'
    'meson'
)
optdepends=(
  'libnma: GTK 3 connection editor (nm-connection-editor)'
  'libnma-gtk4: GTK 4 connection editor (GNOME Settings)'
)
source=("network-manager-vpn-plugin-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}.tar.gz")
sha256sums=('4da8c4ab06f3ff41e4b4ca3107808ae51e5dce07587cd74997e75f8c8b62780c')

prepare() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    # Arch keeps helper binaries in /usr/lib rather than /usr/libexec
    sed -i 's|/usr/libexec/|/usr/lib/|g' \
        packaging/NetworkManager/VPN/nm-netbird-service.name

    export GOPATH="${srcdir}/gopath"
    go mod download -modcacherw
}

build() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    # Go service + auth dialog, per the Arch Go packaging guidelines
    export GOPATH="${srcdir}/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS='-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw'
    mkdir -p bin
    go build -o bin/ ./cmd/nm-netbird-service ./cmd/nm-netbird-auth-dialog

    # libnm editor loader + GTK 3 and GTK 4 editor modules
    arch-meson . build -Dgtk4=true
    meson compile -C build
}

check() {
    cd "${srcdir}/${_reponame}-${pkgver}"
    export GOPATH="${srcdir}/gopath"
    # drop or narrow this if some tests turn out to need a D-Bus session
    go test ./...
}

package() {
    cd "${srcdir}/${_reponame}-${pkgver}"

    # nm_plugin_dir defaults to /usr/lib/NetworkManager
    meson install -C build --destdir "${pkgdir}"

    install -Dm755 -t "${pkgdir}/usr/lib" \
    bin/nm-netbird-service \
    bin/nm-netbird-auth-dialog

    # Vendor locations NetworkManager also reads; admins can override from /etc
    install -Dm644 -t "${pkgdir}/usr/lib/NetworkManager/VPN" \
    packaging/NetworkManager/VPN/nm-netbird-service.name
    install -Dm644 -t "${pkgdir}/usr/lib/NetworkManager/conf.d" \
    packaging/NetworkManager/conf.d/90-netbird-unmanaged.conf
    install -Dm644 -t "${pkgdir}/usr/share/dbus-1/system.d" \
    packaging/dbus-1/system.d/nm-netbird-service.conf

    install -Dm644 -t "${pkgdir}/usr/share/licenses/${pkgname}" LICENSE
    install -Dm644 -t "${pkgdir}/usr/share/doc/${pkgname}" README.md docs/*.md
}
