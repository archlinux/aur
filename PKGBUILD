# Maintainer: MaoYaoTang <maoyaotang@163.com>

pkgname=arch-pkg-installer
pkgver=1.0.0
pkgrel=1
pkgdesc="图形化Arch本地包安装器，类似gdebi，基于paru自动解决依赖"
arch=('x86_64')
url="https://github.com/maoyaotang12/arch-pkg-installer"
license=('MIT')
depends=(
    'qt6-base'
    'paru'
    'polkit'
    'shared-mime-info'
    'desktop-file-utils'
)
makedepends=(
    'git'
    'base-devel'
)
source=("git+$url.git")
sha256sums=('SKIP')

build() {
    cd "${srcdir}/${pkgname}"
    unset CFLAGS CXXFLAGS LDFLAGS
    qmake6
    make
}

package() {
    cd "${srcdir}/${pkgname}"
    install -Dm755 archgdebi "${pkgdir}/usr/bin/${pkgname}"

    # 桌面图标（可选，如果你准备加图标文件）
    install -Dm644 arch-pkg-installer.svg "${pkgdir}/usr/share/icons/hicolor/scalable/${pkgname}.svg"
    install -Dm644 ${pkgname}.desktop "${pkgdir}/usr/share/applications/${pkgname}.desktop"
    install -Dm644 archgdebi-x-alpm.xml "${pkgdir}/usr/share/mime/packages/archgdebi-x-alpm.xml"
    install -vDm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}

post_install() {
    update-desktop-database -q
    update-mime-database /usr/share/mime
}
post_upgrade() {
    post_install
}
post_remove() {
    update-desktop-database -q
    update-mime-database /usr/share/mime
}
