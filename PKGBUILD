# This file is part of https://aur.archlinux.org/packages/mkinitcpio-systemd-tool/

pkgdesc='Provisioning tool for systemd in initramfs (systemd-tool)'
pkgname=mkinitcpio-systemd-tool
pkgver=5
pkgrel=1
url="https://github.com/random-archer/$pkgname"
source=("git+${url}.git")
depends=(
    'mkinitcpio' 
    'systemd'
)
optdepends=(
    'cryptsetup: required by initrd-cryptsetup.service' 
    'dropbear:   required by initrd-dropbear.service' 
    'mc:         required by initrd-debug-progs.service' 
)
makedepends=(
    'git'
)
backup=(
    'etc/mkinitcpio.d/crypttab'
    'etc/mkinitcpio.d/fstab'
    'etc/systemd/network/initrd-network.network'
    'etc/systemd/system/initrd-build.sh'
    'etc/systemd/system/initrd-cryptsetup.path'
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
arch=('any')
md5sums=('SKIP')
license=('Apache')

# select proper version depending on marker file presence:
# * create .PKGDEV to use latest development version (from master branch)
# * create .PKGREL to use latest release version (named with release tag vNNN)
# * remove all markes and set pkgver=NNN above to use an existing vNNN release tag (the default)
pkgver() {
    local base=$(cd "$(dirname "${BASH_SOURCE[0]}" )" && pwd)
    local repo="$base/$pkgname" # bare repo location
    local marker_develop="$base/.PKGDEV"
    local marker_release="$base/.PKGREL"
    local head_count=$(git -C "$repo" rev-list --count HEAD)
    local short_hash=$(git -C "$repo" rev-parse --short HEAD)
    local release_info=$(git -C "$repo" describe --long --tags --match "v[0-9]*")
    local release_number=$(echo "$release_info" | sed -r 's/^v([0-9]+)-.*/\1/')
    local release_version="${release_number}" # example: 3
    local develop_version="${release_number}.${head_count}.${short_hash}" # example: 3.25.d069dad
    if [[ -f "$marker_develop" ]] ; then 
        printf "$develop_version" ;
    elif [[ -f "$marker_release" ]] ; then 
        printf "$release_version" ;
    else 
        printf "$pkgver"
    fi
}

# 1.
prepare() {
    local repo="$srcdir/$pkgname" # working repo location
    local version=$(pkgver) # proper version number (release) or string (development)
    local target=$([[ $version =~ ^[0-9]+$ ]] && printf "v$version" || printf "master")
    git -C "$repo" checkout --quiet "$target" # checkout proper version
    git -C "$repo" status # verify working repo change
    true
}

# 2.
build() {
    true
}

# 3.
check() {
    true
}

# 4.
package() {
    
    local hook="systemd-tool"
    
    local source="$srcdir/$pkgname"
    
    local target="$pkgdir/usr/lib/initcpio"
    install -D -m644 "$source/mkinitcpio-hook.sh"       "$target/hooks/$hook"
    install -D -m644 "$source/mkinitcpio-install.sh"    "$target/install/$hook"

    local target="$pkgdir/usr/share/$pkgname"
    install -D -m644 "$source/LICENSE.md"               "${target}/LICENSE.md"
    install -D -m644 "$source/README.md"                "${target}/README.md"

    local target="$pkgdir/etc/mkinitcpio.d/"
    install -D -m644 "$source/crypttab"                 "$target/crypttab"
    install -D -m644 "$source/fstab"                    "$target/fstab"
                
    local target="$pkgdir/etc/systemd/network"
    local path= unit=
    for path in $(ls "$source" | grep -E "[.](network)$") ; do
        unit=$(basename $path)
        install -D -m644 "$source/$unit"  "$target/$unit"
    done

    local target="$pkgdir/etc/systemd/system"
    local path= unit=
    for path in $(ls "$source" | grep -E "[.](path|service|target)$") ; do
        unit=$(basename $path)
        install -D -m644 "$source/$unit"  "$target/$unit"
    done
    install -D -m644 "$source/initrd-build.sh"              "$target/initrd-build.sh"
    install -D -m644 "$source/initrd-shell.sh"              "$target/initrd-shell.sh"

}
