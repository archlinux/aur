# Maintainer: nekoside <qwqnekoo@gmail.com>

pkgname=sylvakru
pkgver=3.2.1
pkgrel=1
pkgdesc="A cross-platform music player for local and self-hosted libraries, built with Flutter"
arch=('x86_64')
url="https://github.com/AfalpHy/sylvakru"
license=('Apache-2.0')
_commit=a6970aae6904ecb4b03ee2bed8a3074dddd7955d
_flutter=3.44.0
_pkgsrc=${pkgname}
source=("git+https://github.com/AfalpHy/sylvakru.git#commit=${_commit}")
sha256sums=('SKIP')
makedepends=(
    'git'
    'fvm'
    'cmake'
    'ninja'
    'clang'
    'patchelf'
)

depends=(
    'gtk3'
    'fontconfig'
    'pango'
    'libayatana-appindicator'
    'at-spi2-core'
    'cairo'
    'glibc'
    'glib2'
    'libepoxy'
    'libstdc++'
    'libgcc'
)

options=('!debug' 'strip')

build() {
    cd ${_pkgsrc}
    fvm install ${_flutter}
    fvm use ${_flutter}
    fvm flutter pub get
    fvm flutter build linux --release
}

package() {
    install -d ${pkgdir}/opt/${pkgname}
    cp -ra ${srcdir}/${pkgname}/build/linux/x64/release/bundle/. ${pkgdir}/opt/${pkgname}
    patchelf --set-rpath '$ORIGIN/lib' "$pkgdir/opt/$pkgname/$pkgname"
    find "${pkgdir}/opt/$pkgname/lib" -name '*.so' -exec patchelf --set-rpath '$ORIGIN' {} \;
    install -d ${pkgdir}/usr/bin
    ln -s /opt/${pkgname}/${pkgname} ${pkgdir}/usr/bin/${pkgname}

    # launcher
    install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${pkgname}.desktop" << EOF
[Desktop Entry]
Name=Sylvakru
Comment=${pkgdesc}
Exec=/usr/bin/${pkgname}
Icon=/opt/${pkgname}/data/flutter_assets/assets/app_icon.png
Type=Application
Categories=AudioVideo;Audio;Video;Player;TV;
Terminal=false
EOF
}
