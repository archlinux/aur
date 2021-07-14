# Maintainer: shimunn <shimun@shimun.net>
pkgname=fido2luks
pkgver=0.2.19
pkgrel=1
makedepends=('rust' 'cargo' 'cryptsetup' 'clang')
depends=('cryptsetup')
arch=('i686' 'x86_64' 'armv6h' 'armv7h')
pkgdesc="Decrypt your LUKS partition using a FIDO2 compatible authenticator"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/shimunn/${pkgname}/archive/${pkgver}.tar.gz")
# curl -L https://github.com/shimunn/fido2luks/archive/0.2.16.tar.gz | sha256sum
sha256sums=("4adcc5dafeea47b71ab61edeaa5fbed369ac23ae976f4f02e8f1496e30a0968f")
url="https://github.com/shimunn/fido2luks"
license=('MPL-2.0')

build() {
    cd "${pkgname}-${pkgver}"
    cargo build --release --locked --all-features --target-dir=target
    ./target/release/fido2luks completions bash target
    ./target/release/fido2luks completions fish target
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 target/release/${pkgname} -t "${pkgdir}/usr/bin"
    
    install -Dm 755 pam_mount/fido2luksmounthelper.sh -t "${pkgdir}/usr/bin"
    install -Dm 644 initcpio/hooks/fido2luks -t "${pkgdir}/usr/lib/initcpio/hooks"
    install -Dm 644 initcpio/install/fido2luks -t "${pkgdir}/usr/lib/initcpio/install"

    install -Dm 644 target/fido2luks.bash "${pkgdir}/usr/share/bash-completion/completions/fido2luks"
    install -Dm 644 target/fido2luks.fish -t "${pkgdir}/usr/share/fish/vendor_completions.d"
}
