# Maintainer: wedow <wedow@users.noreply.github.com>
pkgname=harness
pkgver=0.2.0
pkgrel=1
pkgdesc="Minimal agent loop in bash"
arch=('any')
url="https://github.com/wedow/harness"
license=('MIT')
depends=('bash' 'curl' 'jq' 'perl')
source=("harness-$pkgver.tar.gz::https://github.com/wedow/harness/archive/refs/tags/v$pkgver.tar.gz")
# sha256sums patched at publish time by publish-aur.sh
sha256sums=('62ddb0d500fbdb230838cb5cfa68ad37e46c5bfaccd50ab08cb582bd382d7f14')

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
