# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Angelo Verlain  <hey@vixalien.com>

pkgname=supabase-bin
pkgver=2.54.11
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

sha256sums_x86_64=("bfec944a8d98747546dca789efcbdb17ffbd967ac538c19daab47589cb2aced3")
sha256sums_aarch64=("4f683f9a13e83c54b0a45e7bef4b8b944d39de571bf15e1837103a9afcebb00e")

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
