# Maintainer: Ewout van Mansom <ewout@vanmansom.name>
# Contributor: Carl Smedstad <carsme@archlinux.org>
# Contributor: Sven-Hendrik Haase <svenstaro@archlinux.org>

pkgname=opencode-poc-gemma4
_pkgname=opencode
pkgver=1.4.3
pkgrel=1
pkgdesc='The open source coding agent (Proof-of-Concept Gemma4 support)'
arch=('x86_64')
url='https://github.com/anomalyco/opencode'
license=('MIT')
depends=(
  'curl'
  'glibc'
  'icu'
  'ripgrep'
  'tar'
)
checkdepends=(
  'nodejs-lts-jod'
)
makedepends=(
  'bun'
  'git'
  'go'
)
optdepends=(
  'wl-clipboard: clipboard support on Wayland'
  'xclip: clipboard support on X11'
)
conflicts=(
  'opencode'
)
options=(
  '!debug'
  '!strip'
)
source=("git+$url.git#tag=v$pkgver"
	"0001-feat-add-Gemma-4-model-support-with-FC-format-tool-d.patch"
        "0002-fix-compaction-buffer-overflow-for-small-context-win.patch"
        "0003-feat-restructure-Go-AST-tools-into-individual-FC-for.patch"
        "0004-feat-schema-flattening-Go-AST-knowledge-base-and-rea.patch")
b2sums=('3872581e7e353af9eab52d0c7462ff09f85867dd339431a70ad6abf9f110799e7e9e8ee37b5b1bab1fecf217bc63a172209ee6bfd0492299602b2354ef6c779b'
        '4eb4bad42f8c097ed70097b77e53a494584f4dd2bbe68349cfb216934d9d8b3e2717eaaf1f9e408b713e5d0443f873bb689837ef0ba489351b3dcfc757460303'
        '225c1b60efb0d87436fde6ba871e17f331ab9e80f8ea3cb07e9d1784d35321ada55fe0c0dcc084ecd3ad41f63e8b0684875e3fb7bd605f3ccd0ef6e7b4afc22c'
        'c9a49b588f5298c7c96a67939c98ca6a56f010842b35ef9b6a56d266f0b3ecd20ba4b27ffe0cb7b729e10b17aedb7cfefa76adad42acacc7ff22f97a041be737'
        '6c97b52196ca3ac21ecab54be1f85981a52fa72a5e74e81d7e15d3c46a8c959a5ec8afe49d774f34dac49ca685606c5057b2bef9c99eef5fa1cb0f28855673c0')

prepare() {
  cd $_pkgname

  patch -Np1 -i ../0001-feat-add-Gemma-4-model-support-with-FC-format-tool-d.patch
  patch -Np1 -i ../0002-fix-compaction-buffer-overflow-for-small-context-win.patch
  patch -Np1 -i ../0003-feat-restructure-Go-AST-tools-into-individual-FC-for.patch
  patch -Np1 -i ../0004-feat-schema-flattening-Go-AST-knowledge-base-and-rea.patch

  #local src
  #for src in "${source[@]}"; do
  #  src="${src%%::*}"
  #  src="${src##*/}"
  #  [[ $src = *.patch ]] || continue
  #  git -c user.name='build' -c user.email='build@localhost' am "$srcdir/$src"
  #done

  bun install --frozen-lockfile --ignore-scripts

  # Remove flaky expect, prone to filesystem options?
  # https://github.com/anomalyco/opencode/blob/a5b1dc081d589598168c0e0d9346a35aeb58548b/packages/opencode/test/plugin/meta.test.ts#L60
  sed '/.*expect.*three.entry.modified.*/d' -i packages/opencode/test/plugin/meta.test.ts
}

build() {
  cd $_pkgname/packages/opencode

  # Build Go AST helper binary
  cd goast
  go build -trimpath -o goast .
  cd ..

  # Patch go-ast-exec.ts to use installed binary instead of go run
  sed -i \
    -e 's|spawn("go", \["run", "\."\], {|spawn("/usr/lib/opencode/goast", [], {|' \
    -e '/cwd: GOAST_DIR,/d' \
    src/tool/go-ast-exec.ts

  OPENCODE_VERSION=$pkgver bun run ./script/build.ts --single --baseline --skip-install
}

check() {
  cd $_pkgname/packages/opencode
  export GIT_CONFIG_GLOBAL=$PWD/gitconfig
  git config --global user.email "builduser@archlinux.org"
  git config --global user.name "Build User"
  bun test
}

package() {
  cd $_pkgname
  case $CARCH in
  aarch64) dir=opencode-linux-arm64 ;;
  x86_64) dir=opencode-linux-x64-baseline ;;
  esac
  install -vDm755 -t "$pkgdir/usr/bin" "packages/opencode/dist/$dir/bin/opencode"
  install -vDm755 "packages/opencode/goast/goast" "$pkgdir/usr/lib/opencode/goast"

  install -vDm644 -t "$pkgdir/usr/share/licenses/$_pkgname" LICENSE

  SHELL=/bin/bash "$pkgdir/usr/bin/opencode" completion \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/opencode"
  SHELL=/bin/zsh "$pkgdir/usr/bin/opencode" completion \
    | install -vDm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_opencode"
}
