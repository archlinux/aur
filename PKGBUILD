# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Angelo Verlain  <hey@vixalien.com>

pkgname=supabase-bin
pkgver=2.99.0
pkgrel=2
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=(aarch64 x86_64)
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/supabase/cli"
license=(MIT)
provides=(supabase)
conflicts=(supabase)

source=(https://github.com/supabase/cli/blob/v$pkgver/apps/cli-go/LICENSE)
sha256sums=("7fd53b5a3bafcf1b92e1fa8952a23a585465a911727bb91e295852f6bd2c4ab0")

source_x86_64=("$_url/releases/download/v$pkgver/supabase_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_url/releases/download/v$pkgver/supabase_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=("c6e491e57776d3c8214dbc026eb08e24133f68ab09014d33bb6819daa771aa0c")
sha256sums_aarch64=("bb8eb6d5e4a9d47fa8ff5a125b00c24073ea8dbbdfc76628976900ca3830b488")

prepare() {
  cd "$srcdir"
  mkdir -p completions
  chmod +x ./supabase
}

build() {
  cd /tmp  # does not work if run in srcdir
  for _sh in bash fish zsh; do
    "$srcdir"/supabase --completions "$_sh" > "$srcdir/completions/supabase.$_sh"
  done
}

package() {
  cd "$srcdir"
  install -vDm755 supabase "$pkgdir/usr/bin/supabase"
  install -vDm644 LICENSE "$pkgdir/usr/share/licenses/supabase-bin/LICENSE"

  cd completions
  install -vDm644 supabase.bash "$pkgdir/usr/share/bash-completion/completions/supabase"
  install -vDm644 supabase.fish "$pkgdir/usr/share/fish/vendor_completions.d/supabase.fish"
  install -vDm644 supabase.zsh "$pkgdir/usr/share/zsh/site-functions/_supabase"
}
