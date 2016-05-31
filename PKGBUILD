# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

pkgname=mkinitcpio-systemd-tool
pkgver=1.r4.g04bda1f
pkgrel=1
pkgdesc='Provisioning tool for systemd in initramfs (systemd-tool)'
arch=('any')
license=('Apache')
depends=('mkinitcpio' 'systemd')
optdepends=(
    'cryptsetup: required by initrd-cryptsetup.service' 
    'dropbear: required by initrd-dropbear.service' 
    'mc: required by initrd-debug-progs.service' 
)
makedepends=('git')
install='INSTALL.sh'
url="https://github.com/random-archer/${pkgname}"
source=("git+https://github.com/random-archer/${pkgname}.git")
md5sums=('SKIP')
backup=(
    'etc/mkinitcpio.d/crypttab'
    'etc/systemd/network/initrd-network.network'
    'etc/systemd/system/initrd-build.sh'
    'etc/systemd/system/initrd-cryptsetup.service'
    'etc/systemd/system/initrd-debug-progs.service'
    'etc/systemd/system/initrd-debug-shell.service'
    'etc/systemd/system/initrd-dropbear.service'
    'etc/systemd/system/initrd-emergency.service'
    'etc/systemd/system/initrd-network.service'
    'etc/systemd/system/initrd-shell.service'
    'etc/systemd/system/initrd-shell.sh'
)
conflicts=(
    'mkinitcpio-dropbear'
    'mkinitcpio-tinyssh'
)

# select version depending on marker file presence
pkgver() {
    local base=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
    local repo="$base/$pkgname"
    local marker="$base/.PKGDEV"
    if [[ -f $marker ]] ; then
        pkgver_develop
    else
        pkgver_release
    fi
}

# use development version
pkgver_develop() {
    local count=$(git -C $repo rev-list --count HEAD)
    local short=$(git -C $repo rev-parse --short HEAD)
    [[ $count && $short ]] || \
        { echo "can not make development version [$count] [$short]" ; exit 1; }
    printf "r%s.%s" "$count" "$short"
}

# user released version
pkgver_release() {
    local release_tag=$(git -C $repo describe --long --tags --match "v[0-9]*")
    local pkg_version=$(echo "$release_tag" | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g')
    [[ $release_tag && $pkg_version ]] || \
        { echo "can not make production version [$release_tag] [$pkg_version]" ; exit 1; }
    printf "%s" "$pkg_version"
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
    install -D -m644 "$source/LICENSE.md"               "${target}/LICENSE.md"
    install -D -m644 "$source/README.md"                "${target}/README.md"

    local target="$pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$hook"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$hook"
  
    local target="$pkgdir/etc/mkinitcpio.d/"
    install -D -m644 "$source/crypttab"                 "$target/crypttab"
        
    local target="$pkgdir/etc/systemd/network"
    install -D -m644 "$source/initrd-network.network"    "$target/initrd-network.network"

    local target="$pkgdir/etc/systemd/system"
    install -D -m644 "$source/initrd-build.sh"              "$target/initrd-build.sh"
    install -D -m644 "$source/initrd-cryptsetup.service"    "$target/initrd-cryptsetup.service"
    install -D -m644 "$source/initrd-debug-progs.service"   "$target/initrd-debug-progs.service"
    install -D -m644 "$source/initrd-debug-shell.service"   "$target/initrd-debug-shell.service"
    install -D -m644 "$source/initrd-network.service"       "$target/initrd-network.service"
    install -D -m644 "$source/initrd-dropbear.service"      "$target/initrd-dropbear.service"
    install -D -m644 "$source/initrd-emergency.service"     "$target/initrd-emergency.service"
    install -D -m644 "$source/initrd-shell.service"         "$target/initrd-shell.service"
    install -D -m755 "$source/initrd-shell.sh"              "$target/initrd-shell.sh"
                                                                                                                                
}
