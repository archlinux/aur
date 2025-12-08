# Maintainer: snapetech <slskdN@proton.me>
# 🔋 slskdN - The batteries-included Soulseek web client (build from source)
pkgname=slskdn
_pkgname=slskd
pkgver=0.24.1.slskdn.22
pkgrel=1
pkgdesc="🔋 The batteries included, ***EXPERIMENTAL*** fork of slskd. Feature-rich, including wishlist, smart ranking, tabbed browsing, notifications & more"
arch=('x86_64' 'aarch64')
url="https://github.com/snapetech/slskdN"
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0')
makedepends=('dotnet-sdk-8.0' 'nodejs' 'npm')
optdepends=(
    'docker: for containerized deployment'
)
provides=('slskd' 'slskd-bin')
conflicts=('slskd' 'slskd-bin' 'slskdn-bin')
replaces=('slskd' 'slskd-bin' 'slskdn-bin')
backup=('etc/slskd/slskd.yml')
install=slskd.install
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/snapetech/slskdN/archive/refs/tags/${pkgver//.slskdN/-slskdN}.tar.gz"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
)
sha256sums=('SKIP' 'SKIP' 'SKIP' 'SKIP')

build() {
    cd "${srcdir}/slskdN-${pkgver//.slskdN/-slskdN}"
    
    # Build frontend
    cd src/web
    npm ci
    npm run build
    cd ../..
    
    # Build backend (not self-contained, uses system .NET)
    dotnet publish src/slskd/slskd.csproj \
        -c Release \
        -o publish \
        --self-contained false \
        -r linux-x64
}

package() {
    cd "${srcdir}/slskdN-${pkgver//.slskdN/-slskdN}"
    
    # Install application to /usr/lib/slskd (same location as original slskd)
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}"
    cp -r publish/* "${pkgdir}/usr/lib/${_pkgname}/"
    
    # Install web assets
    install -dm755 "${pkgdir}/usr/lib/${_pkgname}/wwwroot"
    cp -r src/web/build/* "${pkgdir}/usr/lib/${_pkgname}/wwwroot/"
    
    # Make binary executable
    chmod +x "${pkgdir}/usr/lib/${_pkgname}/slskd"
    
    # Create symlink /usr/bin/slskd -> /usr/lib/slskd/slskd
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf "/usr/lib/${_pkgname}/slskd" "${pkgdir}/usr/bin/${_pkgname}"
    
    # Install systemd service as slskd.service
    install -Dm644 "${srcdir}/slskd.service" "${pkgdir}/usr/lib/systemd/system/${_pkgname}.service"
    
    # Install sysusers config
    install -Dm644 "${srcdir}/slskd.sysusers" "${pkgdir}/usr/lib/sysusers.d/${_pkgname}.conf"
    
    # Install default config to /etc/slskd/slskd.yml
    install -Dm644 "${srcdir}/slskd.yml" "${pkgdir}/etc/${_pkgname}/${_pkgname}.yml"
    
    # Create data directories at /var/lib/slskd
    install -dm755 "${pkgdir}/var/lib/${_pkgname}"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/downloads"
    install -dm755 "${pkgdir}/var/lib/${_pkgname}/incomplete"
}
