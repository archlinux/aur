# Maintainer: Julien Virey <julien.virey@gmail.com>

pkgname=profilarr
pkgver=2.2.0
pkgrel=2
pkgdesc="Configuration Management Platform for Radarr/Sonarr"
arch=('x86_64')
url="https://github.com/Dictionarry-Hub/profilarr"
license=('AGPL-3.0-only')
depends=(sqlite)
makedepends=(deno)
options=(!strip)
backup=(etc/profilarr/profilarr.env)
source=(
  "$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/v$pkgver.tar.gz"
  profilarr.env
  profilarr.service
  profilarr.sysusers
  profilarr.tmpfiles
)
sha256sums=('45e70ddfdca57c929e9df61b8c41d4c6ee465412c85a133e77c9d9d0de5d4283'
            '78e0fc2bb22b9d68a45451eb1c5fba394c0bb90e20d3a11e215dddd3a6463976'
            '7129166a5a4d5b08d830c9556252eaf7f05d0a4f31b0da708d8d4bccfea78d2d'
            '111c8a11133470edb6b155a5e42aec7d904176e7f633d8f1922f1b1b57daade2'
            '5e9ccf541c980e1a0742a2cf3e36338ac02430a742a7a3c4bc209a5136c9e577')

build() {
  cd "$pkgname-$pkgver"
  export APP_BASE_PATH=build/dist/build
  export VITE_CHANNEL=stable
  export VITE_PLATFORM=linux-amd64
  export PROFILARR_VERSION=$pkgver
  export PROFILARR_COMMIT=unknown
  export PROFILARR_BUILT_AT=$(date -u +"%Y-%m-%dT%H:%M:%SZ")
  # Use system libsqlite3
  export DENO_SQLITE_PATH=/usr/lib/libsqlite3.so
  export DENO_DIR="$srcdir/deno-cache"

  cat > src/lib/shared/build.ts <<EOF
export type Channel = 'stable' | 'develop' | 'dev';

export interface BuildInfo {
        readonly version: string;
        readonly channel: Channel;
        readonly commit: string | null;
        readonly builtAt: string | null;
}

export const build: BuildInfo = {
        version: '${PROFILARR_VERSION}',
        channel: '${VITE_CHANNEL}',
        commit: '${PROFILARR_COMMIT}',
        builtAt: '${PROFILARR_BUILT_AT}'
};
EOF

  deno install --node-modules-dir

  deno run -A npm:vite build
  deno eval "import { hash } from '@felix/bcrypt'; await hash('profilarr')"
  deno compile \
    --no-check \
    --allow-net \
    --allow-read \
    --allow-write \
    --allow-env \
    --allow-ffi \
    --allow-run \
    --allow-sys \
    --target x86_64-unknown-linux-gnu \
    --output dist/build/profilarr \
    dist/build/mod.ts
}

package() {
  # Systemd
  install -Dm644 "$pkgname.env" "$pkgdir/etc/$pkgname/$pkgname.env"
  install -Dm755 "$pkgname.service" "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -Dm644 "$pkgname.sysusers" "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -Dm644 "$pkgname.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  # App
  cd "$pkgname-$pkgver"
  install -dm755 "$pkgdir/usr/share/webapps/profilarr"
  cp -r dist/build/{static,server.js,$pkgname} "$pkgdir/usr/share/webapps/profilarr/"
  install -dm755 "$pkgdir/usr/share/webapps/profilarr/deno-cache"
  cp -r "$srcdir/deno-cache/plug" "$pkgdir/usr/share/webapps/profilarr/deno-cache/plug"
}
