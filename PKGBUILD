# Maintainer: Nadir <nadir@localhost>
# Upstream: https://github.com/metadream/flawless-cut

pkgname=flawless-cut
pkgver=1.2.2
pkgrel=1
pkgdesc="Fast, lossless video cutter and merger"
arch=(x86_64)
url="https://github.com/metadream/flawless-cut"
license=(MIT)

# libudev.so.1 is provided by systemd (Arch) or elogind/libudev (Artix);
# both are present on any desktop install, so it is not listed explicitly.
depends=(
    alsa-lib          # libasound.so.2
    at-spi2-core      # libatk-bridge-2.0.so.0, libatspi.so.0
    avahi             # libavahi-client (runtime)
    cairo             # libcairo.so.2
    cups              # libcups.so.2
    dbus              # libdbus-1.so.3
    expat             # libexpat.so.1
    ffmpeg            # system ffmpeg, replaces the vendored static build
    glib2             # libglib/gobject/gio-2.0.so.0
    gtk3              # libgtk-3.so.0 (pulls in atk, pango, gdk-pixbuf)
    libx11            # libX11.so.6
    libxcomposite     # libXcomposite.so.1
    libxcursor        # dlopen'ed by Chromium input handling
    libxdamage        # libXdamage.so.1
    libxext           # libXext.so.6
    libxfixes         # libXfixes.so.3
    libxi             # dlopen'ed by Chromium input handling
    libxrandr         # libXrandr.so.2
    libxtst           # dlopen'ed by Chromium (input injection)
    libxcb            # libxcb.so.1
    libxkbcommon      # libxkbcommon.so.0
    mesa              # libgbm.so.1
    mediainfo         # system mediainfo, replaces the vendored build
    nspr              # libnspr4.so
    nss               # libnss3/nssutil3/smime3.so
    xdg-utils         # xdg-open for openExternal/openPath
)
makedepends=(nodejs)

source=("https://github.com/metadream/flawless-cut/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('37d6ca80c9f843124cd3e48fa2342b2172898014d04fe5249dbc9ada13fee47c')

build() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    # Installs devDependencies (electron, electron-builder);
    # electron's postinstall downloads the matching runtime binary.
    # Upstream ships no package-lock.json, so `npm install` is used instead of `npm ci`.
    npm install --no-audit --no-fund

    # Unpacked app dir: Electron runtime + resources/app.asar + resources/bin
    npx electron-builder --dir -l
}

package() {
    cd "${srcdir}/${pkgname}-${pkgver}"

    install -d "${pkgdir}/opt/${pkgname}"
    cp -a dist/linux-unpacked/. "${pkgdir}/opt/${pkgname}/"

    # Use the system ffmpeg/mediainfo instead of the vendored static builds
    rm -f "${pkgdir}/opt/${pkgname}/resources/bin/"{ffmpeg,mediainfo}
    ln -s /usr/bin/ffmpeg "${pkgdir}/opt/${pkgname}/resources/bin/ffmpeg"
    ln -s /usr/bin/mediainfo "${pkgdir}/opt/${pkgname}/resources/bin/mediainfo"

    # Arch policy: no setuid binaries in packages. Chromium falls back to the
    # user-namespace sandbox (unprivileged_userns_clone=1 on Arch/Artix).
    chmod 0755 "${pkgdir}/opt/${pkgname}/chrome-sandbox"

    install -d "${pkgdir}/usr/bin"
    ln -s "/opt/${pkgname}/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"

    install -Dm644 assets/build/icon.png \
        "${pkgdir}/usr/share/icons/hicolor/512x512/apps/${pkgname}.png"

    install -d "${pkgdir}/usr/share/applications"
    cat > "${pkgdir}/usr/share/applications/${pkgname}.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=FlawlessCut
Comment=Fast, lossless video cutter and merger
Exec=flawless-cut
Icon=flawless-cut
Categories=AudioVideo;VideoEditing;
Terminal=false
EOF
}
sha256sums=('37d6ca80c9f843124cd3e48fa2342b2172898014d04fe5249dbc9ada13fee47c')
