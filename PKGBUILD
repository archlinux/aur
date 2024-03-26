# Maintainer:
# Contributor: Riccardo Berto <riccardo at rcrdbrt dot-symbol com>
# Contributor: Moses Narrow <moe-narrow@use.startmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

## Useful URLs:
# https://github.com/cockroachdb/cockroach
# https://www.cockroachlabs.com/docs/releases/
# https://www.cockroachlabs.com/docs/stable/install-cockroachdb-linux.html

_pkgname=cockroachdb
pkgname="$_pkgname-bin"
pkgver=23.2.3
pkgrel=1
pkgdesc="Cloud-native, distributed SQL database"
url='https://www.cockroachlabs.com'
license=('Apache-2.0' 'BUSL-1.1' 'LicenseRef-CCL')
arch=('x86_64')

conflicts=("$_pkgname=${pkgver}")
provides=("$_pkgname")

backup=("etc/default/cockroach")

_pkgsrc="cockroach-v$pkgver.linux-amd64"
_pkgsrc_source="cockroach-$pkgver"
source=(
  "$_pkgname-$pkgver.tar.gz"::"https://binaries.cockroachdb.com/$_pkgsrc.tgz"
  "LICENSE-$pkgver"::"https://github.com/cockroachdb/cockroach/raw/v$pkgver/LICENSE"
  "LICENSE.CCL-$pkgver"::"https://github.com/cockroachdb/cockroach/raw/v$pkgver/licenses/CCL.txt"  
)
sha256sums=(
  '909b7a28ae9362cdbfc44a30b20694e6e271b1d3d1cc63fdfd0ab3370566bed4'
  'SKIP'
  'SKIP'
)

build() {
  # generate shell completion
  "$_pkgsrc/cockroach" gen autocomplete bash --out "cockroach.bash"
  "$_pkgsrc/cockroach" gen autocomplete zsh --out "cockroach.zsh"

  # generate man pages
  "$_pkgsrc/cockroach" gen man --path "man"
}

package() {
  local _install_path='usr/lib'

  # binary
  install -Dm755 "$_pkgsrc/cockroach" "$pkgdir/$_install_path/$_pkgname/cockroach"

  # GEOS libraries
  install -Dm644 "$_pkgsrc/lib/libgeos.so" "$pkgdir/$_install_path/$_pkgname/lib/libgeos.so"
  install -Dm644 "$_pkgsrc/lib/libgeos_c.so" "$pkgdir/$_install_path/$_pkgname/lib/libgeos_c.so"

  # script
  install -Dm755 /dev/stdin "$pkgdir/usr/bin/cockroach" <<EOF
#!/usr/bin/env sh
exec /$_install_path/$_pkgname/cockroach "\$@"
EOF

  # user/group & owned directories
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/sysusers.d/cockroach.conf" <<END
u cockroach - "CockroachDB" /var/lib/cockroach
END

  install -Dm644 /dev/stdin "$pkgdir/usr/lib/tmpfiles.d/cockroach.conf" <<END
d /etc/cockroach 0755 root cockroach - -
d /var/lib/cockroach 0750 cockroach cockroach - -
END

  # services & runtime
  install -Dm644 /dev/stdin "$pkgdir/usr/lib/systemd/system/cockroach.service" <<END
[Unit]
Description=CockroachDB database server
Requires=network-online.target
After=network-online.target

[Service]
User=cockroach
Group=cockroach

EnvironmentFile=-/etc/default/cockroach
ExecStart=/usr/bin/cockroach start --certs-dir /etc/cockroach --store=${COCKROACH_STORE} $COCKROACH_FLAGS
LimitNOFILE=35000

ProtectHome=true
ProtectSystem=full
NoNewPrivileges=true

[Install]
WantedBy=multi-user.target
END

  install -Dm644 /dev/stdin "$pkgdir/etc/default/cockroach" <<END
COCKROACH_FLAGS="--insecure"
COCKROACH_STORE="path=/var/lib/cockroach"
END

  # man pages
  install -Dm644 "man"/*.1 -t "$pkgdir/usr/share/man/man1/"

  # shell completion
  install -Dm644 cockroach.bash "$pkgdir/usr/share/bash-completion/completions/cockroach"
  install -Dm644 cockroach.zsh  "$pkgdir/usr/share/zsh/site-functions/_cockroach"

  # licenses
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "LICENSE.CCL-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.CCL"
}
