# Maintainer: Snug Linux
pkgname=colibri-git
pkgver=2.1.0.r5150.g0a5504a1
pkgrel=1
pkgdesc='Colibri hierarchical MoE inference engine (Git source, CPU, web dashboard)'
arch=('x86_64')
url='https://github.com/JustVugg/colibri'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'python')
makedepends=('git' 'base-devel' 'nodejs' 'npm')
provides=('colibri')
conflicts=('colibri' 'colibri-bin')
source=('colibri::git+https://github.com/JustVugg/colibri.git#branch=main')
sha256sums=('SKIP')
options=('!lto')

pkgver() {
  cd "$srcdir/colibri"
  local version count sha
  version=$(sed -nE 's/^__version__[[:space:]]*=[[:space:]]*"([^"]+)".*/\1/p' c/version.py | head -n 1)
  [[ -n $version ]] || { printf 'Cannot determine Colibri version\n' >&2; return 1; }
  version=${version//-/.}
  count=$(git rev-list --count HEAD)
  sha=$(git rev-parse --short=8 HEAD)
  printf '%s.r%s.g%s\n' "$version" "$count" "$sha"
}

build() {
  cd "$srcdir/colibri"

  # CPU-only baseline: modern AVX2 x86-64-v3, no native CPU-specific flags.
  # Use upstream's complete install dependency list to build all supported engines.
  make -C c -j4 ARCH=x86-64-v3 VK=0 CUDA=0 HIP=0 METAL=0 \
    colibri glm53 inkling kimi_k3 olmoe qwen36 qwen38 \
    deepseek_v41 mimo qwenimage laya gliner_decide

  # The optional dashboard is installed by `make install` when web/dist exists.
  cd "$srcdir/colibri/web"
  if [[ -f package-lock.json ]]; then
    npm ci --no-audit --no-fund
  else
    npm install --no-audit --no-fund
  fi
  npm run build
}

package() {
  cd "$srcdir/colibri"

  # Use an Arch-conventional private package directory.
  make -C c ARCH=x86-64-v3 VK=0 CUDA=0 HIP=0 METAL=0 \
    PREFIX=/usr LIBEXECDIR=/usr/lib/colibri DESTDIR="$pkgdir" install

  # Upstream installs the standalone launcher under /usr/bin, but it derives
  # runtime paths from realpath(__file__). Put the real launcher beside its
  # Python modules/engines and expose a relative symlink under /usr/bin.
  install -Dm755 "$pkgdir/usr/bin/coli" "$pkgdir/usr/lib/colibri/coli"
  rm -f "$pkgdir/usr/bin/coli"
  ln -s ../lib/colibri/coli "$pkgdir/usr/bin/coli"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.md"
  if [[ -f docs/qwen36.md ]]; then
    install -Dm644 docs/qwen36.md "$pkgdir/usr/share/doc/$pkgname/qwen36.md"
  fi

  # Fail the package build if the launcher or Qwen3.6 executable is missing.
  [[ -x "$pkgdir/usr/lib/colibri/coli" ]]
  [[ -x "$pkgdir/usr/lib/colibri/qwen36" ]]
  [[ -f "$pkgdir/usr/lib/colibri/family_registry.py" ]]
  [[ -f "$pkgdir/usr/lib/colibri/web/dist/index.html" ]]
}
