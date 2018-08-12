# Maintainer: Michael Dobachesky <mgdobachesky@outlook.com>

pkgname=maint
pkgver=1.0.0
pkgrel=1
pkgdesc="A utility to automatically perform Arch Linux system maintenance"
arch=('x86_64')
url="https://gitlab.com/mgdobachesky/ArchSystemMaintenance"
license=('GPLv3')
depends=('python' 
         'python-xmltodict' 
         'python-dateutil' 
         'sed' 
         'awk' 
         'reflector' 
         'rmlint'
         'pacman-contrib' 
         'pacutils'
         'vim')

source=("https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/run.sh"
        "https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/archNews.py"
        "https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/settings.sh")

md5sums=('fcac288b1798304a273f9ac27e03be16'
         'af05a3013904f4e47822164bfece1e3e'
         '3b8dfc54bac5b356e20372f9f5e9d0c0')

install_dir="opt/$pkgname"
symlink_dir="usr/bin"

build() {
    umask 022
    mkdir -p "$srcdir/$install_dir"
    mkdir -p "$srcdir/$symlink_dir"

    sed -i "s|{{PKG_PATH}}|/${install_dir}|" "$srcdir/run.sh"

    install -m 755 "$srcdir/run.sh" $install_dir
    install -m 755 "$srcdir/archNews.py" "$install_dir"
    install -m 755 "$srcdir/settings.sh" $install_dir
}

package() {
    install_base=$(echo "$install_dir" | cut -d '/' -f 1)
    symlink_base=$(echo "$symlink_dir" | cut -d '/' -f 1)

    cp -r "$srcdir/$install_base" "$pkgdir"
    cp -r "$srcdir/$symlink_base" "$pkgdir"
    ln -s "/$install_dir/run.sh" "$pkgdir/$symlink_dir/$pkgname"
}
