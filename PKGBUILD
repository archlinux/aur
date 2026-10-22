# Maintainer: Sierra S. <sscoolqaz@protonmail.com>
# Contributor: edu4rdshl <edu4rdshl@protonmail.com>
_pkgname=Vesktop
pkgname=vesktop-bun
pkgdesc="A standalone Electron-based Discord app with Vencord & improved Linux support (built with bun)"
pkgver=1.6.8
pkgrel=1

arch=("x86_64" "aarch64")
url="https://github.com/Vencord/Vesktop"
license=('GPL-3.0-or-later')

depends=('alsa-lib' 'glib2' 'gtk3' 'nss')
makedepends=('bun' 'nodejs' 'jq' 'python')
optdepends=(
  'libnotify: Notifications'
  'xdg-utils: Open links, files, etc'
)
provides=("vesktop=$pkgver")
conflicts=('vesktop' 'vesktop-bin')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/Vencord/Vesktop/archive/v${pkgver}.tar.gz" "vesktop.desktop" "vesktop.sh")

sha256sums=('91dd4630fb5fff153586056451a9587f4c5fbeb048c6d570a35056460415f22f'
            '98fa8f661b065c2d825e24f0055a40ae01d58d23628ad7ebf6914296209dd43c'
            'c17c193d4e35188916a8032505fa1c42b994309b9666d90a72d91f2ceac77752')

prepare() {
  cd "$srcdir/$_pkgname-$pkgver"

  # packageManager pins pnpm, which makes electron-builder look for pnpm.
  # bun can't migrate pnpm's relative link: deps (oven-sh/bun#23026). libvesktop
  # is only a type import there; bun still builds it from source as a workspace
  # (node-gyp), and scripts/build/build.mts picks up that local build.
  sed -i '/^      libvesktop:$/,+2d' pnpm-lock.yaml
  jq 'del(.devDependencies.libvesktop, .packageManager)
      | .trustedDependencies = ["electron", "esbuild", "@vencord/venmic"]' \
    package.json > package.json.new
  mv package.json.new package.json

  # Keep upstream's pinned versions by migrating pnpm-lock.yaml to bun.lock.
  bun pm migrate
  # github: deps carry pnpm's codeload tarball hash, which never matches the
  # tarball bun fetches. They stay pinned by commit, so drop the hash.
  sed -i -E '/^    "[^"]+": \["[^"]+@github:/ s/, "sha512-[^"]*"\],$/],/' bun.lock
}

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  # Upstream installs with pnpm's nodeLinker=hoisted; bun's default isolated
  # linker hides app-builder-lib from scripts/build/sandboxFix.mjs.
  bun install --frozen-lockfile --linker hoisted
  bun run build
  bun x electron-builder --dir
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  case "${CARCH}" in
    "aarch64") folder="linux-arm64-unpacked" ;;
    *) folder="linux-unpacked" ;;
  esac

  install -d "$pkgdir/usr/lib/vesktop"
  cp -R "dist/${folder}/." "$pkgdir/usr/lib/vesktop"

  install -Dm644 "../vesktop.desktop" "$pkgdir/usr/share/applications/vesktop.desktop"
  install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "build/icon.svg" "$pkgdir/usr/share/icons/hicolor/scalable/apps/vesktop.svg"
  install -Dm755 "../vesktop.sh" "$pkgdir/usr/bin/vesktop"
}
