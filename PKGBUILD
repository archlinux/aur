# Maintainer: AlterSend contributors
# Co-maintainer: denislupookov

pkgname=altersend-git
pkgver=1.7.0.r0.g697785f
pkgrel=1
pkgdesc='Private peer-to-peer file transfer application'
arch=('x86_64' 'aarch64')
url='https://altersend.com/'
license=('Apache-2.0')
depends=('gtk3' 'libnotify' 'libsecret' 'libxss' 'nss')
makedepends=('git' 'nodejs' 'npm')
provides=('altersend')
conflicts=('altersend')
source=("${pkgname}::git+https://github.com/denislupookov/altersend.git#branch=main")
b2sums=('SKIP')

pkgver() {
  cd "$srcdir/$pkgname"
  git describe --long --tags --abbrev=7 | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  cd "$srcdir/$pkgname"

  npm ci --ignore-scripts

  # electron-builder's npm collector is incompatible with npm 12's output for
  # this workspace. Its built-in filesystem traversal collector avoids npm's
  # JSON command entirely.
  sed -i \
    's/const pmApproaches = \[await packager.getPackageManager(), node_module_collector_1.PM.TRAVERSAL\];/const pmApproaches = [node_module_collector_1.PM.TRAVERSAL];/' \
    node_modules/app-builder-lib/out/util/appFileCopier.js
  grep -F 'const pmApproaches = [node_module_collector_1.PM.TRAVERSAL];' \
    node_modules/app-builder-lib/out/util/appFileCopier.js

  npm run desktop:build

  local electron_arch
  case "$CARCH" in
    x86_64) electron_arch=x64 ;;
    aarch64) electron_arch=arm64 ;;
  esac

  (
    cd apps/desktop
    ../../node_modules/.bin/electron-builder --linux --"$electron_arch" --dir \
      -c electron-builder.linux.json --publish never
  )
}

package() {
  cd "$srcdir/$pkgname"

  install -d "$pkgdir/usr/lib/altersend"
  cp -a apps/desktop/out/linux-unpacked/. "$pkgdir/usr/lib/altersend/"

  install -Dm755 /dev/stdin "$pkgdir/usr/bin/altersend" <<'EOF'
#!/bin/sh
exec /usr/lib/altersend/altersend "$@"
EOF

  install -Dm644 flatpak/com.altersend.AlterSend.desktop \
    "$pkgdir/usr/share/applications/com.altersend.AlterSend.desktop"
  install -Dm644 assets/01-logo-icon-logo-icon-512x512.png \
    "$pkgdir/usr/share/icons/hicolor/512x512/apps/com.altersend.AlterSend.png"
}
