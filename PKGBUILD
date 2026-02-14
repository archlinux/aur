# Maintainer: MrToadie <toadie@toadie.de>

pkgname=kvm-configurator
pkgver=1.0.9.1
pkgrel=1
pkgdesc="Little helper for virsh‑install"
arch=('x86_64')
url="https://github.com/mrtoadie/kvm-configurator"
license=('MIT')
depends=('glibc')
makedepends=('git' 'go')
source=("git+${url}.git")
sha256sums=('SKIP')   # VCS‑Quellen dürfen SKIP benutzen

# --------------------------------------------------------------------
# 1️⃣ Build‑Phase
# --------------------------------------------------------------------
build() {
    # Die Arbeitskopie liegt in: $srcdir/kvm-configurator/kvm-configurator
    cd "$srcdir/kvm-configurator/kvm-configurator/"

    # Falls das Projekt Go‑Modules nutzt (go.mod vorhanden):
    go mod tidy                # sorgt dafür, dass alle Abhängigkeiten geladen werden
    go build -v -o "$pkgname" # erzeugt ein Binary namens „kvm-configurator“
}

# --------------------------------------------------------------------
# 2️⃣ Package‑Phase
# --------------------------------------------------------------------
package() {
    # Ziel‑Verzeichnisse innerhalb des Sandbox‑Root ($pkgdir) anlegen
    install -dm755 "$pkgdir/usr/bin"
    install -dm755 "$pkgdir/usr/share/doc/$pkgname"

    # Das tatsächlich gebaute Binary kopieren
    install -m755 "$srcdir/kvm-configurator/kvm-configurator/$pkgname" \
                   "$pkgdir/usr/bin/$pkgname"

    # Optional: README, LICENSE, Beispiel‑Config etc. mitliefern
    install -m644 "$srcdir/kvm-configurator/README.md" \
                   "$pkgdir/usr/share/doc/$pkgname/README.md"
    #install -m644 "$srcdir/kvm-configurator/kvm-configurator/oslist.yaml" \
    #               "$pkgdir/etc/skel/.config/kvm-configurator/oslist.yaml"
    mkdir -p "$pkgdir/home/$USER/.config/kvm-configurator"
    install -m755 "$srcdir/kvm-configurator/kvm-configurator/oslist.yaml" "$pkgdir/home/$USER/.config/kvm-configurator"
}
