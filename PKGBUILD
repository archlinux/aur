# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: particle-iot (https://github.com/particle-iot)

pkgname=prtcl-bin
pkgver=1.3.1
pkgrel=3
pkgdesc="The new Particle CLI"
arch=("x86_64")
url="https://github.com/particle-iot/particle-cli"
license=("Apache")
source=("https://prtcl.s3.amazonaws.com/apt/prtcl_$pkgver-1_amd64.deb")
noextract=("prtcl_$pkgver-1_amd64.deb")
sha256sums=('868e381ff8b9c363ee92c5d144c97b31fcfb81a3f9c2a20dd79f69bb15066770')

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
