# Maintainer: Yakov Till <yakov.till@gmail.com>

pkgname=fuzzilli-git
pkgver=0.9.3.r1453.g3f902407
pkgrel=1
pkgdesc='Coverage-guided fuzzer for dynamic language interpreters based on FuzzIL'
arch=('x86_64')
url='https://github.com/googleprojectzero/fuzzilli'
license=('Apache-2.0')
depends=('nodejs' 'swift-bin')
makedepends=('git' 'nodejs' 'npm' 'python' 'swift-bin')
provides=('fuzzilli')
conflicts=('fuzzilli')
source=(
  'fuzzilli::git+https://github.com/googleprojectzero/fuzzilli.git'
  'swift-protobuf::git+https://github.com/apple/swift-protobuf.git#tag=1.35.0'
  'swift-collections::git+https://github.com/apple/swift-collections.git#tag=1.2.1'
  'swift-algorithms::git+https://github.com/apple/swift-algorithms.git#tag=1.2.1'
  'swift-protobuf-protobuf::git+https://github.com/protocolbuffers/protobuf#commit=b6f9284da830b69be787732ffdaa35049d20a088'
  'swift-protobuf-abseil::git+https://github.com/abseil/abseil-cpp#commit=76bb24329e8bf5f39704eb10d21b9a80befa7c81'
  'fuzzilli-parser-package-lock.json'
  'npm-tarball-map.json'
  'npm-babel-helper-string-parser-7.29.15.tgz'
  'npm-babel-helper-validator-identifier-7.29.7.tgz'
  'npm-babel-parser-7.29.15.tgz'
  'npm-babel-types-7.29.15.tgz'
  'npm-long-5.3.2.tgz'
  'npm-protobufjs-7.6.6.tgz::https://registry.npmjs.org/protobufjs/-/protobufjs-7.6.6.tgz'
  'npm-protobufjs-aspromise-1.1.2.tgz'
  'npm-protobufjs-base64-1.1.2.tgz'
  'npm-protobufjs-codegen-2.0.5.tgz'
  'npm-protobufjs-eventemitter-1.1.1.tgz'
  'npm-protobufjs-fetch-1.1.1.tgz'
  'npm-protobufjs-float-1.0.2.tgz'
  'npm-protobufjs-path-1.1.2.tgz'
  'npm-protobufjs-pool-1.1.0.tgz'
  'npm-protobufjs-utf8-1.1.2.tgz'
  'npm-types-node-26.6.10.tgz'
  'npm-undici-types-8.9.0.tgz'
)
sha256sums=(
  'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP' 'SKIP'
  'd14dfac777c7b7c546a7f0c52bac5df0aecc114df78bfd6b7fbde6ebc39b0dfd'
  'b69c196e3a440f4185aefe37de375b92efcd7756999ed47bd5b1f6f7f11c3b1b'
  'de3565b544e0cacab7ac1c4930ed388f1d640cd0e025725451fe91b9a52c52a9'
  '7a31904bc45f1bb232d5e5dd797d12296f4a27fb4bf0f6d517827700f997dc1f'
  'f4fcaf81e6a859aa8f1d70234e4da1ce17d6b4c5fc38a1664c8498b1eb978a61'
  '359f34331c91e978d90607e5ac596c5bd7645c9b913902ac5427f803119fdae6'
  '68033e466773df7d52c9e59341bb729d83716cd920c56460395724456d646b26'
  'df0241b3046b505d27396da6eef107f14dffb108f77aa89cfd9611a928eb6dfe'
  '0041878b8209f2fa4bcc5e0666355ebc96ff97f360c3054ffe83dbb78ee1c119'
  'd67e6ee6e1445512478cdfc34c12144f579bdd9f06529eef3ef8d88f84031a6a'
  '20bafed1221bcba23a2450a841998edaef9a56bc2101d6e38c2117dd58a13a01'
  '5536b98cb7062e771c1dadd1828e352ebe40034f1480836f21c776ec372a797c'
  '54481d9c62debce1c38b0239f2358eeb3b73f7bb1ba3105bd6123fd81b8b7268'
  '20b3d612d53281b754602d52a8e6a6e09032169d5399e515f6f5e8b7d3de712d'
  'cc364ee910173c36d5734535a2bb53b8e7e86d2d219f27218158ab3f3dca328c'
  'f721dbd27282d2c7d1c2bf1ae9f7a03cc3ef9cf882fe469a32c14d1dae732703'
  '512bce48e5bb53d4351a415be21c6430e33103ecca831439e7e6cfb7aa3fca7d'
  '9e258696f4be56f38ade7cdce5535d9f6a9cdd40dcc72fc425c6b3b036044bfa'
  '3a587851ccbf1021b20eac8a38eb819d7e2a1ab77aa477cb24cae5473a3e78c6'
)

