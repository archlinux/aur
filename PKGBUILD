# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Angelo Verlain  <hey@vixalien.com>

pkgname=supabase-bin
pkgver=2.113.0
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=(aarch64 x86_64)
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/supabase/cli"
license=(MIT)
provides=(supabase)
conflicts=(supabase)
options=(!strip)  # breaks Bun packaging

source=("LICENSE.$pkgver::https://raw.githubusercontent.com/supabase/cli/refs/tags/v$pkgver/apps/cli-go/LICENSE")
sha256sums=("81f7d60afa4316010b1c0df8eb8f0c80b27586a86b72f1bde85e129bfd10d52a")

source_x86_64=("$_url/releases/download/v$pkgver/supabase_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("$_url/releases/download/v$pkgver/supabase_${pkgver}_linux_arm64.tar.gz")

sha256sums_x86_64=("14659e7148ad17b77e69e5c36b27be572110519c76c796da1b53c07c3590f593")
sha256sums_aarch64=("e2697de24a58a10820cd631dd78ae1e1ef2fe5f6625f4447ca65624dbe86072e")

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
  install -vDm755 supabase-go "$pkgdir/usr/bin/supabase-go"
  install -vDm644 "LICENSE.$pkgver" "$pkgdir/usr/share/licenses/supabase-bin/LICENSE"

  cd completions
  install -vDm644 supabase.bash "$pkgdir/usr/share/bash-completion/completions/supabase"
  install -vDm644 supabase.fish "$pkgdir/usr/share/fish/vendor_completions.d/supabase.fish"
  install -vDm644 supabase.zsh "$pkgdir/usr/share/zsh/site-functions/_supabase"
}
