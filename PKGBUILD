# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Angelo Verlain  <hey@vixalien.com>

pkgname=supabase-bin
pkgver=2.53.6
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=(aarch64 x86_64)
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/supabase/cli"
license=(MIT)
provides=(supabase)
conflicts=(supabase)

source_x86_64=("supabase-$pkgver-x86_64.tar.gz::$_url/releases/download/v$pkgver/supabase_linux_amd64.tar.gz")
source_aarch64=("supabase-$pkgver-aarch64.tar.gz::$_url/releases/download/v$pkgver/supabase_linux_arm64.tar.gz")

sha256sums_x86_64=("bb8234ff163ed7943b137c9963eed9f79338488126a2cc7412abe2096d8ced0f")
sha256sums_aarch64=("6d5135f6c9cb034beb977f39d36a8b2cdb0e781b5f7bf9333f5f2f0f8189b1ed")

prepare() {
  cd "$srcdir"
  mkdir -p completions
  chmod +x ./supabase
}

build() {
  cd "$srcdir"
  for _sh in bash fish zsh powershell; do
    ./"supabase" completion "$_sh" > "completions/supabase.$_sh"
  done
}

package() {
  cd "$srcdir"
  install -vDm755 "supabase" "$pkgdir/usr/bin/supabase"
  install -vDm644 "README.md" "$pkgdir/usr/share/doc/supabase/README.md"
  install -vDm644 "LICENSE" "$pkgdir/usr/share/licenses/supabase-bin/LICENSE"

  cd "completions"
  install -vDm644 "supabase.bash" "$pkgdir/usr/share/bash-completion/completions/supabase"
  install -vDm644 "supabase.fish" "$pkgdir/usr/share/fish/vendor_completions.d/supabase.fish"
  install -vDm644 "supabase.zsh" "$pkgdir/usr/share/zsh/site-functions/_supabase"
  install -vDm644 "supabase.powershell" "$pkgdir/usr/share/powershell/Modules/supabase/supabase.ps1"
}
