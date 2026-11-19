# Maintainer: czyt <czytcn@gmail.com>
pkgname=finch-bin
pkgver=1.8.1
pkgrel=1
pkgdesc="Finch: desktop client for the Finch agent platform, with cross-session memory, skills and mini tools"
arch=('x86_64')
url="https://github.com/finchtoys/finch-releases"
# Upstream publishes the application without a licence of its own. The runtime
# it is built on is MIT, and Chromium's notices travel with the package.
license=('LicenseRef-Proprietary')
depends=('alsa-lib' 'at-spi2-core' 'cairo' 'cups' 'dbus' 'expat' 'gcc-libs' 'glib2' 'glibc' 'gtk3' 'libnotify' 'libsecret' 'libx11' 'libxcb' 'libxcomposite' 'libxdamage' 'libxext' 'libxfixes' 'libxkbcommon' 'libxrandr' 'libxss' 'libxtst' 'mesa' 'nspr' 'nss' 'pango' 'python' 'python-yaml' 'systemd-libs' 'util-linux-libs' 'xdg-utils')
optdepends=('libayatana-appindicator: tray icon support')
provides=('finch-desktop')
# The program itself is called finch, like the ncurses-based messenger of the
# same name; only one of the two can be installed at a time.
conflicts=('finch' 'finch-desktop')
# The bundle is a finished Electron build; stripping it would mean rewriting
# 215 MB of upstream binary for no gain, and a debug package of the same size.
options=('!strip' '!debug')

_deb="Finch-${pkgver}-amd64-linux.deb"

source=("${_deb}::https://github.com/finchtoys/finch-releases/releases/download/v${pkgver}/${_deb}")
noextract=("${_deb}")
sha256sums=('55d698b0d254ca506662b66e183a081745f4a20e13b3de2f230cf2cccf970bc2')

package() {
    local data_archive
    data_archive="$(bsdtar -tf "${srcdir}/${_deb}" | sed -n '/^data\.tar/{p;q;}')"
    [[ -n "$data_archive" ]] || { echo "No data.tar.* member in ${_deb}" >&2; return 1; }
    bsdtar -xOf "${srcdir}/${_deb}" "$data_archive" | bsdtar --no-same-owner -xf - -C "${pkgdir}"

    # The Debian package keeps the application in /opt/Finch. The whole tree
    # moves into /usr/lib, so that the program can be started as `finch`.
    install -d "${pkgdir}/usr/lib"
    mv "${pkgdir}/opt/Finch" "${pkgdir}/usr/lib/finch"
    rmdir "${pkgdir}/opt"

    # Chromium's own sandbox helper, as Arch's electron package ships it.
    chmod 4755 "${pkgdir}/usr/lib/finch/chrome-sandbox"

    # The program takes its window title and its window class from the name
    # it is started under, so it is started under its own name and not under
    # the name of the shortcut in /usr/bin.
    install -d "${pkgdir}/usr/bin"
    cat > "${pkgdir}/usr/bin/finch" <<'EOF'
#!/bin/sh
exec /usr/lib/finch/Finch "$@"
EOF
    chmod 755 "${pkgdir}/usr/bin/finch"

    # The icons and the mime definition are renamed to lower case, to match
    # the naming of the rest of the package.
    for icon in "${pkgdir}"/usr/share/icons/hicolor/*/apps/Finch.png; do
        [ -e "$icon" ] || continue
        mv "$icon" "${icon%Finch.png}finch.png"
    done
    mv "${pkgdir}/usr/share/mime/packages/Finch.xml" \
       "${pkgdir}/usr/share/mime/packages/finch.xml"

    install -d "${pkgdir}/usr/share/applications"
    # The upstream entry points at the file in /opt; it is replaced by one
    # that starts the program from its new place.
    rm -f "${pkgdir}/usr/share/applications/Finch.desktop"
    cat > "${pkgdir}/usr/share/applications/finch.desktop" <<'EOF'
[Desktop Entry]
Type=Application
Name=Finch
Comment=Finch desktop agent client
Exec=finch --ozone-platform-hint=auto %U
Icon=finch
Terminal=false
StartupWMClass=Finch
MimeType=application/x-finch-miniprogram;
Categories=Utility;
EOF

    install -d "${pkgdir}/usr/share/doc/${pkgname}"
    mv "${pkgdir}/usr/share/doc/finch-desktop/changelog.gz" \
       "${pkgdir}/usr/share/doc/${pkgname}/"
    rmdir "${pkgdir}/usr/share/doc/finch-desktop"

    # The licences of the bundled runtime and of Chromium.
    install -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 "${pkgdir}/usr/lib/finch/LICENSE.electron.txt" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE.electron.txt"
    install -m644 "${pkgdir}/usr/lib/finch/LICENSES.chromium.html" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSES.chromium.html"
    cat > "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE" <<'EOF'
Finch desktop client
====================

Upstream publishes the application without stating a licence for its own
code, so it is redistributed here unchanged and unpublished.

The application is built on Electron and Chromium. The licences of those
parts ship with the package:

  LICENSE.electron.txt    the MIT licence of the Electron runtime
  LICENSES.chromium.html  the notices of the bundled Chromium components

The mini tools that come with the application keep their own licences; those
files are inside the application's resources directory.
EOF
}
