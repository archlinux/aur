# Maintainer: Mark Ignacio <mark@ignacio.io>
# Contributor: BlackIkeEagle <ike DOT devolder AT gmail DOT com>
# Contributor: TZ86

pkgname=vivaldi-multiarch-bin
_rpmversion=6.1.3035.204-1
pkgver=6.1.3035.204
pkgrel=1
pkgdesc='An advanced browser made with the power user in mind. Includes all supported architectures.'
url="https://vivaldi.com"
options=(!strip !zipman)
license=('custom')
conflicts=('vivaldi')
arch=('x86_64' 'aarch64' 'armv7h')
depends=('gtk3' 'libcups' 'nss' 'alsa-lib' 'libxss' 'ttf-font' 'desktop-file-utils' 'shared-mime-info' 'hicolor-icon-theme')
makedepends=('w3m')
optdepends=(
    'vivaldi-ffmpeg-codecs: playback of proprietary video/audio'
    'libnotify: native notifications'
)

source=('0001-add-support-for-user-flags.patch')
source_x86_64=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.x86_64.rpm")
source_aarch64=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.aarch64.rpm")
source_armv7h=("https://downloads.vivaldi.com/stable/vivaldi-stable-${_rpmversion}.armv7hl.rpm")

sha512sums=('334db2056114fdbf07407b1cee24284f019df7a15acd711ed016bab1a1ab211abf3884ed848f3496486e7c78056108ccf1e88547e22b787bc4f548c6785f64d2')
sha512sums_x86_64=('a8b8392e026ea8d95e7ac7392e6e82dc218b2cc4e57e01206392ae3f8bfdd9497a9a12ca40d1471e77d32d6b3830b887049e0c7e6fae7fb7ac8821132ac62154')
sha512sums_aarch64=('47fbcf014a563430c1ca9a90fd23eb8a83e44f702d5ff59ce4fa22485de4540a40a477d0a3d49c59978e9b5458dc5570e1cf4dcee374fd0c7a8cffcc109d126b')
sha512sums_armv7h=('4609c7c4ff125155bc30c91167feabcca79838b3e2b2c647a583020ef16b7f9ccef20a3d71e7533633df0fa2bbb552427b907dd9fafb8488e24d65fc22f03ce4')

package() {
    cp --parents -a {opt,usr/bin,usr/share} "$pkgdir"

    # add support for ~/.config/vivaldi-stable.conf
    patch -p1 -i "$srcdir/0001-add-support-for-user-flags.patch" \
        "$pkgdir/opt/vivaldi/vivaldi"

    # suid sandbox
    chmod 4755 "$pkgdir/opt/vivaldi/vivaldi-sandbox"

    # make /usr/bin/vivaldi-stable available
    binf="$pkgdir/usr/bin/vivaldi-stable"
    if [[ ! -e "$binf" ]] && [[ ! -f "$binf" ]] && [[ ! -L "$binf" ]]; then
        install -dm755 "$pkgdir/usr/bin"
        ln -s /opt/vivaldi/vivaldi "$binf"
    fi

    # install icons
    for res in 16 22 24 32 48 64 128 256; do
        install -Dm644 "$pkgdir/opt/vivaldi/product_logo_${res}.png" \
            "$pkgdir/usr/share/icons/hicolor/${res}x${res}/apps/vivaldi.png"
    done

    # install global icon in case hicolor theme gets bypassed
    install -Dm644 "$pkgdir/opt/vivaldi/product_logo_256.png" \
        "$pkgdir/usr/share/pixmaps/vivaldi.png"

    # license
    install -dm755 "$pkgdir/usr/share/licenses/vivaldi"
    w3m -dump "$pkgdir/opt/vivaldi/LICENSE.html" \
        | head -n 5 \
        > "$pkgdir/usr/share/licenses/vivaldi/license.txt"
}