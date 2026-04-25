# Maintainer: Qingxu <me@linioi.com>
pkgname=yansu
pkgver=0.1.237
pkgrel=1
pkgdesc='Proactive AI app builder by Isoform'
arch=(
    'x86_64'
    'aarch64'
)
url='https://yansu.app'
license=(
    'LicenseRef-proprietary'
)
depends=(
    'expat'
    'gcc-libs'
    'gdk-pixbuf2'
    'glib2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libcurl-gnutls'
    'pcre2'
    'perl'
    'webkit2gtk'
    'zlib'
)
options=(
    '!strip'
    '!debug'
)
source=(
    'yansu.png::https://yansu.app/assets/logo.png'
)
source_x86_64=(
    "$pkgname-$pkgver-x86_64.tar.gz::https://release.yansu.app/releases/v$pkgver/Yansu-linux-x64.tar.gz"
)
source_aarch64=(
    "$pkgname-$pkgver-aarch64.tar.gz::https://release.yansu.app/releases/v$pkgver/Yansu-linux-arm64.tar.gz"
)
sha256sums=('7b46cb7b305ec49707759bc177f992c168312c0b4bbaaec73bc0d8ee5df386f2')
sha256sums_x86_64=('69b9578c9df872c28696904b2e9ddb139265babf35223bb301c0b7ba861115fe')
sha256sums_aarch64=('c80e9e8822a1047178bd7f7151e8fbae09535f035b06cc2f3a34f944f2222095')

package() {
    install -dm755 \
        "$pkgdir/opt/yansu" \
        "$pkgdir/usr/bin" \
        "$pkgdir/usr/share/applications" \
        "$pkgdir/usr/share/icons/hicolor/484x484/apps" \
        "$pkgdir/usr/share/licenses/$pkgname"

    cp -a \
        "$srcdir/Yansu" \
        "$srcdir/bun-bundle" \
        "$srcdir/ffmpeg-bundle" \
        "$srcdir/git-bundle" \
        "$srcdir/rtk-bundle" \
        "$srcdir/whisper-bundle" \
        "$srcdir/yansu-cli-bundle" \
        "$pkgdir/opt/yansu/"

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/yansu" <<'EOF'
#!/bin/sh
exec /opt/yansu/yansu-cli-bundle/bin/yansu "$@"
EOF

    install -Dm755 /dev/stdin "$pkgdir/usr/bin/yansu-desktop" <<'EOF'
#!/bin/sh
cd /opt/yansu
exec ./Yansu "$@"
EOF

    install -Dm644 /dev/stdin "$pkgdir/usr/share/applications/yansu.desktop" <<'EOF'
[Desktop Entry]
Name=Yansu
Comment=Proactive AI app builder by Isoform
Exec=/usr/bin/yansu-desktop
Icon=yansu
Type=Application
Categories=Utility;Development;
Terminal=false
StartupNotify=true
StartupWMClass=Yansu
EOF

    install -Dm644 \
        "$srcdir/yansu.png" \
        "$pkgdir/usr/share/icons/hicolor/484x484/apps/yansu.png"

    install -Dm644 /dev/stdin "$pkgdir/usr/share/licenses/$pkgname/LICENSE" <<'EOF'
Yansu is proprietary software by Isoform Inc.

No source license is published with the Linux archive. Use is subject to
upstream terms:
https://isoform.ai/termsandconditions
EOF
}
