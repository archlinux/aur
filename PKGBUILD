# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: particle-iot (https://github.com/particle-iot)

pkgname=prtcl-bin
pkgver=1.7.14
pkgrel=1
pkgdesc="The new Particle CLI"
arch=("x86_64")
url="https://github.com/particle-iot/particle-cli"
license=("Apache")
source=("https://prtcl.s3.amazonaws.com/apt/prtcl_$pkgver-1_amd64.deb")
noextract=("prtcl_$pkgver-1_amd64.deb")
sha256sums=('e8f12d3cbbb849e2e2c2e6ab92d3670d066bc1c277c49e1184bb92bb41b8bc71')

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
