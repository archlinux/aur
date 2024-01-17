# Maintainer: Shae VanCleave
# PKGBUILD somewhat copied from copygirl's vintagestory AUR package: https://aur.archlinux.org/packages/vintagestory

# Metadata
#  Info
pkgname=vintagestory-server
pkgdesc="An in-development indie sandbox game about innovation and exploration--server package"
license=('custom')
#  Versioning
_release=stable # the name of the version's release type ("stable", "unstable", "pre")
_pkgver=1.18.15
pkgver=${_pkgver//-/_} # allows usage of versions with hyphens in _pkgver
pkgrel=1
#  Requirements
depends=('mono')
optdepends=('vintagestory-servermgr: manage the server, provides systemd unit to run server')
arch=('x86' 'x86_64')
#  Source
url='https://www.vintagestory.at/'
license=('custom')
source=("https://cdn.vintagestory.at/gamefiles/$_release/vs_server_linux-x64_$_pkgver.tar.gz")
#       "https://account.vintagestory.at/files/$_release/vs_server_linux-x64_$_pkgver.tar.gz" (alternative source)
md5sums=('ad6be6ccd9a521f36fd39c447c31738d')

# Installation
prepare() {
    # Create symbolic links for any assets (excluding fonts) containing non-lowercase letters
    find assets/ -not -path "*/fonts/*" -regex ".*/.*[A-Z].*" | while read -r file; do
        local filename="$(basename -- "$file")"
        ln -sf "$filename" "${file%/*}"/"${filename,,}"
    done
}

package() {
    mkdir -p "$pkgdir"/usr/share/"$pkgname"/
    mv * "$pkgdir"/usr/share/"$pkgname"/
    unlink "$pkgdir"/usr/share/"$pkgname"/vs_server_linux-x64_"$_pkgver".tar.gz
}