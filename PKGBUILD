# Maintainer: Michael Dobachesky <mgdobachesky@outlook.com>

pkgname=maint
pkgver=1.0.0
pkgrel=2
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

source=("https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/run.sh"
        "https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/archNews.py"
        "https://gitlab.com/mgdobachesky/ArchSystemMaintenance/raw/master/$pkgname-$pkgver/settings.sh")

md5sums=('f1379c947704d22c19dfe348a297ddc9'
         'af05a3013904f4e47822164bfece1e3e'
         'e941155c4ab8fb7170711086752137a5')

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
