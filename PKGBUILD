# Maintainer: lucas <lucaszhou007@163.com>
pkgname=deepseek-harness-bin-autotrack
pkgver=0.2.2~rc.5
pkgrel=1
pkgdesc='DeepSeek Harness CLI and agent harness (auto-tracked npm releases)'
arch=('x86_64' 'aarch64')
url='https://github.com/deepseek-ai/deepseek-harness'
license=('MIT')
depends=('nodejs>=24.9.0' 'pnpm')
makedepends=('npm')
options=('!strip')
backup=('etc/conf.d/dsh-web')
provides=('dsh' 'deepseek-harness')
conflicts=('dsh' 'dsh-bin' 'deepseek-harness' 'deepseek-harness-bin'
           'deepseek-harness-git' 'deepseek-harness-cli-git')
# pkgver carries npm prereleases as "~" so pacman orders them correctly
# (0.2.2~rc.4 < 0.2.2); the registry tarball name uses "-", map it back.
source=("dsh-${pkgver//\~/-}.tgz::https://registry.npmjs.org/@deepseek-ai/dsh/-/dsh-${pkgver//\~/-}.tgz"
        dsh-web.service
        dsh-web.sysusers
        dsh-web.confd)
sha256sums=('67da5a3c458f46cd278e0eec6ad0e3a44e99fd13087c6f11a1b362268900a52c'
            '3e713da03d126f9b710a83b8c4962c9a76402cc8d15d37f706b5db3b612944e1'
            '009d6a22833c4a0d0c1837dde60353066c45c837da7f1e8d1af47030d22b96eb'
            'e2640ed12ac93aed52a82ce92b01ec7a50a675ed4a2702540a63f59d2846a9f2')

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
}

package() {
  cp -a "$srcdir/npm-root/usr/." "$pkgdir/usr/"

  install -Dm644 "$srcdir/package/LICENSE" \
    "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

  # systemd integration: unit + dedicated user (sysusers.d) + config template
  install -Dm644 "$srcdir/dsh-web.service" \
    "$pkgdir/usr/lib/systemd/system/dsh-web.service"
  install -Dm644 "$srcdir/dsh-web.sysusers" \
    "$pkgdir/usr/lib/sysusers.d/dsh-web.conf"
  install -Dm644 "$srcdir/dsh-web.confd" \
    "$pkgdir/etc/conf.d/dsh-web"

  find "$pkgdir/usr" -type d -exec chmod 755 {} +
  chown -R root:root "$pkgdir"
}
