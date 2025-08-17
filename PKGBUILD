# Maintainer: Pierre Chapuis <arch@catwell.info>
# Contributor:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Angelo Verlain  <hey@vixalien.com>

pkgname=supabase-bin
pkgver=2.34.3
pkgrel=1
pkgdesc="CLI for Supabase, an open source Firebase alternative"
arch=(aarch64 x86_64)
url="https://supabase.com/docs/reference/cli/about"
_url="https://github.com/supabase/cli"
license=(MIT)
provides=(supabase)
conflicts=(supabase)

source_aarch64=("supabase-$pkgver-aarch64.tar.gz::$_url/releases/download/v$pkgver/supabase_linux_arm64.tar.gz")
source_x86_64=("supabase-$pkgver-x86_64.tar.gz::$_url/releases/download/v$pkgver/supabase_linux_amd64.tar.gz")

sha256sums_aarch64=("1d48b255e2b8d309f081c526e0a628c3d26cc778c2c71884320a2ed7f0d7de3c")
sha256sums_x86_64=("cdbde701b734252c58bc68a6d1a61e29513cb21ed1bb27c9fcc0dc6cad7fb686")

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
