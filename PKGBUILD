# Maintainer: claude-brain maintainers
pkgname=claude-brain
pkgver=0.3.0
pkgrel=1
pkgdesc="A local second brain for Claude Code: hybrid recall over notes and past sessions, episodic memory, note-graph traversal, design memory, 3D visualisation, cloud sync"
# x86_64 only: fastembed pulls @anush008/tokenizers, which publishes prebuilds for
# win32-x64, linux-x64-gnu and darwin-universal but no linux-arm64-gnu. On aarch64 the
# lazy `await import("fastembed")` in src/embedder.ts throws and the brain silently
# degrades to BM25-only — worse than not shipping. Re-add when upstream does.
arch=('x86_64')
url="https://aur.archlinux.org/packages/claude-brain"
license=('MIT')
depends=('bun' 'rclone' 'xdg-utils')
optdepends=('claude-code: LLM-assisted vault reorganisation and design descriptions')
# Everything under node_modules/ is a redistributed upstream prebuilt; build() only runs
# `bun install` and `bun build`, so it compiles nothing. There are no DEBUG_CFLAGS objects
# for makepkg to split and no DBGSRCDIR sources to reference, which leaves the strip and
# debug passes walking several thousand vendor files to no purpose.
options=('!strip' '!debug')
source=("$pkgname-$pkgver.tar.gz")
sha256sums=('7522debecfabca6177042f82e36870b497a7d7c112f893895ca0b70d7c324895')

build() {
	cd "$pkgname-$pkgver"
	# onnxruntime-node is in trustedDependencies, so bun runs its postinstall. That
	# script downloads a ~500 MB CUDA/TensorRT execution-provider set from GitHub when
	# ONNXRUNTIME_NODE_INSTALL_CUDA is set in the builder's environment. We only ever
	# use the CPU provider.
	ONNXRUNTIME_NODE_INSTALL_CUDA=skip bun install --frozen-lockfile
	bun run build
	# The 3D graph deps (@babylonjs/core, d3-force-3d) are devDependencies: they are
	# imported only by frontend/brain.js and were just inlined into public/bundle.js by
	# the line above, so the runtime tree does not need their 93 MB / 9851 files.
	rm -rf node_modules
	ONNXRUNTIME_NODE_INSTALL_CUDA=skip bun install --frozen-lockfile --production
}

check() {
	cd "$pkgname-$pkgver"
	# Needs only production deps (bun:test is built in, sqlite-vec is a runtime dep), so
	# this still passes after the prune above. The suite works on scratch databases and
	# must never touch the builder's XDG dirs or vault.
	bun test
}

package() {
	cd "$pkgname-$pkgver"

	# onnxruntime-node vendors prebuilt bindings for all six platform/arch pairs it
	# supports (208 MB). dist/binding.js resolves exactly one, with no manifest and no
	# fallback list:
	#   require(`../bin/napi-v3/${process.platform}/${process.arch}/onnxruntime_binding.node`)
	# so the other five are unreachable by construction. Prune before the copy, so the
	# bulk never lands in $pkgdir at all.
	local napi='node_modules/onnxruntime-node/bin/napi-v3'
	[[ -d $napi/linux/x64 ]] || return 1  # fail loudly if upstream restructures this
	find "$napi" -mindepth 1 -maxdepth 1 ! -name 'linux' -exec rm -rf {} +
	find "$napi/linux" -mindepth 1 -maxdepth 1 ! -name 'x64' -exec rm -rf {} +
	rm -f "$napi/linux/x64"/libonnxruntime_providers_{cuda,tensorrt}.so

	# npm tarballs cannot carry symlinks, so libonnxruntime.so.1.21.0 ships as a
	# byte-identical copy of libonnxruntime.so.1 — the SONAME, and the only name in the
	# binding's DT_NEEDED. Restoring the link saves 21 MB; cp -r below preserves it.
	ln -sf 'libonnxruntime.so.1' "$napi/linux/x64/libonnxruntime.so.1.21.0"

	local app="$pkgdir/usr/share/claude-brain"
	install -d "$app"
	# cp -r rather than -a: -a would replay the builder's uid/gid under fakeroot.
	cp -r server.ts src bin public node_modules package.json "$app/"

	install -d "$pkgdir/usr/bin"
	cat > "$pkgdir/usr/bin/claude-brain" <<'SH'
#!/bin/sh
exec /usr/bin/bun /usr/share/claude-brain/bin/claude-brain.ts "$@"
SH
	chmod 755 "$pkgdir/usr/bin/claude-brain"

	install -Dm644 packaging/claude-brain.service "$pkgdir/usr/lib/systemd/user/claude-brain.service"

	local lic="$pkgdir/usr/share/licenses/$pkgname"
	install -Dm644 LICENSE "$lic/LICENSE"
	# We redistribute ~25 MB of third-party binaries and owe an accounting of them, but
	# none of these npm tarballs ships licence TEXT: a previous revision installed
	# node_modules/onnxruntime-common/LICENSE and .../@anush008/tokenizers/LICENSE, paths
	# that have never existed, and package() died on the first build. Take the terms from
	# each package's own metadata rather than inventing a copyright line for someone
	# else, and pass through a real licence file on the day upstream starts shipping one.
	{
		echo "claude-brain bundles the prebuilt native components below. Each is covered"
		echo "by the licence declared in its own package metadata; upstream ships no"
		echo "licence text for them in their npm tarballs."
		echo
		bun -e '
			const names = ["onnxruntime-node", "onnxruntime-common",
				"@anush008/tokenizers", "@anush008/tokenizers-linux-x64-gnu"];
			for (const n of names) {
				try {
					const m = require(`./node_modules/${n}/package.json`);
					const home = m.homepage ?? m.repository?.url ?? m.repository ?? "";
					console.log(`${m.name}@${m.version}  ${m.license ?? "see upstream"}  ${home}`.trim());
				} catch {}
			}
		'
	} > "$lic/BUNDLED-LICENSES"
	local f
	for f in node_modules/onnxruntime-common/LICENSE node_modules/@anush008/tokenizers/LICENSE; do
		[[ -f $f ]] && install -Dm644 "$f" "$lic/$(basename "$(dirname "$f")").LICENSE"
	done
	install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
}
