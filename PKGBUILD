# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=tbls-bin
_name=${pkgname%-bin}
pkgver=1.61.0
pkgrel=1
pkgdesc="CI-Friendly tool for documenting a database"
arch=(x86_64)
url="https://github.com/k1LoW/tbls"
license=(MIT)
provides=("$_name")
conflicts=("$_name")

source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/tbls_v${pkgver}_linux_amd64.tar.gz"
  "$pkgname-$pkgver.LICENSE::https://raw.githubusercontent.com/k1LoW/tbls/8e77c4f9415560d725080654e9b3e4c0269e45af/LICENSE"
)
sha256sums=(
  'c955c3c8a569912d33523c3c24bfefb850e5e5be9b8b9adfbcf57cc5ccba3d1f'
  '6eefa0bec6e7c3654bdc29cb8f8c4adbc1327d2e912b532aacc68f6e2fa9d63c'
)
noextract=(
  "$pkgname-$pkgver.tar.gz"
  "$pkgname-$pkgver.LICENSE"
)

_archive="$pkgname-$pkgver"

prepare() {
  mkdir -p "$_archive"
  tar -xf "$_archive.tar.gz" -C "$_archive"

  cd "$_archive"

  ./tbls completion bash > tbls.bash
  ./tbls completion fish > tbls.fish
  ./tbls completion zsh > tbls.zsh
}

package() {
  cd "$_archive"

  install -Dm755 tbls "${pkgdir}/usr/bin/tbls"
  install -Dm644 "../$pkgname-$pkgver.LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm644 tbls.bash "$pkgdir/usr/share/bash-completion/completions/tbls"
  install -Dm644 tbls.fish "$pkgdir/usr/share/fish/vendor_completions.d/tbls.fish"
  install -Dm644 tbls.zsh "$pkgdir/usr/share/zsh/site-functions/_tbls"
}
