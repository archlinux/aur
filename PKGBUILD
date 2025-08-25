# Maintainer: Kewl <xrjy@nygb.rh.bet(rot13)>
# Contributor: Peter Flynn <peter@flynn.network>
pkgname=foundry-bin
pkgver=1.3.2
pkgrel=1
pkgdesc="Blazing fast, portable and modular Ethereum development toolkit written in Rust"
arch=('aarch64' 'x86_64')
url="https://github.com/foundry-rs/foundry"
license=('Apache')
depends=('gcc-libs' 'openssl')
makedepends=('curl' 'bash')
makedepends_aarch64=('rust')
provides=('foundry')
source=('https://foundry.paradigm.xyz')
md5sums=('6d16faeb2fc8f12a0083623be892235e')

prepare() {
	cd "$srcdir"
	mkdir -p usr
	export FOUNDRY_DIR="$srcdir/usr"
	export PATH="$FOUNDRY_DIR/bin:$PATH"

	chmod +x foundry.paradigm.xyz
	./foundry.paradigm.xyz -y --no-modify-path
	"$FOUNDRY_DIR/bin/foundryup" -y
	rm "$FOUNDRY_DIR/bin/foundryup"
}

pkgver() {
	cd "$srcdir"
	if [ ! -s usr/bin/forge ]; then
		echo "Foundry failed to download tools." >&2
		exit 1
	fi
    _v_str=$(usr/bin/forge -V) || {
        echo "Foundry tools returned an error." >&2
        exit 1
    }
    # Extract the version and commit hash
    _version=$(echo "$_v_str" | sed -E 's/^forge ([0-9]+\.[0-9]+\.[0-9]+)-.*$/\1/')
    _commit_hash=$(echo "$_v_str" | sed -E 's/.*\(([a-z0-9]+)\s.*/\1/')

    # Combine version and commit hash in the format: 1.0.0.e144b82070
    echo "${_version}.${_commit_hash}"
}

package() {
	cp -R "$srcdir/usr" "$pkgdir/"
}
