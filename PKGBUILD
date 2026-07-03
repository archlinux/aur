# Maintainer: noureddinex <noureddinex@protonmail.com>

pkgname=lms-cli-git
pkgver=r908.9d87501
pkgrel=1
pkgdesc="Command line tool for LM Studio"
arch=('any')
url="https://github.com/lmstudio-ai/lms"
license=('MIT' 'Apache-2.0')
depends=('nodejs')
makedepends=('git' 'npm')
provides=('lms-cli' 'lms')
conflicts=('lms-cli' 'lms')
source=(
	"$pkgname::git+https://github.com/lmstudio-ai/lmstudio-js.git#branch=main"
	"lms.sh"
)
sha256sums=('SKIP'
            'SKIP')

# lms-cli's actual sources live in the lmstudio-js monorepo; the standalone
# lmstudio-ai/lms repo is only a read-only publish mirror pulled in as a
# submodule and cannot be built on its own (see its README).
pkgver() {
	cd "$pkgname"
	printf 'r%s.%s' "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"

	# npm ci needs the registry; unavoidable for this monorepo (no vendored
	# node_modules tarball is published, and lms-cli's workspace deps aren't
	# resolvable any other way). postinstall runs patch-package, which is
	# required (ink/boxen/promise-inflight patches live in patches/).
	npm ci

	# Builds @lmstudio/lms-cli then rolls it up into a single ESM bundle at
	# publish/cli/dist/index.js. Rollup inlines every workspace/npm dep
	# except ink, react, react/jsx-runtime and ws (see publish/cli/rollup.config.js
	# "external" list) - those four (plus their own deps) still have to be
	# present in node_modules at runtime.
	npm run build-cli

	# Collect the runtime-only closure of those externals out of the
	# already-installed (and already patched) root node_modules, instead of
	# a second `npm install` that would re-fetch a fresh, unpatched ink.
	node - <<'NODE'
const fs = require("fs");
const path = require("path");

const lock = JSON.parse(fs.readFileSync("node_modules/.package-lock.json", "utf8"));
const pkgs = lock.packages;

// Resolve `dep` as required from package at `fromKey` (e.g. "node_modules/ink" or
// "node_modules/ink/node_modules/ansi-escapes"), mimicking node's own nearest-
// node_modules walk-up so hoisted vs. nested duplicate versions both resolve to
// the same file that would actually be loaded at runtime.
function resolve(fromKey, dep) {
	// fromKey is e.g. "node_modules/ink" or "node_modules/ink/node_modules/ansi-escapes".
	// Strip the package's own name segment to get its containing dir, then walk
	// up one "/node_modules/" level at a time (root included), same as node's
	// own resolution order.
	const dir = fromKey.replace(/\/node_modules\/[^/]+(\/[^/]+)?$/, "");
	const segments = dir.length > 0 ? dir.split("/node_modules/") : [];
	for (let i = segments.length; i >= 0; i--) {
		const prefix = segments.slice(0, i).join("/node_modules/");
		const candidate = (prefix.length > 0 ? prefix + "/" : "") + "node_modules/" + dep;
		if (pkgs[candidate]) return candidate;
	}
	return null;
}

const seeds = ["ink", "react", "ws"].map((n) => "node_modules/" + n);
const visited = new Set();
const queue = [...seeds];
const missing = new Set();

while (queue.length > 0) {
	const key = queue.shift();
	if (visited.has(key)) continue;
	visited.add(key);
	const entry = pkgs[key];
	if (!entry) {
		missing.add(key);
		continue;
	}
	for (const dep of Object.keys(entry.dependencies || {})) {
		const resolved = resolve(key, dep);
		if (!resolved) {
			missing.add(`${key} -> ${dep}`);
			continue;
		}
		if (!visited.has(resolved)) queue.push(resolved);
	}
}

if (missing.size > 0) {
	console.error("Could not resolve runtime deps:", [...missing].join(", "));
	process.exit(1);
}

// Only copy the outermost keys: anything nested inside another visited key's
// directory is already brought along by that parent's recursive copy.
const allKeys = [...visited].sort();
const outermost = allKeys.filter(
	(key) => !allKeys.some((other) => other !== key && key.startsWith(other + "/node_modules/")),
);

for (const key of outermost) {
	const dest = path.join("runtime-modules", key.slice("node_modules/".length));
	fs.mkdirSync(path.dirname(dest), { recursive: true });
	fs.cpSync(key, dest, { recursive: true });
}
NODE
}

package() {
	install -Dm755 "$pkgname/publish/cli/dist/index.js" "$pkgdir/usr/lib/lms-cli/index.js"
	cp -a "$pkgname/runtime-modules" "$pkgdir/usr/lib/lms-cli/node_modules"

	install -Dm755 "lms.sh" "$pkgdir/usr/bin/lms"

	install -Dm644 "$pkgname/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -Dm644 "$pkgname/publish/cli/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.cli"
}
