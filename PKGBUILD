
# Maintainer: zedspeirs <zoltan.komar@protonmail.com>
# Previous Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Previous Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>

_watch=(
    'https://www.realvnc.com/en/connect/download/viewer/linux/'
    'body'
    'regex'
    'RealVNC-Connect-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb'
    'pkgver'
)

pkgname=realvnc-vnc-viewer
pkgver=8.6.0
pkgrel=2
pkgdesc='RealVNC Connect Viewer remote desktop client'
arch=('x86_64')
url='https://www.realvnc.com/'
license=('LicenseRef-RealVNC')

depends=(
    'atk'
    'at-spi2-core'
    'cairo'
    'dbus'
    'fontconfig'
    'glib2'
    'gtk3'
    'libepoxy'
    'libx11'
    'libxext'
    'pango'
)

makedepends=('libarchive' 'patchelf')

optdepends=(
    'avahi: local network service discovery'
    'cups: remote printing support'
    'xorg-xwayland: X11 compatibility under Wayland'
)

conflicts=('realvnc-rvncconnect')

source=('LICENSE')

source_x86_64=(
    "https://downloads.realvnc.com/download/file/realvnc-connect-viewer/RealVNC-Connect-Viewer-${pkgver}-Linux-x64.deb"
)

sha256sums=('d15f7cbc21aab009fac5243a8d27f92de0234f2cbb53bbc238985a843a4c7520')
sha256sums_x86_64=('ded516d5b75ed3df56d8156100413316852d4a4e35be6b786fa66c8b613e8eb5')


noextract=("RealVNC-Connect-Viewer-${pkgver}-Linux-x64.deb")

package() {
    local deb="${srcdir}/RealVNC-Connect-Viewer-${pkgver}-Linux-x64.deb"
    local extract_dir="${srcdir}/deb-extract"
    local archive=''
    local desktop

    # Extract the Debian package.
    install -d "$extract_dir"
    bsdtar -xf "$deb" -C "$extract_dir" || return 1

    # Locate the Debian data archive.
    for archive in "$extract_dir"/data.tar*; do
        [[ -f "$archive" ]] && break
    done

    if [[ ! -f "$archive" ]]; then
        printf '%s\n' 'ERROR: Debian data archive not found' >&2
        return 1
    fi

    # Extract the application files.
    bsdtar --no-same-owner -xf "$archive" -C "$pkgdir" || return 1

    # Verify the RealVNC executable.
    if [[ ! -f "$pkgdir/usr/lib/rvncconnect/rvncconnect" ]]; then
        printf '%s\n' 'ERROR: RealVNC executable not found' >&2
        return 1
    fi

    # Remove insecure upstream build paths from RUNPATH.
    patchelf --set-rpath '$ORIGIN/lib' \
        "$pkgdir/usr/lib/rvncconnect/rvncconnect" || return 1

    # Install the RealVNC EULA.
    install -Dm644 "${srcdir}/LICENSE" \
        "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

    # Install the Wayland-compatible launcher.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/vncviewer" <<'EOF'
#!/bin/sh

# Use XWayland when running under Wayland.
if [ "${XDG_SESSION_TYPE:-}" = "wayland" ] ||
   [ -n "${WAYLAND_DISPLAY:-}" ]; then
    export GDK_BACKEND=x11
fi

# Start a D-Bus session if none exists.
if [ -z "${DBUS_SESSION_BUS_ADDRESS:-}" ]; then
    exec dbus-run-session -- /usr/lib/rvncconnect/rvncconnect "$@"
fi

exec /usr/lib/rvncconnect/rvncconnect "$@"
EOF

    # Update desktop launchers.
    for desktop in \
        com.realvnc.rvncconnect.desktop \
        com.realvnc.rvncconnect.connect.uri.desktop; do

        desktop="$pkgdir/usr/share/applications/$desktop"

        if [[ ! -f "$desktop" ]]; then
            printf 'ERROR: Desktop file not found: %s\n' "$desktop" >&2
            return 1
        fi

        sed -i \
            's|^Exec=/usr/lib/rvncconnect/rvncconnect|Exec=/usr/bin/vncviewer|' \
            "$desktop"
    done
}
