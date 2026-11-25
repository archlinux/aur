# Maintainer: Marcel W. Wysocki <maci.stgn@gmail.com>
pkgname=paseo-bun
pkgver=0.17.4.bun.3
pkgrel=1
pkgdesc='Paseo desktop and daemon with native Bun AOT, Elysia, Tauri v2 and UI performance patches'
arch=('x86_64')
url='https://github.com/maci0/paseo-bun'
license=('Apache-2.0')
depends=('glibc' 'gcc-libs' 'gtk3' 'webkit2gtk-4.1' 'openssl' 'zlib' 'git')
makedepends=('bun' 'nodejs>=24' 'npm' 'rust' 'pkgconf')
optdepends=('openssh: SSH connections and Git remotes')
conflicts=('paseo-bun-bin')
options=('!strip' '!debug')
_commit=e346c362a266ec5935e23542b7b46ab5eab99ed7
source=("paseo-bun-source::git+${url}.git#commit=${_commit}")
sha256sums=('SKIP')

prepare() {
  cd "$srcdir/paseo-bun-source"
  local _help
  _help=$(bun compile --help 2>&1) || _help=''
  if [[ $_help != *'--aot-allow-code-from-disk'* ]]; then
    printf '%s\n' 'An AOT-capable Bun compiler must be first in PATH (see docs/bun.md).' >&2
    return 1
  fi
  npm ci --ignore-scripts --no-audit --no-fund
  npm run postinstall
}

build() {
  cd "$srcdir/paseo-bun-source"
  bun run build:desktop:bun
}

check() {
  cd "$srcdir/paseo-bun-source"
  bun test scripts/linux-desktop.test.ts scripts/aot-module-path.test.ts scripts/trace-path.test.ts
  bun run test:bun
}

package() {
  local _bundle="$srcdir/paseo-bun-source/dist/paseo-bun"
  install -dm755 "$pkgdir/usr/lib/paseo-bun" "$pkgdir/usr/bin"
  cp -a "$_bundle/." "$pkgdir/usr/lib/paseo-bun/"
  ln -s ../lib/paseo-bun/paseo-bun "$pkgdir/usr/bin/paseo-bun"
  ln -s ../lib/paseo-bun/paseo-bun-desktop "$pkgdir/usr/bin/paseo-bun-desktop"
  install -Dm644 "$_bundle/share/applications/sh.paseo.bun.desktop" "$pkgdir/usr/share/applications/sh.paseo.bun.desktop"
  install -Dm644 "$_bundle/share/icons/hicolor/256x256/apps/sh.paseo.bun.png" "$pkgdir/usr/share/icons/hicolor/256x256/apps/sh.paseo.bun.png"
  install -Dm644 "$_bundle/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
