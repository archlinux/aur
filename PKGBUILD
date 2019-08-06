# Maintainer: Ange Kevin Amlaman (charveey) <amlamanangekevin at gmail dot com>
# Contributor: NicoHood <archlinux {cat} nicohood {dog} de>
pkgname=typora-bin
pkgver=0.9.73
pkgrel=1
pkgdesc="A minimal Markdown reading & writing app."
arch=('x86_64')
license=('custom: "Copyright (c) 2015 Abner Lee All Rights Reserved."')
conflicts=('typora' 'typora-latest')
provides=('typora')
url="https://typora.io/"
depends=('electron')
optdepends=('noto-fonts-emoji: emoji support')
source=("${pkgname}-${pkgver}.tar.gz::https://typora.io/linux/Typora-linux-x64.tar.gz"
        "typora.desktop"
        "typora.js")
sha512sums=('9f8582c3bc9e5fffe7a8e9ca4d7e6317b28d5209a9afb6b15dd888ad8dbe11a74dc31279f7aa6e016d401e7562e0d518d493a51ca454912a1069a2b008df60c0'
            '83fb1c7d18e14f4b5118e139e4fe6af1ec4c90f4cab4e4e3f076129fbe08458c50b8174fa61929e8b53d8622cad483385814bf0034570c1e68ce75476ae77ebb'
            '976917931c1739c8b463d1b3f0ba53cf7291e258b2018fd67fe2bf6509aabda0d97fa073e127dc96492a41f1c49d7d47898f25be14aa422490c4ee60771642d9')

package() {
    cd "${srcdir}"

    # Do not copy the bundled electron version to reduce package size and
    # use the most up to date electron version.
    mkdir -p "${pkgdir}/opt/typora"
    cp -a "Typora-linux-x64/resources/app/." "${pkgdir}/opt/typora"

    install -Dm644 "typora.desktop" "${pkgdir}/usr/share/applications/typora.desktop"

    for size in 16 32 128 256 512; do
        install -Dm644 "${pkgdir}/opt/typora/asserts/icon/icon_${size}x${size}.png" \
            "${pkgdir}/usr/share/icons/hicolor/${size}x${size}/apps/typora.png"
    done

    # Symlink typora binary which is located in /opt
    mkdir -p "${pkgdir}/usr/bin/"
    ln -sf /opt/typora/typora.js "${pkgdir}/usr/bin/typora"
    install -Dm755 "typora.js" "${pkgdir}/opt/typora/typora.js"

    # Install license
    install -Dm 644 "Typora-linux-x64/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
