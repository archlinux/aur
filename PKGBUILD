# Maintainer: hnchengzong
# Contributor: CaelestisAstesia
pkgname=sidravia-bin
_tag=v0.3.0-alpha.1
pkgver=0.3.0alpha1
pkgrel=1
pkgdesc="吉林大学 Dr.COM 5.2.0 D 认证客户端"
arch=('x86_64')
url="https://github.com/CaelestisAstesia/sidravia"
license=('AGPL-3.0-only')
depends=(bash)
provides=('sidravia')
conflicts=('sidravia')
source=("sidravia-$pkgver.tar.gz::https://github.com/CaelestisAstesia/sidravia/releases/download/$_tag/sidravia-$_tag-linux-amd64-core-portable.tar.gz")
sha256sums=('2168b3fe3c12858d1500005cfecbe3723dac1f2461fade38dc1d873234b56180')
install=sidravia-bin.install

package() {
	local dir="sidravia-$_tag-linux-amd64"

	install -d "$pkgdir/usr/lib/sidravia/institution-profiles"
	install -m755 "$srcdir/$dir/sidraviactl" "$pkgdir/usr/lib/sidravia/sidraviactl"
	install -m755 "$srcdir/$dir/sidraviad" "$pkgdir/usr/lib/sidravia/sidraviad"
	install -m644 "$srcdir/$dir/institution-profiles/jlu.json" \
		"$pkgdir/usr/lib/sidravia/institution-profiles/jlu.json"

	install -Dm644 "$srcdir/$dir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$srcdir/$dir/BUILD-INFO.txt" "$pkgdir/usr/share/doc/$pkgname/BUILD-INFO.txt"

	install -d "$pkgdir/usr/bin"
	ln -s /usr/lib/sidravia/sidraviactl "$pkgdir/usr/bin/sidraviactl"
	ln -s /usr/lib/sidravia/sidraviad "$pkgdir/usr/bin/sidraviad"

	cat > "$pkgdir/usr/bin/jlu-login" <<'EOF'
#!/bin/sh
set -eu
cfg="${1:-${JLU_CONFIG:-}}"
if [ -z "$cfg" ]; then
	echo "用法：jlu-login <配置ID>；或使用 JLU_CONFIG 指定" >&2
	echo "现有配置：" >&2
	sidraviactl config list 2>/dev/null | sed -n 's/^配置：/  /p' >&2 || true
	exit 2
fi
sidraviactl daemon start >/dev/null 2>&1 || true
sidraviactl auth start --config "$cfg"
sidraviactl auth list
EOF

	chmod 755 "$pkgdir/usr/bin/jlu-login"
}
