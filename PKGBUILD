# Maintainer: Jason Nader <jason.nader SYMBOL protonmail dot com>

pkgname="cv4pve-pepper-git"
_pkgname="cv4pve-pepper"
pkgver=1.7.0.r1.gdd38f20
pkgrel=1
pkgdesc="SPICE remote-viewer for Proxmox VE VDI client"
arch=('x86_64')
url='https://github.com/Corsinvest/cv4pve-pepper'
source=(git+"${url}".git)
license=('GPL3')
makedepends=('dotnet-sdk' 'git')
options=('!strip')
sha256sums=('SKIP')

pkgver() {
    cd $_pkgname
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd $_pkgname
    
    # Disable dotnet telemetry
    export DOTNET_CLI_TELEMETRY_OPTOUT=1

    dotnet publish --configuration Release --self-contained --runtime linux-x64 -p:PublishSingleFile=true --output "$PWD"/publish src/Corsinvest.ProxmoxVE.Pepper
}

package() {
    install -Dm755 "$_pkgname"/publish/"$_pkgname" "$pkgdir"/usr/bin/"$_pkgname"
    install -Dm644 "$_pkgname"/LICENSE.md "$pkgdir"/usr/share/licenses/"$pkgname"/LICENSE
}
