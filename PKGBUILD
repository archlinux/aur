# Maintainer: Michael Dobachesky <mgdobachesky@outlook.com>

_pkg_name="maint"
_install_dir="opt/$_pkg_name"
_symlink_dir="usr/bin"

pkgname="$_pkg_name"
pkgver=2.5
pkgrel=1
pkgdesc="A utility to automatically perform Arch Linux system maintenance"
arch=('x86_64')
url="https://gitlab.com/mgdobachesky/ArchSystemMaintenance"
license=('GPLv3')
depends=(
    'awk'
    'git'
    'pacman-contrib'
    'pacutils'
    'python'
    'python-dateutil'
    'python-xmltodict'
    'reflector'
    'rsync'
    'sed'
    'sudo'
    'vim'
    'dialog'
)
optdepends=(
    'nano'
)
backup=("$_install_dir/settings.sh")

source=("https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/pkg/$pkgname-$pkgver.tar.xz")

md5sums=('ea0c7ed793689097dec8fe0097a437cb')

prepare() {
    umask 022
    mkdir -p "$_install_dir/ui" "$_install_dir/other"
    mkdir -p "$_symlink_dir"
}

build() {
    install -m 755 "$srcdir/$pkgname/other/archNews.py" "$_install_dir/other"
    install -m 755 "$srcdir/$pkgname/ui/cli.sh" "$_install_dir/ui"
    install -m 755 "$srcdir/$pkgname/ui/dialog.sh" "$_install_dir/ui"
    install -m 755 "$srcdir/$pkgname/logic.sh" "$_install_dir"
    install -m 755 "$srcdir/$pkgname/menu.sh" "$_install_dir"
    install -m 755 "$srcdir/$pkgname/run.sh" "$_install_dir"
    install -m 755 "$srcdir/$pkgname/settings.sh" "$_install_dir"
}

package() {
    _install_base=$(echo "$_install_dir" | cut -d '/' -f 1)
    _symlink_base=$(echo "$_symlink_dir" | cut -d '/' -f 1)

    cp -r "$_install_base" "$pkgdir"
    cp -r "$_symlink_base" "$pkgdir"
    ln -s "/$_install_dir/run.sh" "$pkgdir/$_symlink_dir/$pkgname"
}
