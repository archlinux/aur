# Maintainer: Alex3236 <me@alex3236.moe>

pkgname=gety-bin
pkgver=0.5.7
pkgrel=1
pkgdesc="The local file search engine for you and your AI agents, made by Listary team"
arch=('x86_64')
url="https://gety.ai/"
license=('LicenseRef-Gety-ToS')
depends=(
    'bubblewrap'
    'cairo'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'libayatana-appindicator'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=('gety')
conflicts=('gety' 'gety-appimage')
options=('!strip')
source=(
    "gety-${pkgver}.deb::https://dl.gety.ai/Gety-linux-x64-${pkgver}-beta.deb"
    "gety-license.txt"
)
sha256sums=('4c74dd34fba3b0c275bf589b1b42a23b99a6cbb6e3fcd4120f2973bab749b355'
            'fe5811b6741770c6dded6256176f4a71bdf2918541a1191767484984e810172e')

package() {
    cd "$srcdir"
    rm -rf deb
    mkdir -p deb/root
    cd deb
    ar x "$srcdir/gety-${pkgver}.deb"
    tar -xzf data.tar.gz -C root

    # Keep Gety's expected main executable and resource paths.
    install -Dm755 root/usr/bin/Gety "$pkgdir/usr/bin/Gety"
    install -dm755 "$pkgdir/usr/lib/Gety/bin"
    install -Dm755 root/usr/bin/deno "$pkgdir/usr/lib/Gety/bin/deno"
    install -Dm755 root/usr/bin/aria2c "$pkgdir/usr/lib/Gety/bin/aria2c"
    install -Dm755 root/usr/bin/mcp-proxy "$pkgdir/usr/lib/Gety/bin/mcp-proxy"
    install -Dm755 root/usr/bin/gety-reporter "$pkgdir/usr/lib/Gety/bin/gety-reporter"
    cp -a root/usr/lib/Gety/. "$pkgdir/usr/lib/Gety/"

    # Map bundled helpers into /usr/bin only inside Gety's mount namespace.
    install -Dm755 /dev/stdin "$pkgdir/usr/bin/gety" <<'EOF'
#!/bin/sh

exec bwrap \
    --ro-bind / / \
    --bind "$HOME" "$HOME" \
    --tmpfs /tmp \
    --ro-bind-try /tmp/.X11-unix /tmp/.X11-unix \
    --bind "/run/user/$(id -u)" "/run/user/$(id -u)" \
    --dev-bind /dev /dev \
    --overlay-src /usr/bin \
    --tmp-overlay /usr/bin \
    --ro-bind /usr/lib/Gety/bin/deno /usr/bin/deno \
    --ro-bind /usr/lib/Gety/bin/aria2c /usr/bin/aria2c \
    --ro-bind /usr/lib/Gety/bin/mcp-proxy /usr/bin/mcp-proxy \
    --ro-bind /usr/lib/Gety/bin/gety-reporter /usr/bin/gety-reporter \
    --setenv PATH "/usr/lib/Gety/bin${PATH:+:$PATH}" \
    /usr/bin/Gety "$@"
EOF

    install -Dm644 root/usr/share/applications/Gety.desktop \
        "$pkgdir/usr/share/applications/gety.desktop"
    sed -i 's/^Exec=Gety$/Exec=gety/' "$pkgdir/usr/share/applications/gety.desktop"
    sed -i '/^Comment=/d; /^Name=Gety$/a Comment=The local file search engine for you and your AI agents' \
        "$pkgdir/usr/share/applications/gety.desktop"

    install -Dm644 root/usr/share/icons/hicolor/32x32/apps/Gety.png \
        "$pkgdir/usr/share/icons/hicolor/32x32/apps/Gety.png"
    install -Dm644 root/usr/share/icons/hicolor/128x128/apps/Gety.png \
        "$pkgdir/usr/share/icons/hicolor/128x128/apps/Gety.png"
    install -Dm644 root/usr/share/icons/hicolor/256x256@2/apps/Gety.png \
        "$pkgdir/usr/share/icons/hicolor/256x256@2/apps/Gety.png"

    # Gety ships no license text; distribute the terms snapshot from gety.ai
    # (maintained in this repo as gety-license.txt, like google-chrome's
    # eula_text.html). Refresh it manually when upstream terms change.
    install -Dm644 "$srcdir/gety-license.txt" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
