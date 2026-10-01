# Maintainer: roehistat <mail at iyxeyl.me>

pkgname=critique
pkgver=0.3.1
pkgrel=1
pkgdesc="A beautiful terminal UI for reviewing git diffs with syntax highlighting"
arch=(x86_64)
url="https://github.com/remorses/critique"
license=('MIT')
depends=(git)
makedepends=(bun)
options=('!strip' '!debug')

source=("$pkgname::git+$url.git#tag=$pkgname@$pkgver")
sha256sums=('e6d279f75f19848b6ca2f16acf84f34ac27d5e7f2b5f3c69fc4a92334d813832')

prepare() {
  cd "$pkgname"

  # PDF export reads the font from a path relative to the entry point, which in
  # a compiled executable is the bunfs root (where the --asset below lands)
  sed -i \
    's|join(import.meta.dir, "..", "public", "jetbrains-mono-nerd.ttf")|join(import.meta.dir, "jetbrains-mono-nerd.ttf")|g' \
    cli/src/cli.tsx
  [[ $(grep -c 'join(import.meta.dir, "jetbrains-mono-nerd.ttf")' cli/src/cli.tsx) -eq 3 ]]
}

build() {
  cd "$pkgname"
  bun install --frozen-lockfile --linker isolated

  # @parcel/watcher picks its prebuilt native module with a dynamic require()
  # that a compiled executable cannot resolve; pin the glibc build instead
  local watcher
  watcher=$(readlink -f cli/node_modules/@parcel/watcher)
  sed -i \
    's|binding = require(name);|binding = require("@parcel/watcher-linux-x64-glibc");|' \
    "$watcher/index.js"
  grep -q 'require("@parcel/watcher-linux-x64-glibc")' "$watcher/index.js"

  # the tree-sitter worker is spawned by its bunfs path, so build it as an
  # entry point at the bunfs root with a resolvable web-tree-sitter next to it
  local takumi webtree worker
  takumi=$(readlink -f cli/node_modules/@takumi-rs/core/../../@takumi-rs/core-linux-x64-gnu/core.linux-x64-gnu.node)
  webtree=$(readlink -f cli/node_modules/@opentuah/core/../../web-tree-sitter)
  worker=$(readlink -f cli/node_modules/@opentuah/core/parser.worker.js)
  [[ -f $takumi && -d $webtree && -f $worker ]] || return 1

  cp -L "$worker" parser.worker.js
  ln -sfn "$webtree" node_modules/web-tree-sitter

  bun build --compile \
    cli/src/cli.tsx \
    parser.worker.js \
    --asset cli/src/queries/json/highlights.scm \
    --asset cli/src/parsers/tree-sitter-prisma.wasm \
    --asset cli/public/jetbrains-mono-nerd.ttf \
    --asset "$takumi" \
    --outfile dist/critique
}

check() {
  cd "$pkgname"
  local output
  output=$(./dist/critique --version)
  [[ $output == "critique/$pkgver"* ]]
}

package() {
  cd "$pkgname"
  install -Dm755 dist/critique "$pkgdir/usr/bin/critique"
}
