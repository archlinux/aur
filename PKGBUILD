# Maintainer: ava1ar <mail(at)ava1ar(dot)me>
# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Star Brilliant <echo bTEzMjUzQGhvdG1haWwuY29tCg== | base64 -d>
_watch=('https://www.realvnc.com/en/connect/download/viewer/linux/' 'body' 'regex' 'RealVNC-Connect-Viewer-(\d[\d.]*\d+)-Linux-x64\.deb' 'pkgver')

pkgname=realvnc-vnc-viewer
pkgver=8.3.0
pkgrel=1
pkgdesc='VNC remote desktop client software by RealVNC'
arch=('x86_64')
url='https://www.realvnc.com/'
license=('custom')
depends=('atk' 'at-spi2-core' 'cairo' 'dbus' 'fontconfig' 'glib2' 'gtk3' 'libepoxy' 'pango' 'libx11' 'libxext')
optdepends=('cups' 'avahi')
conflicts=('realvnc-rvncconnect' 'tightvnc' 'tigervnc' 'turbovnc')

source_x86_64=("https://downloads.realvnc.com/download/file/realvnc-connect-viewer/RealVNC-Connect-Viewer-${pkgver}-Linux-x64.deb")
sha256sums_x86_64=('ef1d66e5fe457d7023e150f49e9c626609082aa014bf0ba7517a96d4362a6afb')

package() {
    bsdtar --no-same-owner -xf "${srcdir}/data.tar.xz" -C "${pkgdir}"

    install -Dm755 /dev/stdin "${pkgdir}/usr/bin/vncviewer" <<'EOF'
#!/bin/sh
if [ "${XDG_SESSION_TYPE:-}" = wayland ] || [ -n "${WAYLAND_DISPLAY:-}" ]; then
    export GDK_BACKEND=x11
fi

if [ -z "$DBUS_SESSION_BUS_ADDRESS" ] && [ -z "$DBUS_SESSION_BUS_PID" ]; then
    exec dbus-run-session -- /usr/lib/rvncconnect/rvncconnect "$@"
fi

exec /usr/lib/rvncconnect/rvncconnect "$@"
EOF

    sed -i 's|^Exec=/usr/lib/rvncconnect/rvncconnect|Exec=/usr/bin/vncviewer|' \
        "${pkgdir}/usr/share/applications/com.realvnc.rvncconnect.desktop"
    sed -i 's|^Exec=/usr/lib/rvncconnect/rvncconnect|Exec=/usr/bin/vncviewer|' \
        "${pkgdir}/usr/share/applications/com.realvnc.rvncconnect.connect.uri.desktop"
}
