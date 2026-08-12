pkgname=atproto-pds
pkgver=0.4.5027
pkgrel=1
pkgdesc='AT Protocol PDS (Personal Data Server)'
url='https://github.com/bluesky-social/pds'
license=(MIT Apache-2.0)
arch=(x86_64 aarch64)
depends=(nodejs)
makedepends=(pnpm)
source=(
  "git+https://github.com/bluesky-social/pds.git#tag=v$pkgver"
  pds.sh
  pdsadmin.sh
  pds.service
  pds.sysusers
  pds.tmpfiles
  pds.env
)
sha256sums=('b2f78935656bdaae95594f0fd35cd1a6cdc980df9c99da1b302e6014ba6b033e'
            '8db83f5e10377fe00577e68c96281a1d1a4ae727e0bc4cca106f8b2785d93ee7'
            '7e4472e1daf25a384726ff725371db3c3ceca09804553043039d9605d7408f38'
            'dc420b300e9c691b5d01a5a384acd9a7e0afe3777b5a97ecd0e0ff07c80b9edc'
            '50117f8e0f2734bdfa1e261998391c0be9184a02a7871aa3a9a4dba96f2fcc3c'
            '62203e9d8b17fbfb34901a32d612ad7884fec175aae5227e8067b01257ac9640'
            '4ed02ea0b523e345939bfe6f756eff9e8d5ca0f31f7a3e2c9f6994f119dd4039')
install="$pkgname.install"
backup=(etc/pds.env)

build() {
  cd "$srcdir/pds/service"
  # Patch newer better-sqlite3 for Node.js 26.x support
  cat >pnpm-workspace.json <<EOF
overrides:
  better-sqlite3: "^12.10.0"
EOF
  # Install library files
  pnpm install --production --no-frozen-lockfile
}

package() {
  mkdir -p "$pkgdir"/{etc,usr/{bin,lib/atproto-pds{,admin}}}
  # Add library files
  install -Dm 0644 "$srcdir/pds/service/index.ts" "$pkgdir/usr/lib/atproto-pds/"
  cp -ar "$srcdir/pds/service/node_modules" "$pkgdir/usr/lib/atproto-pds/"
  # Add entrypoint script for pds application
  install -Dm 0755 "$srcdir/pds.sh" "$pkgdir/usr/bin/pds"
  # Add pdsadmin scripts
  for script in "$srcdir/pds/pdsadmin"/*.sh; do
    target="$pkgdir/usr/lib/atproto-pdsadmin/$(basename "$script")"
    install -Dm 0755 "$script" "$target"
    sed -i 's!/pds/pds.env!/etc/pds.env!g' "$target"
  done
  # Add custom script dispatcher
  install -Dm 0755 "$srcdir/pdsadmin.sh" "$pkgdir/usr/bin/pdsadmin"
  # Add user configuration
  install -Dm 0644 pds.service "${pkgdir}/usr/lib/systemd/system/pds.service"
  install -Dm 0644 pds.sysusers "${pkgdir}/usr/lib/sysusers.d/pds.conf"
  install -Dm 0644 pds.tmpfiles "${pkgdir}/usr/lib/tmpfiles.d/pds.conf"
  # Add default configuration
  install -Dm 0640 pds.env "${pkgdir}/etc/pds.env"
}
