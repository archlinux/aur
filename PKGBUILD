pkgname=mkinitcpio-systemd-tool
pkgver=r11.e9adfb7
pkgrel=1
pkgdesc='Utilities for systemd in initramfs (systemd-tool)'
arch=('any')
license=('Apache')
depends=('systemd' 'dropbear')
makedepends=('git')
install=install.sh
url="https://aur.archlinux.org/cgit/aur.git/tree/?h=${pkgname}"
source=("${pkgname}::git+https://aur.archlinux.org/${pkgname}.git")
md5sums=('SKIP')
backup=(
    'etc/mkinitcpio.d/shell.sh'
    'etc/systemd/network/initrd-network.network'
    'etc/systemd/system/initrd-debug-progs.service'
    'etc/systemd/system/initrd-debug-shell.service'
    'etc/systemd/system/initrd-dropbear.service'
    'etc/systemd/system/initrd-network.service'
    'etc/systemd/system/initrd-user-root.service'
)
conflicts=(
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)

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
    
    local hook="systemd-tool"
    
    local source="$srcdir/$pkgname"
    
    local target="$pkgdir/usr/share/$pkgname"
    install -D -m644 "$source/LICENSE"                  "${target}/LICENSE"
    install -D -m644 "$source/readme.md"                "${target}/readme.md"

    local target="$pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$hook"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$hook"
  
    local target="$pkgdir/etc/mkinitcpio.d/"
    install -D -m644 "$source/shell.sh"                 "$target/shell.sh"
    
    local target="$pkgdir/etc/systemd/network"
    install -D -m644 "$source/initrd-network.network"    "$target/initrd-network.network"

    local target="$pkgdir/etc/systemd/system"
    install -D -m644 "$source/initrd-debug-progs.service"   "$target/initrd-debug-progs.service"
    install -D -m644 "$source/initrd-debug-shell.service"   "$target/initrd-debug-shell.service"
    install -D -m644 "$source/initrd-network.service"       "$target/initrd-network.service"
    install -D -m644 "$source/initrd-dropbear.service"      "$target/initrd-dropbear.service"
    install -D -m644 "$source/initrd-user-root.service"     "$target/initrd-user-root.service"
                
}
