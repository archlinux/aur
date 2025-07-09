# Maintainer: Tobias Frilling <aur@ckafi.addy.io>

pkgname=zig-master-bin
pkgver=0.15.0_dev.936.gfc2c1883b
pkgrel=1
pkgdesc="A general-purpose programming language and toolchain for maintaining robust, optimal, and reusable software (master build)"
arch=('x86_64')
url="https://ziglang.org/"
license=('MIT')
provides=('zig')
conflicts=('zig')
makedepends=(jq minisign)
options=('!strip')

_index_json=$(curl -s "${url}/download/index.json")
_master_version=$(echo "$_index_json" | jq -r '.master.version')
_tarball_url=$(echo "$_index_json" | jq -r ".master.\"${CARCH}-linux\".tarball")
_tarball_sha256=$(echo "$_index_json" | jq -r ".master.\"${CARCH}-linux\".shasum")
_tarball=$(basename $_tarball_url)

pkgver() {
    echo "$_master_version" | sed 's/-/_/g; s/+/.g/g'
}

source=("$_tarball_url" "${_tarball_url}.minisig")
sha256sums=("$_tarball_sha256" "SKIP")

verify() {
    minisign -q -V \
        -P "RWSGOq2NVecA2UPNdBUZykf1CCb147pkmdtYxgb3Ti+JO/wCYvhbAb/U" \
        -m "$_tarball"
}

package() {
    cd $srcdir/${_tarball%.tar.*}

    install -dm755 "$pkgdir/usr/lib/zig"
    cp -a * "$pkgdir/usr/lib/zig/"
    install -dm755 "$pkgdir/usr/bin"
    ln -s /usr/lib/zig/zig "$pkgdir/usr/bin/zig"
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

    if [ -f "doc/langref.html" ]; then
        install -Dm644 doc/langref.html "$pkgdir/usr/share/doc/zig/langref.html"
    fi
}
