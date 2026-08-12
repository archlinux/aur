# Maintainer: Kainoa Kanter <kainoa@t1c.dev>
pkgname=letta-code-desktop-bin
pkgver=0.29.12
pkgrel=1
pkgdesc="Letta lets you build agents that learn"
arch=('x86_64')
url="https://www.letta.com"
license=('custom')
depends=('electron')
makedepends=('npm')
options=('!strip')
_todesktop_id=260305dtu2nh5
source=("latest-linux.yml::https://download.todesktop.com/${_todesktop_id}/latest-linux.yml"
        'patch-safestorage.sh')
sha256sums=('bd15f64a3e755a25695a5c5474e8c2ec399abc0c347408ad16d5f09ba3e30f04'
            'e1327529ac049a94d70c39ef5c1a2de21c5bb91e031b293cff73588ead7a8753')

pkgver() {
    grep '^version:' latest-linux.yml | awk '{print $2}'
}

prepare() {
    local _filename=$(grep '^path:' latest-linux.yml | awk '{print $2}')
    local _sha512=$(grep '^sha512:' latest-linux.yml | tail -1 | awk '{print $2}')

    # Download the latest AppImage
    curl -Lo "$_filename" "https://download.todesktop.com/${_todesktop_id}/${_filename}"

    # Verify integrity using the sha512 from latest-linux.yml
    local _actual=$(openssl dgst -sha512 -binary "$_filename" | base64 -w0)
    [[ "$_sha512" == "$_actual" ]] || { echo "SHA512 mismatch!"; return 1; }

    chmod +x "$_filename"
    ./"$_filename" --appimage-extract
}

build() {
    # Fix permissions; AppImage directories are 700 by default
    chmod -R a-x+rX squashfs-root/

    # Patch safeStorage to fall back to plaintext on unsupported desktops
    bash "${srcdir}/patch-safestorage.sh" squashfs-root/resources/app.asar
}

package() {
    install -dm755 "${pkgdir}/opt/${pkgname}"
    cp -dpr --no-preserve=ownership squashfs-root/resources "${pkgdir}/opt/${pkgname}/"

    # Wrapper script
    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/letta-code" <<EOF
#!/bin/sh
exec electron /opt/${pkgname}/resources/app.asar --no-sandbox "\$@"
EOF

    # Desktop entry
    install -Dm644 squashfs-root/letta-code.desktop \
        "${pkgdir}/usr/share/applications/letta-code.desktop"
    sed -i "s|Exec=AppRun.*|Exec=/usr/bin/letta-code %U|g" \
        "${pkgdir}/usr/share/applications/letta-code.desktop"

    # Icon
    install -Dm644 squashfs-root/letta-code.png \
        "${pkgdir}/usr/share/pixmaps/letta-code.png"
}
