# Maintainer: SteamedFish <steamedfish@hotmail.com>
pkgname=ovital-map
pkgver=10.5.2
pkgrel=1
pkgdesc="Ovital Map (奥维互动地图) - cross-platform map browser"
arch=('x86_64' 'aarch64' 'loong64')
url="https://www.ovital.com"
license=('LicenseRef-custom')
depends=(
    'alsa-lib'
    'dbus'
    'fontconfig'
    'freetype2'
    'gcc-libs'
    'glib2'
    'glu'
    'gstreamer'
    'gst-plugins-base-libs'
    'gst-plugins-bad-libs'
    'gtk-update-icon-cache'
    'hicolor-icon-theme'
    'libcups'
    'libpulse'
    'libsm'
    'libx11'
    'libxcb'
    'libxcomposite'
    'libxcursor'
    'libxdamage'
    'libxext'
    'libxfixes'
    'libxi'
    'libxkbcommon'
    'libxkbcommon-x11'
    'libxrandr'
    'libxrender'
    'libxtst'
    'mesa'
    'nspr'
    'nss'
    'qt5-base'
    'zlib'
)
makedepends=('patchelf')
options=('!strip')
source_x86_64=("Linux-x86_64-OMap-${pkgver}-build32687.deb::https://cdn.ovital.com/pub/Linux-x86_64-OMap-${pkgver}-build32687.deb")
source_aarch64=("Linux-aarch64-OMap-${pkgver}-build32687.deb::https://cdn.ovital.com/pub/Linux-aarch64-OMap-${pkgver}-build32687.deb")
source_loong64=("Linux-loongarch64-OMap-${pkgver}-build32687.deb::https://cdn.ovital.com/pub/Linux-loongarch64-OMap-${pkgver}-build32687.deb")
b2sums_x86_64=('04e242c5c1c4b1eb2a2a5e71e478b82d6e40934734a0cd267c2fc5b03e1b6a490f698978726b39e9e427dbbf4ab50938d6e4b6e607e87c352307de4fd55f113d')
b2sums_aarch64=('17f68109decda029f1d18731f69d276a2ab913995c5e7e634797ddc4b64e816d371066c764ad259b4882eab697a7c5f977378041f77c43faafcf85437405f044')
b2sums_loong64=('5ed17f714efcfdb5b25d386f81a75ea7eb6d2630b43695f6946bab09340bf81db71c207c35fc346dc13f89f6ad48046d11ec8f8f90c856ea242d5e7378effbee')

package() {
    local _debarch="${CARCH}"
    if [[ "${_debarch}" == 'loong64' ]]; then
        _debarch='loongarch64'
    fi

    bsdtar -O -xf "Linux-${_debarch}-OMap-${pkgver}-build32687.deb" data.tar.gz | bsdtar -xzf - -C "$pkgdir"

    # Fix permissions on executables
    chmod 755 "$pkgdir/opt/com.ovital.map/OMapQT"
    chmod 755 "$pkgdir/opt/com.ovital.map/OMapQTUpgrade"
    chmod 755 "$pkgdir/opt/com.ovital.map/launcher"

    # Replace insecure RUNPATHs containing /usr/local with relative $ORIGIN
    while IFS= read -r -d '' _so; do
        local _rpath
        _rpath=$(patchelf --print-rpath "$_so" 2>/dev/null) || continue
        [[ "$_rpath" == *"/usr/local"* ]] && patchelf --set-rpath '$ORIGIN' "$_so"
    done < <(find "$pkgdir/opt/com.ovital.map" -type f \( -name '*.so' -o -name '*.so.*' \) -print0)

    # Fix desktop entry to use OMapQT directly (launcher has Wayland issues)
    sed -i 's|^Exec=/opt/com.ovital.map/launcher|Exec=/opt/com.ovital.map/OMapQT|' \
        "$pkgdir/usr/share/applications/ovital-map.desktop"

    # Fix invalid Categories entry
    sed -i 's|^Categories=Application$|Categories=Geography;Maps;|' \
        "$pkgdir/usr/share/applications/ovital-map.desktop"

    # Fetch and install upstream license text
    install -d "$pkgdir/usr/share/licenses/$pkgname"
    curl -sL "https://www.ovital.com/agreement/" \
        -o "$pkgdir/usr/share/licenses/$pkgname/LICENSE.html"
}
