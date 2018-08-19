# Maintainer: Michael Dobachesky <mgdobachesky@outlook.com>
_pkg_name="maint"
_install_dir="opt/$_pkg_name"
_symlink_dir="usr/bin"

pkgname="$_pkg_name"
pkgver=1.0
pkgrel=4
pkgdesc="A utility to automatically perform Arch Linux system maintenance"
arch=('x86_64')
url="https://gitlab.com/mgdobachesky/ArchSystemMaintenance"
license=('GPLv3')
depends=('python' 
         'python-xmltodict' 
         'python-dateutil' 
         'sed' 
         'awk'
         'duplicity'
         'reflector' 
         'rmlint'
         'pacman-contrib' 
         'pacutils'
         'vim')
backup=("$_install_dir/settings.sh")

source=("https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/run.sh"
        "https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/archNews.py"
        "https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/settings.sh")

md5sums=('83610a118a70d9563b3c6e87b157631f'
         'af05a3013904f4e47822164bfece1e3e'
         'be5b0ba37b5a140d2f315b4c4ef6d52e')

build() {
    umask 022
    mkdir -p "$srcdir/$_install_dir"
    mkdir -p "$srcdir/$_symlink_dir"

    sed -i "s|{{PKG_PATH}}|/${_install_dir}|" "$srcdir/run.sh"

    install -m 755 "$srcdir/run.sh" $_install_dir
    install -m 755 "$srcdir/archNews.py" "$_install_dir"
    install -m 755 "$srcdir/settings.sh" $_install_dir
}

package() {
    install_base=$(echo "$_install_dir" | cut -d '/' -f 1)
    symlink_base=$(echo "$_symlink_dir" | cut -d '/' -f 1)

    cp -r "$srcdir/$install_base" "$pkgdir"
    cp -r "$srcdir/$symlink_base" "$pkgdir"
    ln -s "/$_install_dir/run.sh" "$pkgdir/$_symlink_dir/$pkgname"
}
