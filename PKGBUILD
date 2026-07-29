# Maintainer: Asuka Minato <i at asukaminato dot eu dot org>
pkgname=z-library-electron
pkgver=3.1.0
pkgrel=1
pkgdesc="Your gateway to knowledge and culture. use system electron"
arch=(x86_64)
url="https://articles.sk/"
license=('unknown')
makedepends=(asar nodejs)
depends=(electron37 bash hicolor-icon-theme)
source=("https://s3proxy-alp.cdn-zlib.sk/swfs_second_public_files/soft/desktop/Z-Library_${pkgver}_amd64.deb")
sha256sums=('9b56b14741eba877e8cfed6dbe108eaf5c6ad255641e3c6badfd8a9d303b6558')
options=(!emptydirs)

package() {
	bsdtar -xf data.tar.* -C $pkgdir

	local resources="$pkgdir/opt/Z-Library/resources"
	local appdir="$resources/app"
	local tor_proxy="$resources/proxies/torProxy"

	asar extract "$resources/app.asar" "$appdir"
	rm "$resources/app.asar"

	# The application uses the system Electron, so remove the bundled runtime.
	find "$pkgdir/opt/Z-Library" -mindepth 1 -maxdepth 1 \
		! -name resources -exec rm -rf -- {} +

	# The production code loads Tor from resources/proxies/torProxy. The copies
	# below dist-electron are build artifacts, and Windows binaries cannot run
	# in this Linux package.
	rm -rf \
		"$appdir/dist-electron/configs" \
		"$appdir/dist-electron/tor" \
		"$appdir/dist-electron/tor-windows" \
		"$tor_proxy/configs/pluggable_transports" \
		"$tor_proxy/tor-windows"

	# torrc_template only configures lyrebird; Conjure and its metadata are not
	# referenced by the application.
	rm -f \
		"$tor_proxy/tor/pluggable_transports/conjure-client" \
		"$tor_proxy/tor/pluggable_transports/README.CONJURE.md" \
		"$tor_proxy/tor/pluggable_transports/pt_config.json"

	# With a system Electron, process.resourcesPath points into /usr/lib rather
	# than next to this application. Resolve the proxy from app.getAppPath().
	local old_proxy_path='dirname = path.join(process.resourcesPath, "proxies/torProxy");'
	local new_proxy_path='dirname = path.join(app.getAppPath(), "..", "proxies/torProxy");'
	grep -Fq "$old_proxy_path" "$appdir/dist-electron/main.js" ||
		{ error "Unable to locate the Tor resource path"; return 1; }
	sed -i "s|$old_proxy_path|$new_proxy_path|" \
		"$appdir/dist-electron/main.js"

	# The upstream package marks build and renderer dependencies as production
	# dependencies. Keep only packages imported by dist-electron and their
	# installed dependency closure.
	node - "$appdir" <<'EOF'
const fs = require("fs");
const path = require("path");

const appDir = path.resolve(process.argv[2]);
const modulesDir = path.join(appDir, "node_modules");
const electronDir = path.join(appDir, "dist-electron");
const keep = new Set();
const entryPackages = new Set();

function packageName(specifier) {
  if (specifier.startsWith("@")) {
    return specifier.split("/").slice(0, 2).join("/");
  }
  return specifier.split("/")[0];
}

function scanImports(directory) {
  for (const entry of fs.readdirSync(directory, { withFileTypes: true })) {
    const filename = path.join(directory, entry.name);
    if (entry.isDirectory()) {
      scanImports(filename);
      continue;
    }
    if (!entry.isFile() || !/\.(?:c?js|mjs)$/.test(entry.name)) continue;

    const source = fs.readFileSync(filename, "utf8");
    const patterns = [
      /^import\s+(?:[\s\S]*?\s+from\s+)?["']([^"']+)["'];?/gm,
      /\brequire\s*\(\s*["']([^"']+)["']\s*\)/g,
    ];
    for (const pattern of patterns) {
      for (const match of source.matchAll(pattern)) {
        const specifier = match[1];
        if (
          specifier === "electron" ||
          specifier.startsWith("node:") ||
          specifier.startsWith(".") ||
          specifier.startsWith("/")
        ) continue;
        entryPackages.add(packageName(specifier));
      }
    }
  }
}

function resolvePackage(name, fromDirectory) {
  let directory = fromDirectory;
  while (directory.startsWith(appDir)) {
    const candidate = path.resolve(directory, "node_modules", name);
    if (fs.existsSync(path.join(candidate, "package.json"))) return candidate;
    const parent = path.dirname(directory);
    if (parent === directory) break;
    directory = parent;
  }
  return null;
}

function addPackage(name, fromDirectory, optional = false) {
  const directory = resolvePackage(name, fromDirectory);
  if (!directory) {
    if (optional) return;
    throw new Error(`Missing runtime dependency ${name} required by ${fromDirectory}`);
  }
  if (keep.has(directory)) return;
  keep.add(directory);

  const manifest = JSON.parse(
    fs.readFileSync(path.join(directory, "package.json"), "utf8"),
  );
  for (const dependency of Object.keys(manifest.dependencies || {})) {
    addPackage(dependency, directory);
  }
  for (const dependency of Object.keys(manifest.optionalDependencies || {})) {
    addPackage(dependency, directory, true);
  }
  for (const dependency of Object.keys(manifest.peerDependencies || {})) {
    addPackage(dependency, directory, true);
  }
}

function listPackages(nodeModules, result) {
  if (!fs.existsSync(nodeModules)) return;
  for (const entry of fs.readdirSync(nodeModules, { withFileTypes: true })) {
    if (!entry.isDirectory() && !entry.isSymbolicLink()) continue;
    const entryPath = path.join(nodeModules, entry.name);
    if (entry.name.startsWith("@")) {
      for (const scoped of fs.readdirSync(entryPath, { withFileTypes: true })) {
        if (!scoped.isDirectory() && !scoped.isSymbolicLink()) continue;
        const packagePath = path.join(entryPath, scoped.name);
        result.push(packagePath);
        listPackages(path.join(packagePath, "node_modules"), result);
      }
    } else {
      result.push(entryPath);
      listPackages(path.join(entryPath, "node_modules"), result);
    }
  }
}

scanImports(electronDir);
for (const dependency of entryPackages) addPackage(dependency, appDir);

const installed = [];
listPackages(modulesDir, installed);
installed.sort((left, right) => right.length - left.length);
for (const directory of installed) {
  if (!keep.has(path.resolve(directory))) {
    fs.rmSync(directory, { recursive: true, force: true });
  }
}

console.log(
  `Kept ${keep.size} runtime packages: ${[...entryPackages].sort().join(", ")}`,
);
EOF

	find "$appdir/node_modules" -type d -empty -delete
	find "$appdir/node_modules" -type f \
		\( -name '*.map' -o -name '*.ts' -o -name '*.md' \) -delete
	find "$appdir/node_modules" -path '*/bin/*' -type f -delete

	ln -sf dist "$appdir/public" # fix an upstream path bug

	printf "#!/bin/sh
exec env ELECTRON_ENABLE_LOGGING=1 electron37 /opt/Z-Library/resources/app \"\$@\"
" | install -Dm755 /dev/stdin $pkgdir/usr/bin/z-library
	find $pkgdir -name "*.desktop" -print -exec sed -i "s/^Exec=.*/Exec=z-library/g" {} \;
}
