# Maintainer: George Snyder <snydergd91@gmail.com>

pkgname=nextpvr-bin
pkgver=6.1.5
pkgrel=1
epoch=1
pkgdesc="NextPVR binary distribution"
arch=('arm64' 'arm32' 'x86_64')
url="https://www.nextpvr.com/download.html"
license=('custom:commercial')
depends=(
	# detected by namcap
	'lib32-gcc-libs' 'lib32-systemd' 'lib32-glibc' 'curl' 'glib2' 'gcc-libs' 'systemd-libs' 'libzen' 'libmms' 'zlib' 'fontconfig'
	# From install instructions
	'mediainfo' 'libmediainfo' 'glibc' 'libgdiplus' 'v4l-utils' 'dtv-scan-tables' 'ffmpeg' 'dotnet-host'
	# Discovered while trying to run
	'aspnet-runtime-6.0' 'dotnet-runtime-6.0')
makedepends=('coreutils')
provides=('nextpvr')
conflicts=('nextpvr')
source=("${pkgname}-${pkgver}.zip::https://github.com/sub3/releases/releases/download/${pkgver}/NPVR-${pkgver}.zip" "launch.sh" "nextpvr.service")
sha256sums=('0ffe647e8375a6088c89473b9cc797635ec53a2165983633716aaf5dd53f4885' 'SKIP' 'SKIP')

prepare() {
    chmod 755 "${srcdir}/DeviceHost/x64/DeviceHostLinux"
    chmod 755 "${srcdir}/DeviceHost/arm32/DeviceHostLinux"
    chmod 755 "${srcdir}/DeviceHost/arm64/DeviceHostLinux"
}

package() {
    # Vendor files
    mkdir -p "${pkgdir}/opt"
    cp -ar "${srcdir}" "${pkgdir}/opt/nextpvr"
    rm "${pkgdir}/opt/nextpvr/${pkgname}-${pkgver}.zip"

    # Launch script
    rm "${pkgdir}/opt/nextpvr/launch.sh"
    install -m755 -D "${srcdir}/launch.sh" "${pkgdir}/usr/bin/nextpvr"

    # Systemd service
    rm "${pkgdir}/opt/nextpvr/nextpvr.service"
    install -D "${srcdir}/nextpvr.service" "${pkgdir}/etc/systemd/user/nextpvr.service"
}
