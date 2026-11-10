# Maintainer: Snug Linux
pkgname=colibri-git
pkgver=2.1.0.r5150.g0a5504a1
pkgrel=3
pkgdesc='Colibri hierarchical MoE inference engine (Git source, CPU, web dashboard)'
arch=('x86_64')
url='https://github.com/JustVugg/colibri'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'python' 'util-linux')
makedepends=('git' 'base-devel' 'nodejs' 'npm')
provides=('colibri')
conflicts=('colibri' 'colibri-bin')
source=('colibri::git+https://github.com/JustVugg/colibri.git#branch=main'
        'colibri@.service'
        'colibri-instance'
        'qwen3-coder-30b.conf.example'
        'qwen36.conf.example'
        'README-uk.md'
        'README.md')
sha256sums=('SKIP'
            '0c07d5039b809f9c77962fe5a7d25484504b294f1bc0c165fefd8c19a33593df'
            'a1b986ba67171653b4eba95abac2e6e970a2a04fb45efba082d832ca507264a2'
            '1badbf946a26d164049beef4db143f7706b7f66f1fa97471b9185063c082f2af'
            'ef8e4df278db90613cdb42e6ae7f7ed6866765cdbf93ca7763e84da33a7117fa'
            '31c6f4630cd5e5af3568c126caf542d981417a5ddefcd779b9468b1b6801b8cd'
            '96aa76f1bacadd63da36d3060751116c4ad260a2d26040c7a2750c3ba5d6717d')
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

  # Template unit and reusable launcher. Create an empty /etc/colibri
  # directory owned by the package; instance configs remain user-managed.
  install -d -m755 "$pkgdir/etc/colibri"
  install -Dm644 "$srcdir/colibri@.service" "$pkgdir/usr/lib/systemd/system/colibri@.service"
  install -Dm755 "$srcdir/colibri-instance" "$pkgdir/usr/lib/colibri/colibri-instance"
  install -Dm644 "$srcdir/qwen3-coder-30b.conf.example" "$pkgdir/usr/share/$pkgname/qwen3-coder-30b.conf.example"
  install -Dm644 "$srcdir/qwen36.conf.example" "$pkgdir/usr/share/$pkgname/qwen36.conf.example"
  install -Dm644 "$srcdir/README-uk.md" "$pkgdir/usr/share/doc/$pkgname/README-uk.md"
  install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 README.md "$pkgdir/usr/share/doc/$pkgname/README.upstream.md"
  if [[ -f docs/qwen36.md ]]; then
    install -Dm644 docs/qwen36.md "$pkgdir/usr/share/doc/$pkgname/qwen36.md"
  fi

  [[ -d "$pkgdir/etc/colibri" ]]
  [[ -f "$pkgdir/usr/share/$pkgname/qwen3-coder-30b.conf.example" ]]
  [[ -f "$pkgdir/usr/share/$pkgname/qwen36.conf.example" ]]
  [[ -f "$pkgdir/usr/lib/systemd/system/colibri@.service" ]]
  [[ -x "$pkgdir/usr/lib/colibri/colibri-instance" ]]

  # Fail the package build if the launcher or Qwen3.6 executable is missing.
  [[ -x "$pkgdir/usr/lib/colibri/coli" ]]
  [[ -x "$pkgdir/usr/lib/colibri/qwen36" ]]
  [[ -f "$pkgdir/usr/lib/colibri/family_registry.py" ]]
  [[ -f "$pkgdir/usr/lib/colibri/web/dist/index.html" ]]
}
