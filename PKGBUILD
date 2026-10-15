# Maintainer: 5unekku <swagalicious@awesomsauce.net>
_pkgname='opencode'
pkgname="${_pkgname}-v2-git"
pkgver=2.0.30.412b2b1d85
pkgrel=1
pkgdesc='The open source coding agent (version 2)'
arch=(
	'x86_64'
	'aarch64'
)
url='https://github.com/anomalyco/opencode'
license=('MIT')
depends=(
	'bun>=1.4.2'
	'curl'
	'glibc'
	'icu'
	'ripgrep'
	'tar'
)

makedepends=(
	'git'
)
optdepends=(
	'wl-clipboard: clipboard support on Wayland'
	'xclip: clipboard support on X11'
)
options=(
	'!debug'
	'!strip'
)
source=(
	"git+$url.git"
	"shared-bun.patch"
)
sha256sums=(
	'SKIP'
	'8c4f437a3a0ce746c0b8d06fd5c2592176d4a3d9dbefa7e9ac02efd72466db33'
)
provides=('opencode' 'opencode-v2')
conflicts=('opencode' 'opencode-bin' 'opencode-git')

pkgver() {
	cd $_pkgname
	printf '%s.%s' $(git tag | grep -iE '^v2' | sort -V | tail -n 1 | tail -c +2) $(git rev-parse --short HEAD)
}

prepare() {
	cd $_pkgname
	git checkout -- packages/cli/script/build.ts
	git apply "$srcdir/shared-bun.patch"
	bun install --frozen-lockfile --ignore-scripts
}

build() {
	cd $_pkgname/packages/cli
	# patched to emit a plain bun bundle: the default build compiles a standalone
	# executable that embeds its own bun runtime, we run the system bun instead
	# opencode gets the plain tag version (pkgver minus the commit hash); the server rejects the 4-part form
	OPENCODE_VERSION=${pkgver%.*} bun run ./script/build.ts --single
}

package() {
	cd $_pkgname
	case $CARCH in
	aarch64) dir=cli-linux-arm64 ;;
	x86_64) dir=cli-linux-x64 ;;
	esac
	install -vdm755 "$pkgdir/usr/lib/$pkgname"
	cp -r "packages/cli/dist/$dir/." "$pkgdir/usr/lib/$pkgname/"
	rm -v "$pkgdir/usr/lib/$pkgname/package.json"
	# bundled assets (libopentui .so, wasm, etc.) are exported as "./name" and resolved
	# against the cwd; point them at the install dir
	sed -i -E "s#^var ([A-Za-z_\$]+)=\"\./([^\"/]+)\";export\{\1 as default\};\$#var \1=\"/usr/lib/$pkgname/\2\";export{\1 as default};#" "$pkgdir/usr/lib/$pkgname"/chunk-*.js

	install -vdm755 "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/opencode" <<- EOF
	#!/bin/sh
	exec /usr/bin/bun --smol --user-agent=opencode/latest/${pkgver%.*}/cli --use-system-ca --no-warnings /usr/lib/$pkgname/bin/index.js "\$@"
	EOF
	chmod -v 755 "$pkgdir/usr/bin/opencode"

	install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE

	# run the staged bundle (the wrapper points at /usr/lib, not installed yet) and
	# write to a file first so a failure aborts instead of installing an empty completion
	for shell in bash zsh fish; do
		bun "$pkgdir/usr/lib/$pkgname/bin/index.js" --completions $shell > "$srcdir/completion.$shell"
	done
	install -vDm644 "$srcdir/completion.bash" "$pkgdir/usr/share/bash-completion/completions/opencode"
	install -vDm644 "$srcdir/completion.zsh" "$pkgdir/usr/share/zsh/site-functions/_opencode"
	install -vDm644 "$srcdir/completion.fish" "$pkgdir/usr/share/fish/vendor_completions.d/opencode.fish"
}
