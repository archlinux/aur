# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=harness
pkgver=0.3.1
pkgrel=1
pkgdesc="Minimal agent loop in bash"
arch=('any')
url="https://github.com/wedow/harness"
license=('MIT')
depends=('bash' 'curl' 'jq' 'perl')
source=("harness-$pkgver.tar.gz::https://github.com/wedow/harness/archive/refs/tags/v$pkgver.tar.gz")
# sha256sums patched at publish time by publish-aur.sh
sha256sums=('8e333471f64ee869df8b07833535ec3d3df48a740cd2f28a0175ff3b21fd016c')

package() {
    cd "harness-$pkgver"

    install -d "$pkgdir/usr/lib/harness"
    scripts/release-manifest.sh | while IFS= read -r path; do
        cp -a "$path" "$pkgdir/usr/lib/harness/"
    done

    install -d "$pkgdir/usr/bin"
    sed 's|^readonly HARNESS_ROOT=.*$|readonly HARNESS_ROOT="/usr/lib/harness"|' bin/harness > "$pkgdir/usr/bin/harness"
    chmod 755 "$pkgdir/usr/bin/harness"
    ln -s /usr/bin/harness "$pkgdir/usr/bin/hs"

    # plugins source ${HARNESS_ROOT}/bin/harness
    install -d "$pkgdir/usr/lib/harness/bin"
    ln -s /usr/bin/harness "$pkgdir/usr/lib/harness/bin/harness"
}
