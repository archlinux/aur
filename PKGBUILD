# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: particle-iot (https://github.com/particle-iot)

pkgname=prtcl-bin
pkgver=1.5.10
pkgrel=1
pkgdesc="The new Particle CLI"
arch=("x86_64")
url="https://github.com/particle-iot/particle-cli"
license=("Apache")
source=("https://prtcl.s3.amazonaws.com/apt/prtcl_$pkgver-1_amd64.deb")
noextract=("prtcl_$pkgver-1_amd64.deb")
sha256sums=('016a76aae638293d51a7091e1c9809c7051e8c9520e818398b035311467a4d67')

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
