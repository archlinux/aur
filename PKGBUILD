pkgname=mihomo-purity-git
_pkgname=${pkgname%-git}
pkgver=1.7.0.r0.g53692c3
pkgrel=1
pkgdesc="A purer mihomo party fork"
arch=('x86_64' 'aarch64')
url="https://github.com/mihomo-purity/mihomo-purity"
license=('GPL3')
conflicts=("$_pkgname" "$_pkgname-bin" "$_pkgname-electron" "$_pkgname-electron-bin")
depends=('gtk3' 'libnotify' 'nss' 'libxss' 'libxtst' 'xdg-utils' 'at-spi2-core' 'util-linux-libs')
optdepends=('libappindicator-gtk3: Allow mihomo-purity to extend a menu via Ayatana indicators in Unity, KDE or Systray (GTK+ 3 library).')
makedepends=('nodejs' 'pnpm' 'jq' 'libxcrypt-compat')
install=$_pkgname.install
source=("${_pkgname}.sh" "git+$url.git")
sha256sums=("e390f9bbce3ae680ab9413f83c69e22c193b43a506439253bdf1e71a0050c938" "SKIP")
options=('!lto')

pkgver() {
    cd $srcdir/${_pkgname}
    ( set -o pipefail
        git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' | tr -d 'v' ||
        printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
    )
}

prepare(){
    cd $srcdir/${_pkgname}
    sed -i "s/productName: Mihomo Purity/productName: mihomo-purity/" electron-builder.yml
    pnpm install
}

build(){
    cd $srcdir/${_pkgname}
    pnpm build:linux deb
}

package() {
	cd $srcdir/${_pkgname}/dist
    bsdtar -xf mihomo-purity-linux-$(jq '.version' $srcdir/${_pkgname}/package.json | tr -d 'v"')*.deb
    bsdtar -xf data.tar.xz -C "${pkgdir}/"
    chmod +x ${pkgdir}/opt/mihomo-purity/mihomo-purity
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo
    chmod +sx ${pkgdir}/opt/mihomo-purity/resources/sidecar/mihomo-alpha
    install -Dm755 "${srcdir}/../${_pkgname}.sh" "${pkgdir}/usr/bin/${_pkgname}"
    sed -i '3s!/opt/mihomo-purity/mihomo-purity!mihomo-purity!' "${pkgdir}/usr/share/applications/${_pkgname}.desktop"

    chown -R root:root ${pkgdir}
}
