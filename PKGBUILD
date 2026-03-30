# Maintainer: snapetech <slskdn@proton.me>
# 🔋 slskdn - The batteries-included Soulseek web client (build from source)
pkgname=slskdn
_pkgname=slskd
pkgver=0.24.5.slskdn.112
pkgrel=1
pkgdesc="🔋 The batteries included fork of slskd with 24+ new features: decentralized pods, content validation, swarm downloads, DHT mesh networking, auto-replace, wishlist, security hardening."
arch=('x86_64' 'aarch64')
url="https://github.com/snapetech/slskdn"
license=('AGPL-3.0-or-later')
depends=('dotnet-runtime-8.0' 'aspnet-runtime-8.0' 'yt-dlp')
makedepends=('dotnet-sdk-8.0' 'dotnet-runtime-8.0' 'aspnet-runtime-8.0' 'nodejs' 'npm')
optdepends=(
    'docker: for containerized deployment'
    'ffmpeg: for audio decoding and SongID media handling'
    'python: for SongID Python tooling'
    'python-torchaudio: optional enhancement for advanced Python-based fingerprint and analysis workflows in SongID'
)
provides=('slskd' 'slskd-bin')
conflicts=('slskd' 'slskd-bin' 'slskdN-bin')
replaces=('slskd' 'slskd-bin' 'slskdN-bin')
backup=('etc/slskd/slskd.yml')
install=slskd.install
source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/snapetech/slskdn/archive/refs/tags/${pkgver//.slskdn/-slskdn}.tar.gz"
    "slskd.service"
    "slskd.yml"
    "slskd.sysusers"
)
# Note: First hash is SKIP (tarball changes each release), others are static file hashes
sha256sums=('SKIP' 'd2146ef5879e73f488074072505389c895f4483f8f024077e1f62f676e22730a' '6d60a8a8ec79b1df0f5839e9a5ba8a77a021cc457fa138a62b58f4321b3a16df' '28b6c2c8d969a91bc8b5ae3e7289562928fff39ed07b92973e5b93fa45033056')

build() {
    cd "${srcdir}/slskdn-${pkgver//.slskdn/-slskdn}"
    
    # Build frontend (--legacy-peer-deps matches CI; resolves react-scripts vs typescript@5)
    cd src/web
    npm ci --legacy-peer-deps
    DISABLE_ESLINT_PLUGIN=true npm run build
    cd ../..
    
    # Build backend (not self-contained, uses system .NET)
    # Clean obj/bin and publish so we get fresh 9.x DLLs (not stale 8.x from previous build)
    rm -rf src/slskd/obj src/slskd/bin publish
    # Set Version + InformationalVersion so UI shows correct version (not 0.0.0 / Development)
    _version="${pkgver//.slskdn/-slskdn}"
    _assembly_ver="${pkgver%.slskdn.*}.${pkgver##*.}"
    dotnet publish src/slskd/slskd.csproj \
        -c Release \
        -o publish \
        --self-contained false \
        -r linux-x64 \
        -p:Version="$_assembly_ver" \
        -p:InformationalVersion="$_version" \
        -p:PackageVersion="$_version"
}

package() {
    cd "${srcdir}/slskdn-${pkgver//.slskdn/-slskdn}"
    
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
