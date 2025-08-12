# Maintainer: Sebastian Tobie <archlinux@sebastian-tobie.de>
_channel="stable"
_sizes=(16 24 32 48 64 72 96 128 192 256 384 512)
_root_dir=/opt/barmer-ecare


pkgname="barmer-ecare-bin"
pkgver=25.6.4
pkgrel=3
pkgdesc='Desktopanwendung für die Elektronische Patientenakte der BARMER extrahiert aus dem snap packet der BARMER'
arch=('x86_64')
url='https://www.barmer.de/unsere-leistungen/leistungen-a-z/online-services/ecare-elektronische-patientenakte/ecare-fuer-pc-laptop-1056418'
license=('Proprietary')
# These deps are the one retrieved from the barmer-ecare binary
depends=(
    gcc-libs
    glibc
    libasound.so=2-64
    libatk-1.0.so=0-64
    libatk-bridge-2.0.so=0-64
    libatspi.so=0-64
    libcairo.so=2-64
    libcups
    libdbus-1.so=3-64
    libexpat.so=1-64
    libgio-2.0.so=0-64
    libglib-2.0.so=0-64
    libgobject-2.0.so=0-64
    libgtk-3.so=0-64
    libpango-1.0.so=0-64
    libpcsclite.so=1-64
    libudev.so=1-64
    libx11
    libxcb
    libxcomposite
    libxdamage
    libxext
    libxfixes
    libxkbcommon.so=0-64
    libxrandr
    mesa
    nspr
    nss
)

makedepends=('squashfs-tools' 'jq' 'curl' 'gendesk' 'patchelf' 'asar' 'modclean' 'imagemagick')
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
    gendesk -f -n --pkgname "barmer-ecare-bin" --name "Barmer eCare" --pkgdesc "${pkgdesc}" --exec="$_root_dir/barmer-ecare" --categories='Network;MedicalSoftware' --icon barmer-ecare --path="$_root_dir"
    unsquashfs -d "." barmer-ecare.squashfs app meta
    # It removes the rpath to load the system libraries, hardcodes the path of the libffmpeg.so and removes unneeded deps.
    patchelf --remove-rpath --replace-needed libffmpeg.so "$_root_dir/libffmpeg.so" app/barmer-ecare
    rm -rfv app/libvk_swiftshader.so app/vk_swiftshader_icd.json app/libvulkan.so.1
    rm -rfv app/resources/ssl
    asar e app/resources/app.asar data
    rm -rf app/resources/app.asar app/resources/app.asar.unpacked

    modclean -r -n default:safe -p data
    find data \
        \( -type f -iname '.*' -or -iname 'tsconfig.json' -or -iname 'LICENSE*.*' -or -iname '*.map' -or -iname '*.sass' -or -iname '*.hash' -or -iname '*.swf' -or -iname '*.[hc]' \) -or \
        \( -type d -empty \) \
        | xargs rm -rvf
    find data -iname '*.js' -or -iname '*.?js' -exec uglifyjs -c --no-annotations --keep-fnames --v8 -o {} -- {} \;
    hardlink --reflink=never -b 1G -mc data
    asar p --unpack '*.pdf' data app/resources/app.asar
    for size in ${_sizes[@]} ; do
        magick meta/gui/icon.png -resize "${size}x${size}" "${size}.png"
    done
}

package() {
    install -d "${pkgdir}${_root_dir}"
    mv app/* "${pkgdir}${_root_dir}"
    install -DT -m 0644 barmer-ecare.desktop "${pkgdir}/usr/share/applications/barmer-ecare.desktop"
    for size in ${_sizes[@]} ; do
        install -DT -m 0644 "${size}.png" "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/barmer-ecare.png"
    done
    install -DT -m 0644 meta/gui/icon.png "${pkgdir}/usr/share/icons/hicolor/1024x1024/apps/barmer-ecare.png"
    install -d "${pkgdir}/usr/share/doc/barmer-ecare-bin"
    ln "${pkgdir}${_root_dir}/resources/app.asar.unpacked/pdf/Datenschutzerklaerung.pdf" "${pkgdir}/usr/share/doc/barmer-ecare-bin/Datenschutzerklärung.pdf"
    ln "${pkgdir}${_root_dir}/resources/app.asar.unpacked/pdf/Nutzungsbedingungen.pdf" "${pkgdir}/usr/share/doc/barmer-ecare-bin/Nutzungsbedingungen.pdf"
    ln "${pkgdir}${_root_dir}/resources/app.asar.unpacked/pdf/Nutzungsbedingungen_Linux.pdf" "${pkgdir}/usr/share/doc/barmer-ecare-bin/Nutzungsbedingungen_Linux.pdf"
    ln "${pkgdir}${_root_dir}/resources/app.asar.unpacked/pdf/Zugriffseinschraenkungen.pdf" "${pkgdir}/usr/share/doc/barmer-ecare-bin/Zugriffseinschränkungen.pdf"
}
