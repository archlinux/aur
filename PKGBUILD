# Maintainer: MiguVT <contacto@miguvt.com>

pkgname=marmalade-bin
pkgver=0.4.2
pkgrel=1
pkgdesc="MediaPipe tracking bridge for Linux with CLI, GTK3 and GTK4 binaries"
arch=('x86_64')
url="https://github.com/RanAwaySuccessfully/marmalade"
license=('MIT')
depends=('glibc' 'gtk3' 'gtk4' 'libv4l' 'xdg-utils' 'pciutils')
provides=('marmalade')
conflicts=('marmalade')
source=("${pkgname}-${pkgver}.zip::https://github.com/RanAwaySuccessfully/marmalade/releases/download/v${pkgver}/marmalade.zip")
sha256sums=('3f79dd87f9c5353e9ab70af7b41d8048070f5ef6ef60ff0fe79ab16909f9d3c3')

package() {
    install -d "${pkgdir}/usr/lib/marmalade"
    install -d "${pkgdir}/usr/bin"

    install -Dm755 "${srcdir}/marmalade" "${pkgdir}/usr/lib/marmalade/marmalade"
    install -Dm755 "${srcdir}/marmalade-gtk3" "${pkgdir}/usr/lib/marmalade/marmalade-gtk3"
    install -Dm755 "${srcdir}/marmalade-gtk4" "${pkgdir}/usr/lib/marmalade/marmalade-gtk4"
    install -Dm644 "${srcdir}/config.json" "${pkgdir}/usr/lib/marmalade/config.json"
    cp -a "${srcdir}/python" "${pkgdir}/usr/lib/marmalade/"

    cat > "${pkgdir}/usr/bin/marmalade" <<'EOF'
#!/bin/sh
state_dir="${XDG_CONFIG_HOME:-$HOME/.config}/marmalade"
mkdir -p "$state_dir"

if [ ! -e "$state_dir/config.json" ]; then
    install -m 600 /usr/lib/marmalade/config.json "$state_dir/config.json"
fi

if [ ! -e "$state_dir/python" ]; then
    ln -s /usr/lib/marmalade/python "$state_dir/python"
fi

cd "$state_dir" || exit 1
exec /usr/lib/marmalade/marmalade "$@"
EOF

    cat > "${pkgdir}/usr/bin/marmalade-gtk3" <<'EOF'
#!/bin/sh
state_dir="${XDG_CONFIG_HOME:-$HOME/.config}/marmalade"
mkdir -p "$state_dir"

if [ ! -e "$state_dir/config.json" ]; then
    install -m 600 /usr/lib/marmalade/config.json "$state_dir/config.json"
fi

if [ ! -e "$state_dir/python" ]; then
    ln -s /usr/lib/marmalade/python "$state_dir/python"
fi

cd "$state_dir" || exit 1
exec /usr/lib/marmalade/marmalade-gtk3 "$@"
EOF

    cat > "${pkgdir}/usr/bin/marmalade-gtk4" <<'EOF'
#!/bin/sh
state_dir="${XDG_CONFIG_HOME:-$HOME/.config}/marmalade"
mkdir -p "$state_dir"

if [ ! -e "$state_dir/config.json" ]; then
    install -m 600 /usr/lib/marmalade/config.json "$state_dir/config.json"
fi

if [ ! -e "$state_dir/python" ]; then
    ln -s /usr/lib/marmalade/python "$state_dir/python"
fi

cd "$state_dir" || exit 1
exec /usr/lib/marmalade/marmalade-gtk4 "$@"
EOF

    chmod 755 "${pkgdir}/usr/bin/marmalade" \
              "${pkgdir}/usr/bin/marmalade-gtk3" \
              "${pkgdir}/usr/bin/marmalade-gtk4"

    install -Dm644 "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
    install -Dm644 "${srcdir}/python/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE-python"
}
