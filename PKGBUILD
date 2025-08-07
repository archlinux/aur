# Packager: Sebastian Tobie <archlinux@sebastian-tobie.de>
_channel="stable"

pkgname="barmer-ecare-bin"
pkgver=25.6.4
pkgrel=1
pkgdesc='Desktopanwendung für die Elektronische Patientenakte der BARMER'
arch=('x86_64')
url='https://www.barmer.de/unsere-leistungen/leistungen-a-z/online-services/ecare-elektronische-patientenakte/ecare-fuer-pc-laptop-1056418'
license=('Proprietary')
# These deps are the one retrieved from the barmer-ecare binary
depends=(
    'gcc-libs'
    'glibc'
    'gmp'
    'jbigkit'
    'leancrypto'
    'libasound.so'
    'libatk-1.0.so'
    'libatk-bridge-2.0.so'
    'libatspi.so'
    'libavahi-client.so'
    'libavahi-common.so'
    'libblkid.so'
    'libbrotlicommon.so'
    'libbrotlidec.so'
    'libbz2.so'
    'libcairo-gobject.so'
    'libcairo.so'
    'libcap.so'
    'libcloudproviders'
    'libcups'
    'libdatrie'
    'libdbus-1.so'
    'libdrm'
    'libepoxy.so'
    'libexpat.so'
    'libffi.so'
    'libfontconfig.so'
    'libfreetype.so'
    'libfribidi.so'
    'libgdk-3.so'
    'libgdk_pixbuf-2.0.so'
    'libgio-2.0.so'
    'libglib-2.0.so'
    'libgmodule-2.0.so'
    'libgnutls.so'
    'libgobject-2.0.so'
    'libgraphite2.so'
    'libgtk-3.so'
    'libharfbuzz.so'
    'libhogweed.so'
    'libicudata.so'
    'libicuuc.so'
    'libidn2.so'
    'libjpeg.so'
    'libjson-glib-1.0.so'
    'liblzma.so'
    'libmount.so'
    'libnettle.so'
    'libp11-kit.so'
    'libpango-1.0.so'
    'libpangocairo-1.0.so'
    'libpangoft2-1.0.so'
    'libpcre2-8.so'
    'libpixman-1.so'
    'libpng16.so'
    'libsqlite3.so'
    'libsystemd.so'
    'libtasn1.so'
    'libthai'
    'libtiff.so'
    'libtinysparql-3.0.so'
    'libudev.so'
    'libunistring.so'
    'libwayland-client.so'
    'libwayland-cursor.so'
    'libwayland-egl.so'
    'libx11'
    'libXau.so'
    'libxcb'
    'libxcomposite'
    'libxcursor'
    'libxdamage'
    'libXdmcp.so'
    'libxext'
    'libxfixes'
    'libxi'
    'libxinerama'
    'libxkbcommon.so'
    'libxml2.so'
    'libxrandr'
    'libxrender'
    'libz.so'
    'libzstd.so'
    'nspr'
    'nss'
    'vdpau-driver'
)
optdepends=(
    'pcsclite'
)

makedepends=('squashfs-tools' 'jq' 'curl' 'gendesk' 'patchelf')
source=()
sha256sums=()
conflicts=()

pkgver() {
    curl -H 'Snap-device-series: 16' -s https://api.snapcraft.io/v2/snaps/info/barmer-ecare | jq -r --arg channel "$_channel"  '.["channel-map"][] | select(.channel.name == $channel) | .version'
}

prepare() {
    # URLs of the squashfs file are dynamic and are unpredictable
    url=$(curl -H 'Snap-device-series: 16' -s https://api.snapcraft.io/v2/snaps/info/barmer-ecare | jq -r --arg channel "$_channel" '.["channel-map"][] | select(.channel.name == $channel) | .download.url')
    curl -Lo barmer-ecare.squashfs "$url"
}

build(){
    gendesk -f -n --pkgname "barmer-ecare-bin" --name "Barmer eCare" --pkgdesc "${pkgdesc}" --exec="/usr/lib/barmer-ecare/barmer-ecare" --categories='Network;MedicalSoftware' --icon barmer-ecare --path=/usr/lib/barmer-ecare
    unsquashfs -d "." barmer-ecare.squashfs app meta
    # It removes the rpath to load the system libraries, hardcodes the path of the libffmpeg.so and removes unneeded deps.
    patchelf --remove-rpath --replace-needed libffmpeg.so /usr/lib/barmer-ecare/libffmpeg.so --remove-needed libdl.so.2 --remove-needed libpthread.so.0 app/barmer-ecare
}

package() {
    mkdir -p "${pkgdir}/usr/lib"
    mv "app" "${pkgdir}/usr/lib/barmer-ecare"
    install -DT -m 0644 barmer-ecare.desktop "${pkgdir}/usr/share/applications/barmer-ecare.desktop"
    # Icon is buggy.
    install -DT -m 0644 meta/gui/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/barmer-ecare.png"
}
