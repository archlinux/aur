# Maintainer: lucas <lucaszhou007@163.com>
pkgname=deepseek-harness-bin-autotrack
pkgver=0.2.3~alpha.3
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness (auto-tracked npm releases)'
arch=('x86_64' 'aarch64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs>=24.9.0' 'pnpm')
makedepends=('npm' 'curl')
options=('!strip')
install="${pkgname}.install"
provides=('dsh' 'deepseek-harness')
conflicts=('dsh' 'dsh-bin' 'deepseek-harness' 'deepseek-harness-bin'
           'deepseek-harness-git' 'deepseek-harness-cli-git')
# pkgver carries npm prereleases as "~" so pacman orders them correctly
# (0.2.2~rc.4 < 0.2.2); the registry tarball name uses "-", map it back.
source=("dsh-${pkgver//\~/-}.tgz::https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-${pkgver//\~/-}.tgz"
        dsh-web.service)
sha256sums=('f1e2f139538f7e15fdf65880bee213171dfb60dd27e7225722d77227c18aec4c'
            '69613f7934e1062261bb47eda8db29fd54e0d6246ebb552dd3c75b31bbe6da27')

prepare() {
  rm -rf npm-root npm-cache
  mkdir -p npm-root/usr npm-cache

  # Stage into $srcdir/npm-root first (not $pkgdir directly): package() stays
  # a pure copy, so a failing npm postinstall cannot leave a half-written tree.
  npm install --global \
    --prefix "$srcdir/npm-root/usr" \
    --cache "$srcdir/npm-cache" \
    --omit=dev \
    --no-audit \
    --no-fund \
    --allow-scripts=@deepseek-ai/dsh-subprocess-local,koffi,node-pty,@google/genai,protobufjs \
    "$srcdir/dsh-${pkgver//\~/-}.tgz"

  # node-addon-require-builtin loads its native binding from an *optional*
  # dependency (node-addon-require-builtin-<platform>). npm silently drops an
  # optional dependency it cannot resolve, and right after upstream publishes a
  # new version the registry can still serve a stale packument, so the tree can
  # end up without the binding and dsh then dies with:
  #   host preparation failed: No usable native binding found for ...
  # Fetch the binding by exact tarball URL (no packument involved) at the
  # version npm picked for the addon, and fail the build unless it loads.
  local dsh_modules="$srcdir/npm-root/usr/lib/node_modules/@deepseek-ai/dsh/node_modules"
  local addon_ver binding
  addon_ver=$(node -p "require('${dsh_modules}/node-addon-require-builtin/package.json').version")
  case "$CARCH" in
    x86_64)  binding=node-addon-require-builtin-linux-x64-gnu ;;
    aarch64) binding=node-addon-require-builtin-linux-arm64-gnu ;;
    *) error "unsupported architecture: $CARCH" ;;
  esac
  curl --fail --location --retry 3 --retry-delay 2 \
    --output "$srcdir/${binding}.tgz" \
    "https://registry.npmjs.org/${binding}/-/${binding}-${addon_ver}.tgz"
  mkdir -p "$dsh_modules/${binding}"
  bsdtar -xzf "$srcdir/${binding}.tgz" -C "$dsh_modules/${binding}" --strip-components=1

  ( cd "$srcdir/npm-root/usr/lib/node_modules/@deepseek-ai/dsh" &&
    node -e "require('node-addon-require-builtin')" )
}

package() {
  cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"

  install -Dm644 "$srcdir/package/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # systemd integration: one plain per-user unit (dsh-web.service) that boots
  # the "web" profile. Nothing is enabled by default — starting a service for
  # every user is the user's call, not the package's. Adopters opt in:
  #   systemctl --user enable --now dsh-web.service
  install -Dm644 "$srcdir/dsh-web.service" \
    "$pkgdir/usr/lib/systemd/user/dsh-web.service"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
