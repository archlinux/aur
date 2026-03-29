# Maintainer: xmp360 <1666451428@qq.com>
# Maintainer: Anysets <anysets@qq.com>
# Maintainer: shenmo <shenmo@spark-app.store>

pkgname=amber-package-manager
pkgver=1.2.3
pkgrel=1
pkgdesc="bwrap wrapper for install and running debs inside a Amber-PM container"
arch=('x86_64')
url="https://gitee.com/amber-ce/amber-pm/"
license=('AGPL-3.0')
depends=('bubblewrap' 'flatpak' 'polkit' 'systemd' 'procps-ng' 'coreutils' 'fuse-overlayfs')
optdepends=('dpkg: Enable amber-pm-convert (A tool to convert Debian packages to Amber-PM packages)')
conflicts=('ace-host-integration')
# provides=('amber-package-manager')

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm/repository/archive/${pkgver}.tar.gz")
sha256sums=('4c3c158a341a873737d829a37952cb694759915ac7b7b653970bff8065810c6d')

install=amber-package-manager.install
build() {
    cd "$srcdir/amber-pm-${pkgver}"
    
    # 执行构建脚本，并传递src目录路径
    bash build.sh "$srcdir/amber-pm-${pkgver}/src"
    
    # 如果build.sh没有正确执行，可以尝试以下替代方案：
    # bash build.sh
    # 或者直接执行构建命令
}
package() {

    cd "$srcdir/amber-pm-${pkgver}/src"
    
    install -d "$pkgdir/var/lib/apm"
    cp -r etc "$pkgdir/"
    cp -r usr "$pkgdir/"
    cp -r var "$pkgdir/"

    cd "$pkgdir/"
    chmod 755 -R .
    
    
    find "$pkgdir" -type d -exec chmod 755 {} \;
    
    find "$pkgdir/etc/profile.d" -name "*.sh" -exec chmod 755 {} \;
    find "$pkgdir/etc/X11/Xsession.d" -name "*" -exec chmod 755 {} \;
    find "$pkgdir/usr/bin" -type f -exec chmod 755 {} \;
    find "$pkgdir/var/lib/apm/apm/files/bin" -type f -exec chmod 755 {} \;
    find "$pkgdir/var/lib/apm/apm/files/amber-ce-tools/bin-override" -type f -exec chmod 755 {} \;
    
    find "$pkgdir/usr/lib/systemd" -name "*.service" -exec chmod 644 {} \;
    find "$pkgdir/usr/lib/systemd/user-environment-generators" -type f -exec chmod 755 {} \;
    
    if [ -d "$pkgdir/usr/share/bash-completion/completions" ]; then
        chmod 644 "$pkgdir/usr/share/bash-completion/completions/"*
    fi
}
