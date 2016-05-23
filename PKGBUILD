pkgname=initrd-dropbear
pkgver=r58.2aaf832
pkgrel=1
pkgdesc="Provider of systemd initramfs dropbear ssh server"
arch=('any')
license=('Apache')
depends=('systemd' 'dropbear')
makedepends=('git')
install=install.sh
url="https://aur.archlinux.org/cgit/aur.git/tree/?h=${pkgname}"
source=("${pkgname}::git+https://aur.archlinux.org/${pkgname}.git")
md5sums=('SKIP')
backup=()

pkgver() {
    # version update only in presense of user provided marker
    local origin=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    local marker="$origin/.PKGVER"
    if [ -e "$marker" ] ; then
        local count=$(git -C $origin rev-list --count HEAD)
        local short=$(git -C $origin rev-parse --short HEAD)
        printf "r%s.%s" "$count" "$short"
    else
        printf "%s" "$pkgver"
    fi 
}

prepare() {
    true
}

build() {
    true
}

check() {
    true
}

package() {
    
    local source="$srcdir/$pkgname"

    local target="$pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$pkgname"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$pkgname"
  
    local target="$pkgdir/usr/share/mkinitcpio/$pkgname"
    local file_list="readme.md shell.sh *.service *.network"
    local file
    for file in $(cd $source && ls $file_list) ; do
        install -D -m644 "$source/$file"                "$target/$file"
    done
    
}
