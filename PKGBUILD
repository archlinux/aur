# Maintainer: Michael Dobachesky <mgdobachesky@outlook.com>

_pkg_name="maint"
_install_dir="opt/$_pkg_name"
_symlink_dir="usr/bin"

pkgname="$_pkg_name"
pkgver=2.7
pkgrel=1
pkgdesc="A utility to automatically perform Arch Linux system maintenance"
arch=('x86_64')
url="https://gitlab.com/mgdobachesky/ArchSystemMaintenance"
license=('GPLv3')
depends=(
    'awk'
    'git'
    'nano'
    'pacman-contrib'
    'pacutils'
    'python'
    'python-dateutil'
    'python-xmltodict'
    'reflector'
    'rsync'
    'sed'
    'sudo'
    'dialog'
)
optdepends=(
    'emacs'
    'vim'
)
backup=("$_install_dir/settings.sh")

source=("https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/pkg/$pkgname-$pkgver.tar.xz")

md5sums=('5abef3b8044a0d6ac93ab9676b33b101')

prepare() {
    umask 022
    mkdir -p "$_install_dir/view" "$_install_dir/util" "$_install_dir/service"
    mkdir -p "$_symlink_dir"
}

build() {
    install -m 755 "$srcdir/$pkgname/util/arch_news.py" "$_install_dir/util"
    install -m 755 "$srcdir/$pkgname/view/cli.sh" "$_install_dir/view"
    install -m 755 "$srcdir/$pkgname/view/dialog.sh" "$_install_dir/view"
    install -m 755 "$srcdir/$pkgname/service/news.sh" "$_install_dir/service"
    install -m 755 "$srcdir/$pkgname/service/upgrade.sh" "$_install_dir/service"
    install -m 755 "$srcdir/$pkgname/service/cleanup.sh" "$_install_dir/service"
    install -m 755 "$srcdir/$pkgname/service/errors.sh" "$_install_dir/service"
    install -m 755 "$srcdir/$pkgname/service/backup.sh" "$_install_dir/service"
    install -m 755 "$srcdir/$pkgname/service/settings.sh" "$_install_dir/service"
    install -m 755 "$srcdir/$pkgname/main.sh" "$_install_dir"
    install -m 755 "$srcdir/$pkgname/controller.sh" "$_install_dir"
    install -m 755 "$srcdir/$pkgname/settings.sh" "$_install_dir"
}

package() {
    _install_base=$(echo "$_install_dir" | cut -d '/' -f 1)
    _symlink_base=$(echo "$_symlink_dir" | cut -d '/' -f 1)

    cp -r "$_install_base" "$pkgdir"
    cp -r "$_symlink_base" "$pkgdir"
    ln -s "/$_install_dir/main.sh" "$pkgdir/$_symlink_dir/$pkgname"
}
