# Maintainer: Fangru Shao <matrixc7p@gmail.com>
_pkgname=ant-browser
pkgname="${_pkgname}-bin"
pkgver=1.9.3
_tag=v1.9.3
pkgrel=1
pkgdesc="Multi-profile anti-detect browser launcher with proxy management"
arch=('x86_64')
url="https://github.com/black-ant/Ant-Browser"
license=('custom')
depends=(
    'gdk-pixbuf2'
    'glibc'
    'gtk3'
    'hicolor-icon-theme'
    'libsoup3'
    'webkit2gtk-4.1'
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
options=('!strip' '!debug')

# 上游自 1.9.x 起不再发布 ant-browser-linux-amd64.zip（也不再内嵌 deb），
# 直接提供 ant-browser_<ver>_amd64.deb。这里直接取 deb：它带 .desktop、
# 全套 hicolor 图标和 AppStream metainfo，而 tar.gz 只有应用本体；
# 且 deb 的 data.tar.zst 顶层就是 opt/ 和 usr/share/，正好对应 $pkgdir。
source=("ant-browser_${pkgver}_amd64.deb::https://github.com/black-ant/Ant-Browser/releases/download/${_tag}/ant-browser_${pkgver}_amd64.deb")
sha256sums=('cadba6c5bfcf335ee1c2b52d8d9c38ce0372cab27015d0c68051bda643d2d229')

prepare() {
    # makepkg 通常会把 .deb 当普通归档解开，data.tar.zst 已在 $srcdir；这里再显式
    # 抽一次，使构建不依赖该自动解包行为。两种情况下产物都一样。
    bsdtar -xf "ant-browser_${pkgver}_amd64.deb" data.tar.zst
}

package() {
    # Extract application tree
    bsdtar -xf data.tar.zst --no-same-owner -C "${pkgdir}/"

    # Fix executable permissions for binaries
    chmod 755 "${pkgdir}/opt/ant-browser/ant-chrome"
    chmod 755 "${pkgdir}/opt/ant-browser/bin/"*

    # Create symlinks in /usr/bin
    install -dm755 "${pkgdir}/usr/bin"
    ln -sf /opt/ant-browser/ant-chrome "${pkgdir}/usr/bin/ant-chrome"
    ln -sf /opt/ant-browser/ant-chrome "${pkgdir}/usr/bin/${_pkgname}"
}
