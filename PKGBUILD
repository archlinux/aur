# Maintainer: Nathan Robinson <nrobinson2000 at me dot com>
# Contributor: particle-iot (https://github.com/particle-iot)

pkgname=prtcl-bin
pkgver=1.3.1
pkgrel=1
pkgdesc="The new Particle CLI"
arch=("x86_64")
url="https://github.com/particle-iot/particle-cli"
license=("Apache")
source=("prtcl.deb::https://prtcl.s3.amazonaws.com/apt/prtcl_$pkgver-1_amd64.deb")
noextract=("prtcl.deb")
sha256sums=('170760cb7bd1122d48f165d22740d610ff6a43219ce60f0d5b06b92c3f2dddcd')

depends=()
optdepends=("bash-completion")

package() {
    # Extract .deb    
    bsdtar -O -xf "prtcl.deb" data.tar.xz | bsdtar -C "${pkgdir}" -xJf -

    # Correct update instructions
    sed -i 's/export PRTCL_UPDATE_INSTRUCTIONS=.*$/export PRTCL_UPDATE_INSTRUCTIONS="update with \\"yay -S prtcl-bin\\""/' "$pkgdir/usr/lib/@particle/cli/bin/prtcl"

    # Bash completion
    HOME="$srcdir" "$pkgdir/usr/bin/prtcl" autocomplete &> /dev/null
    install -D "$srcdir/.cache/@particle/cli/autocomplete/functions/bash/prtcl.bash" \
        "$pkgdir/usr/share/bash-completion/completions/prtcl"
}
