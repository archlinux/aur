# Maintainer: Aaron Friesen <aaron@frie.dev>
# shellcheck shell=bash disable=SC2034,SC2154,SC2164

pkgname=sandbox-runtime
pkgver=0.0.83
pkgrel=1
pkgdesc='Tool for enforcing filesystem and network restrictions on arbitrary processes'
arch=(x86_64 aarch64)
url='https://github.com/anthropics/sandbox-runtime'
license=(Apache-2.0)
depends=(
	'bubblewrap'
	'nodejs>=22.12.0'
	'ripgrep'
	'socat'
)
optdepends=('java-runtime: JVM proxy support inside the sandbox')
makedepends=(
	'gcc'
	'jdk21-openjdk'
	'libseccomp'
	'npm'
)
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('9bb4cab0985daaf33d9f227539a2e58da4073100d0a71bb9a278b2ec71523190')

build() {
	cd "$pkgname-$pkgver"

	npm ci \
		--cache "$srcdir/npm-cache" \
		--ignore-scripts \
		--no-audit \
		--no-fund

	node_modules/.bin/tsc

	# apply-seccomp is baked into the sandbox, so build it for the host
	# architecture. Only x64 and arm64 are supported, and the vendor
	# directories are named after the Node.js architecture.
	local vendor_arch
	vendor_arch=$(node -p 'process.arch')
	local out="vendor/seccomp/$vendor_arch"
	mkdir -p "$out"

	# The generator only runs at build time, and Arch ships no static
	# libseccomp. Only apply-seccomp itself needs to be static.
	gcc -O2 -Wall -Wextra -o "$out/seccomp-unix-block" \
		vendor/seccomp-src/seccomp-unix-block.c -lseccomp

	local rule_set
	for rule_set in unix namespaces; do
		"$out/seccomp-unix-block" "$out/$CARCH.$rule_set.bpf" "$CARCH" "$rule_set"
	done

	{
		printf '#if defined(__%s__)\n' "$CARCH"
		local pair
		for pair in unix_block_bpf:unix namespace_block_bpf:namespaces; do
			printf 'static const unsigned char %s[] = {\n' "${pair%:*}"
			od -An -v -tx1 "$out/$CARCH.${pair#*:}.bpf" |
				tr -s ' \n' '\n' |
				sed '/^$/d; s/^/    0x/; s/$/,/'
			printf '};\n'
		done
		printf '#else\n#error "these filters were generated for another architecture"\n#endif\n'
	} >"$out/unix-block-bpf.h"

	gcc -static-pie -O2 -Wall -Wextra -fstack-protector-strong \
		-Wl,-z,relro,-z,now -I "$out" \
		-o "$out/apply-seccomp" vendor/seccomp-src/apply-seccomp.c
	strip "$out/apply-seccomp"
	rm -f "$out/seccomp-unix-block" "$out/$CARCH".*.bpf \
		"$out/unix-block-bpf.h"

	# JVM proxy agent: --release 8 for old JVMs, and a reproducible jar
	# with stored entries, as vendor/java-proxy-agent/build.ts does.
	export JAVA_HOME=/usr/lib/jvm/java-21-openjdk
	export PATH="$JAVA_HOME/bin:$PATH"

	local work="$srcdir/java-agent"
	rm -rf "$work"
	mkdir -p "$work/classes"

	local sources=()
	mapfile -d '' -t sources < <(find vendor/java-proxy-agent-src -name '*.java' -print0 | sort -z)
	javac --release 8 -Xlint:all,-options -Werror -g:none \
		-d "$work/classes" "${sources[@]}"

	printf 'Premain-Class: com.anthropic.srt.ProxyAgent\nAgent-Class: com.anthropic.srt.ProxyAgent\n' \
		>"$work/MANIFEST.MF"

	local entries=()
	mapfile -d '' -t entries < <(cd "$work/classes" && find . -type f -print0 | sort -z)

	local args=()
	local entry
	for entry in "${entries[@]}"; do
		args+=(-C "$work/classes" "${entry#./}")
	done

	jar --create --file vendor/java-proxy-agent/srt-proxy-agent.jar \
		--manifest "$work/MANIFEST.MF" --no-compress \
		--date 1980-01-01T00:00:02Z "${args[@]}"

	npm prune \
		--omit=dev \
		--cache "$srcdir/npm-cache" \
		--ignore-scripts \
		--no-audit \
		--no-fund

	# npm prune leaves the scoped directories of removed packages behind.
	find node_modules -mindepth 1 -type d -empty -delete
}

package() {
	cd "$pkgname-$pkgver"

	# The runtime looks for the helper under the Node.js architecture.
	local vendor_arch
	vendor_arch=$(node -p 'process.arch')

	install -d \
		"$pkgdir/usr/lib/$pkgname/vendor/seccomp/$vendor_arch" \
		"$pkgdir/usr/lib/$pkgname/vendor/java-proxy-agent"

	cp -r dist node_modules package.json "$pkgdir/usr/lib/$pkgname/"

	install -m755 vendor/seccomp/"$vendor_arch"/apply-seccomp \
		"$pkgdir/usr/lib/$pkgname/vendor/seccomp/$vendor_arch/"
	install -m644 vendor/java-proxy-agent/srt-proxy-agent.jar \
		"$pkgdir/usr/lib/$pkgname/vendor/java-proxy-agent/"

	# srt is provided by python-srt, so install under the package name.
	install -d "$pkgdir/usr/bin"
	chmod 755 "$pkgdir/usr/lib/$pkgname/dist/cli.js"
	ln -s "../lib/$pkgname/dist/cli.js" "$pkgdir/usr/bin/$pkgname"

	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
