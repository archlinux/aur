# Maintainer: xmp360 <1666451428@qq.com>
# Maintainer: Anysets <anysets@qq.com>
# Maintainer: shenmo <shenmo@spark-app.store>

pkgname=amber-package-manager
pkgver=1.3.4
pkgrel=1
pkgdesc="bwrap wrapper for install and running debs inside a Amber-PM container"
arch=('x86_64' 'aarch64')
url="https://gitee.com/amber-ce/amber-pm/"
license=('AGPL-3.0')
depends=('bubblewrap' 'flatpak' 'polkit' 'systemd' 'procps-ng' 'coreutils' 'fuse-overlayfs')
optdepends=('dpkg: Enable amber-pm-convert (A tool to convert Debian packages to Amber-PM packages)')
conflicts=('ace-host-integration' 'amber-pm-store')
# provides=('amber-package-manager')

source=("$pkgname-$pkgver.tar.gz::https://gitee.com/amber-ce/amber-pm/repository/archive/${pkgver}.tar.gz")
source_aarch64=("https://gitee.com/amber-ce/amber-pm/releases/download/1.2.3/ace-env-arm64.tar.xz")
sha256sums=('d0689535e424affef40a47678a38dc12303c52ab7591d6c7debc549e7687b4b7')
sha256sums_aarch64=('b99a96854f8fcba405d46b8a749b07edf584e6119f8bf9b131dfcaaa9b4ad552')

install=amber-package-manager.install
build() {
    if [[ "$CARCH" == "aarch64" ]]; then
        cp -f "$srcdir/ace-env-arm64.tar.xz" "$srcdir/amber-pm-${pkgver}/src/var/lib/apm/apm/files/ace-env.tar.xz"
    fi

    cd "$srcdir/amber-pm-${pkgver}"
    
    bash build.sh "$srcdir/amber-pm-${pkgver}/src"
}
package() {

    cd "$srcdir/amber-pm-${pkgver}/src"
    
    install -d "$pkgdir/var/lib/apm"
    cp -a etc "$pkgdir/"
    cp -a usr "$pkgdir/"
    cp -a var "$pkgdir/"

    # rm -rf "${pkgdir}/usr/share/fish"

    # cd "$pkgdir/"
    # chmod 755 -R .
    
    
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
