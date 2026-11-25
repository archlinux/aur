# Maintainer: xmp360 <1666451428@qq.com>
# Maintainer: Anysets <anysets@qq.com>
# Maintainer: shenmo <shenmo@spark-app.store>

pkgname=amber-package-manager
pkgver=2.0.1
pkgrel=1
pkgdesc='bwrap wrapper for install and running debs inside a Amber-PM container'
arch=('x86_64' 'aarch64')
url='https://gitee.com/amber-ce/amber-pm/'
license=('AGPL-3.0-only')
depends=(
    'aria2'
    'bash'
    'bubblewrap'
    'coreutils'
    'curl'
    'fuse-overlayfs'
    'gnupg'
    'libnotify'
    'polkit'
    'procps-ng'
    'systemd'
    'tar'
    'xdg-user-dirs'
    'xz'
    'zenity'
    'zstd'
)
optdepends=(
    'bash-completion: Bash completion for apm'
    'busybox: provide additional utilities when converting Debian packages'
    'dpkg: convert Debian packages and build APM add-ons'
    'fakeroot: build converted packages and APM add-ons'
)
conflicts=('ace-host-integration')
install=amber-package-manager.install

_pkgdlver=v2.0.0

source=("$pkgname-$pkgver-$pkgrel.tar.gz::https://cdn09022024.gitlink.org.cn/api/v1/repos/shenmo7192/amber-pm/archive/${_pkgdlver}.tar.gz")
sha256sums=('afb8012306ea8e4a58c10f7b98a11acebd3b04980ad29e87dfdfd268dc6685cb')

build() {
    cd "$srcdir/amber-pm" || return 1
    bash build.sh "$srcdir/amber-pm/src"
}

package() {
    cd "$srcdir/amber-pm/src" || return 1
    cp -a --no-preserve=ownership etc usr var "$pkgdir/" || return 1

    # 固定目录和 AppArmor 链接入包，由 pacman 随包移除。
    install -dm755 "$pkgdir/var/lib/apm/apm-conf" "$pkgdir/etc/apparmor.d/disable"
    ln -s ../bwrap-userns-restrict "$pkgdir/etc/apparmor.d/disable/bwrap-userns-restrict"

    # 在没有对应内核参数的系统上，允许 systemd-sysctl 跳过该项。
    sed -i 's/^kernel\./-kernel./' "$pkgdir/usr/lib/sysctl.d/apm.conf"

    # 保留脚本的执行位，配置、单元文件和静态资源只需要可读。
    cd "$pkgdir" || return 1
    find . -type d -exec chmod 755 {} +
    find . -type f -exec chmod go-w {} +
    chmod 644 etc/apparmor.d/apm etc/apt/sources.list.d/apm.list \
        etc/apt/trusted.gpg.d/apm.gpg usr/lib/sysctl.d/apm.conf \
        usr/lib/systemd/system/*.service usr/lib/systemd/system/*.timer \
        usr/share/bash-completion/completions/apm usr/share/icons/apm.png \
        usr/share/polkit-1/actions/store.spark-app.apm-uninstaller.policy

}
