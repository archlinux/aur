# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: particle-iot (https://github.com/particle-iot)

pkgname=prtcl-bin
pkgver=1.3.3
pkgrel=1
pkgdesc="The new Particle CLI"
arch=("x86_64")
url="https://github.com/particle-iot/particle-cli"
license=("Apache")
source=("https://prtcl.s3.amazonaws.com/apt/prtcl_$pkgver-1_amd64.deb")
noextract=("prtcl_$pkgver-1_amd64.deb")
sha256sums=('04ec8f6a4700f3dea1eeb0ba975dbd1d02a4f371617254b53fc49eef3639960f')

depends=()
optdepends=("bash-completion: Bash completion for prtcl")

package() {
    # Extract .deb    
    bsdtar -O -xf "prtcl_$pkgver-1_amd64.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Correct update instructions
    sed -i 's/export PRTCL_UPDATE_INSTRUCTIONS=.*$/export PRTCL_UPDATE_INSTRUCTIONS="update with \\"yay -S prtcl-bin\\""/' "$pkgdir/usr/lib/@particle/cli/bin/prtcl"

    # Bash completion
    HOME="$srcdir" "$pkgdir/usr/bin/prtcl" autocomplete &> /dev/null
    install -D "$srcdir/.cache/@particle/cli/autocomplete/functions/bash/prtcl.bash" \
        "$pkgdir/usr/share/bash-completion/completions/prtcl"
}
