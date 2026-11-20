# Maintainer: AUR maintainer
# Stoat's official Solid.js web client (static site; no Node.js runtime required).
pkgname=stoat-for-web
pkgver=0.17.0
pkgrel=2
pkgdesc='Official Stoat web client for self-hosted instances (static assets)'
arch=('any')
url='https://github.com/stoatchat/for-web'
license=('AGPL-3.0-or-later')
# Python is only used when materializing a configured static document root.
depends=('python')
makedepends=('git' 'corepack' 'nodejs>=24' 'python' 'make' 'gcc')
optdepends=('nginx: serve the generated web assets with Nginx')
backup=('etc/stoat-web/config')

# Pinned to upstream's stoat-for-web-v0.17.0 tag and its gitlink submodules.
_web_commit='9fd140a85de494482666bd98cd00fef427ffe3da'
_sdk_commit='e88f6aa2de5c283785fdb5669a150719346bb082'
_livekit_commit='a67176da7f0580ea9fdad22e58a963668f047fca'

source=(
  "for-web::git+https://github.com/stoatchat/for-web.git#commit=${_web_commit}"
  "stoat-js::git+https://github.com/stoatchat/javascript-client-sdk.git#commit=${_sdk_commit}"
  "solid-livekit-components::git+https://github.com/stoatchat/javascript-solid-livekit-components.git#commit=${_livekit_commit}"
  'stoat-for-web.conf'
  'stoat-for-web-render'
  '90-stoat-for-web.hook'
  'nginx-stoat-for-web.conf'
  'README.arch.md'
)
sha256sums=(
  'SKIP'
  'SKIP'
  'SKIP'
  '2a42258707c9c14b55f0ed05ca2edbbd8b190408e6e8c099421c51b265be244b'
  '5f68d162cc535de10e6e297534a27af42c9ad77295787ce94e93ee4c47675942'
  'c98047cb3ff48eec00da21788aaf6210ced7731ece3338f97ab84c0bfd31ccab'
  'de10e53514eaedd5d4abe602143925ec7511695169c884b381b69a0be11a0119'
  '2bb40c4183e9b89246c5f2a2920da024153b812e7ced3c4eff356a7312c36c0a'
)

prepare() {
  cd "$srcdir/for-web"

  # Never fetch submodules implicitly: all public submodules have pinned VCS sources.
  local actual
  actual="$(git ls-tree HEAD packages/stoat.js | awk '{print $3}')"
  [[ "$actual" == "$_sdk_commit" ]] || { echo 'stoat.js gitlink mismatch' >&2; return 1; }
  actual="$(git ls-tree HEAD packages/solid-livekit-components | awk '{print $3}')"
  [[ "$actual" == "$_livekit_commit" ]] || { echo 'livekit gitlink mismatch' >&2; return 1; }

  rm -rf packages/stoat.js packages/solid-livekit-components
  cp -a "$srcdir/stoat-js" packages/stoat.js
  cp -a "$srcdir/solid-livekit-components" packages/solid-livekit-components

  # The private brand/assets git submodule is deliberately not fetched.
  # copyAssets.mjs has a public fallback: scripts/assets_fallback.
  # Use Corepack to select the exact pnpm@11.3.0 from packageManager.
  export COREPACK_HOME="$srcdir/.corepack"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0
  corepack pnpm install --frozen-lockfile
}

build() {
  cd "$srcdir/for-web"
  export COREPACK_HOME="$srcdir/.corepack"
  export COREPACK_ENABLE_DOWNLOAD_PROMPT=0

  corepack pnpm --filter stoat.js build
  corepack pnpm --filter solid-livekit-components build
  corepack pnpm --filter client exec lingui compile --typescript
  corepack pnpm --filter client exec node scripts/copyAssets.mjs
  corepack pnpm --filter client exec panda codegen
  corepack pnpm --filter client exec lingui extract
  corepack pnpm --filter client exec lingui compile --typescript

  # These placeholders are resolved after installation, not at AUR build time.
  export VITE_HOST='__VITE_HOST__'
  export VITE_API_URL='__VITE_API_URL__'
  export VITE_DEV_WS_URL='__VITE_WS_URL__'
  export VITE_DEV_MEDIA_URL='__VITE_MEDIA_URL__'
  export VITE_DEV_PROXY_URL='__VITE_PROXY_URL__'
  export VITE_DEV_GIFBOX_URL='__VITE_GIFBOX_URL__'
  export VITE_RNNOISE_WORKLET_CDN_URL='__VITE_RNNOISE_WORKLET_CDN_URL__'
  export BASE_PATH='/' PWA_SCOPE='/'
  export NODE_OPTIONS="${NODE_OPTIONS:+$NODE_OPTIONS }--max-old-space-size=4096"

  corepack pnpm --filter client exec vite build
  test -s packages/client/dist/index.html
}

package() {
  install -dm755 "$pkgdir/usr/share/webapps/stoat-web/dist"
  cp -a "$srcdir/for-web/packages/client/dist/." "$pkgdir/usr/share/webapps/stoat-web/dist/"

  install -Dm644 "$srcdir/stoat-for-web.conf" "$pkgdir/etc/stoat-web/config"
  install -Dm755 "$srcdir/stoat-for-web-render" "$pkgdir/usr/bin/stoat-for-web-render"
  install -Dm644 "$srcdir/90-stoat-for-web.hook" "$pkgdir/usr/share/libalpm/hooks/90-stoat-for-web.hook"
  install -Dm644 "$srcdir/nginx-stoat-for-web.conf" "$pkgdir/usr/share/doc/$pkgname/nginx.conf"
  install -Dm644 "$srcdir/README.arch.md" "$pkgdir/usr/share/doc/$pkgname/README.arch.md"
  install -Dm644 "$srcdir/for-web/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
