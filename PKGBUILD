# Maintainer:
# Contributor: Riccardo Berto <riccardo at rcrdbrt dot-symbol com>
# Contributor: Moses Narrow <moe-narrow@use.startmail.com>
# Contributor: Dimitris Kiziridis <ragouel at outlook dot com>
# Contributor: Konrad Tegtmeier <konrad.tegtmeier+aur@gmail.com>
# Contributor: Marcel O'Neil <marcel@marceloneil.com>

_pkgname=cockroachdb
pkgname="$_pkgname-bin"
pkgver=23.1.12
pkgrel=1
pkgdesc="Cloud-native, distributed SQL database"
url='https://www.cockroachlabs.com'
license=('Apache' 'BSL' 'CCL')
arch=('x86_64')

conflicts=("$_pkgname=${pkgver}")
provides=("$_pkgname")

# https://www.cockroachlabs.com/docs/releases/

_pkgsrc="cockroach-v$pkgver.linux-amd64"
source=(
  "$_pkgname-$pkgver.tar.gz"::"https://binaries.cockroachdb.com/$_pkgsrc.tgz"
  'LICENSE'::'https://raw.githubusercontent.com/cockroachdb/cockroach/v${pkgver}/LICENSE'
  'cockroach.service'
  'cockroach.default'
  'cockroach.sysusers'
  'cockroach.tmpfiles'
)
sha256sums=(
  '980ff363521922725c63814696a7385943ca46f3c0bea21322ded9591de33ed2'
  '8a2fba9d26592ff3538f44c96d1b894ef44649058b4d04f3fda49518a9c4ae11'
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

  # GEOS libraries # https://www.cockroachlabs.com/docs/stable/install-cockroachdb-linux.html
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
  install -Dm644 "LICENSE" -t "$pkgdir/usr/share/licenses/$pkgname/"
}
