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
pkgver=23.2.2
pkgrel=1
pkgdesc="Cloud-native, distributed SQL database"
url='https://www.cockroachlabs.com'
license=('Apache-2.0' 'BUSL-1.1' 'RefLicense-CCL')
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
  'cockroach.service'
  'cockroach.default'
  'cockroach.sysusers'
  'cockroach.tmpfiles'
)
sha256sums=(
  'bf58a5bccca741d455209a01c530f26148de303ce3e388c59285bca9665a95b5'
  'SKIP'
  'SKIP'
  '6c336d30983d6295995823a134e3cc85a06ef9418339b53cf6f375df816bea51'
  '55f380f5cb201c6afeafbf1a6fb5a6400dbffa0edc134d30960d1d04e3d19ef2'
  '8be2f52529135d8d173bba130e000a187bbadc869ac2c603a4714af435840821'
  'c74cf876197312b91970bdd7832081750d2ab4d47e553bb46f38d57cba52641e'
)

prepare() {
  cat <<'EOF' > "$_pkgname.sh"
#!/usr/bin/env sh
exec /usr/share/cockroach/cockroach "$@"
EOF
}

build() {
  # generate shell completion
  "$_pkgsrc/cockroach" gen autocomplete bash --out "cockroach.bash"
  "$_pkgsrc/cockroach" gen autocomplete zsh --out "cockroach.zsh"

  # generate man pages
  "$_pkgsrc/cockroach" gen man --path "man"
}

package() {
  # binary
  install -Dm755 "$_pkgsrc/cockroach" "$pkgdir/usr/share/cockroach/cockroach"

  # GEOS libraries
  install -Dm644 "$_pkgsrc/lib/libgeos.so" "$pkgdir/usr/share/cockroach/lib/libgeos.so"
  install -Dm644 "$_pkgsrc/lib/libgeos_c.so" "$pkgdir/usr/share/cockroach/lib/libgeos_c.so"

  # script
  install -Dm755 "$_pkgname.sh" "$pkgdir/usr/bin/cockroach"

  # user/group & owned directories
  install -Dm644 "cockroach.sysusers" "$pkgdir/usr/lib/sysusers.d/cockroach.conf"
  install -Dm644 "cockroach.tmpfiles" "$pkgdir/usr/lib/tmpfiles.d/cockroach.conf"

  # services & runtime
  install -Dm644 "cockroach.service" "$pkgdir/usr/lib/systemd/system/cockroach.service"
  install -Dm644 "cockroach.default" "$pkgdir/etc/default/cockroach"

  # man pages
  install -Dm644 "man"/*.1 -t "$pkgdir/usr/share/man/man1/"

  # shell completion
  install -Dm644 cockroach.bash "$pkgdir/usr/share/bash-completion/completions/cockroach"
  install -Dm644 cockroach.zsh  "$pkgdir/usr/share/zsh/site-functions/_cockroach"

  # licenses
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "LICENSE.CCL-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.CCL"
}