pkgver() {
  cd "$srcdir/fuzzilli"
  git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

prepare() {
  cd "$srcdir/fuzzilli"

  # swift-protobuf's protoc target needs its two C++ submodules. Redirect every
  # declared git source to the local makepkg checkout and refuse undeclared URLs.
  local -a submodule_rewrites=()
  local entry name source_url
  for entry in "${source[@]}"; do
    [[ $entry == *::git+* ]] || continue
    name=${entry%%::*}
    source_url=${entry#*::git+}
    source_url=${source_url%%#*}
    submodule_rewrites+=(-c "url.${srcdir}/${name}.insteadOf=${source_url}")
  done
  (
    cd "$srcdir/swift-protobuf"
    while read -r _ url; do
      local matched=
      for entry in "${source[@]}"; do
        [[ $entry == *"::git+${url}"* ]] && matched=1 && break
      done
      [[ -n $matched ]] || { echo "undeclared swift-protobuf submodule: $url" >&2; exit 1; }
    done < <(git config -f .gitmodules --get-regexp '^submodule\..*\.url$')
    git "${submodule_rewrites[@]}" -c protocol.allow=never -c protocol.file.allow=always \
      submodule update --init --recursive
  )

  # Upstream declares SwiftPM dependencies by URL. Point them at the pinned
  # makepkg sources so a release cannot move the dependency versions underneath
  # an unchanged package revision.
  python3 - "$srcdir" <<'PY'
import pathlib
import re
import sys

srcdir = pathlib.Path(sys.argv[1])
manifest = srcdir / 'fuzzilli' / 'Package.swift'
text = manifest.read_text()
patterns = (
    (r'\.package\(url: "https://github\.com/apple/swift-protobuf\.git", exact: "1\.35\.0"\)', 'swift-protobuf'),
    (r'\.package\(\s*url: "https://github\.com/apple/swift-collections\.git",\s*\.upToNextMinor\(from: "1\.2\.0"\)\s*\)', 'swift-collections'),
    (r'\.package\(\s*url: "https://github\.com/apple/swift-algorithms\.git",\s*\.upToNextMinor\(from: "1\.2\.1"\)\s*\)', 'swift-algorithms'),
)
for pattern, name in patterns:
    text, count = re.subn(pattern, f'.package(path: "{srcdir / name}")', text)
    if count != 1:
        raise SystemExit(f'expected one Package.swift match for {name}, found {count}')
manifest.write_text(text)
PY

  local parser="$srcdir/fuzzilli/Sources/Fuzzilli/Compiler/Parser"
  cp "$srcdir/fuzzilli-parser-package-lock.json" "$parser/package-lock.json"
  python3 - "$parser/package-lock.json" "$srcdir" "$srcdir/npm-tarball-map.json" <<'PY'
import json
import pathlib
import sys

lock_path, srcdir, map_path = map(pathlib.Path, sys.argv[1:4])
mapping = json.loads(map_path.read_text())
lock = json.loads(lock_path.read_text())
for key, entry in lock['packages'].items():
    if key in mapping:
        entry['resolved'] = (srcdir / mapping[key]).as_uri()
lock_path.write_text(json.dumps(lock, indent=2) + '\n')
PY
  npm ci --offline --ignore-scripts --omit=dev --no-audit --no-fund --prefix "$parser"
}

build() {
  cd "$srcdir/fuzzilli"
  swift build -c release -Xcc "-ffile-prefix-map=${srcdir}/=" \
    -Xlinker -z -Xlinker now
}

check() {
  cd "$srcdir/fuzzilli"
  local bindir
  bindir="$(swift build -c release --show-bin-path)"
  "$bindir/FuzzilliCli" --help >/dev/null
  "$bindir/FuzzILTool" --help >/dev/null
}

package() {
  cd "$srcdir/fuzzilli"
  local bindir exe bundle
  bindir="$(swift build -c release --show-bin-path)"

  install -d "$pkgdir/usr/lib/fuzzilli/bin"
  while IFS= read -r -d '' bundle; do
    cp -r --no-preserve=ownership "$bundle" "$pkgdir/usr/lib/fuzzilli/bin/"
  done < <(find "$bindir" -maxdepth 1 -type d -name '*.bundle' -print0)
  # npm writes the absolute local tarball URLs into this lock file.
  find "$pkgdir/usr/lib/fuzzilli/bin" -name package-lock.json -delete
  find "$pkgdir/usr/lib/fuzzilli/bin" -type f -exec chmod 644 {} +

  install -d "$pkgdir/usr/bin"
  for exe in FuzzilliCli FuzzILTool REPRLRun RelateTool FuzzilliDetectMissingBuiltins; do
    install -m755 "$bindir/$exe" "$pkgdir/usr/lib/fuzzilli/bin/$exe"
    printf '#!/bin/sh\nexec /usr/lib/fuzzilli/bin/%s "$@"\n' "$exe" > "$pkgdir/usr/bin/$exe"
    chmod 755 "$pkgdir/usr/bin/$exe"
  done
}
