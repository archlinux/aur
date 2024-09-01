# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.66.0
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/jfrog/jfrog-cli"
license=("Apache-2.0")
conflicts=(jfrog-cli)
provides=(jfrog-cli)

_artifact_name="$pkgname-$pkgver-$pkgrel.jfrog"
_source_base="$_artifact_name::https://releases.jfrog.io/artifactory/$_pkgname/v2-jf/$pkgver"

source_x86_64=("$_source_base/$_pkgname-linux-amd64/jf")
source_i686=("$_source_base/$_pkgname-linux-386/jf")
source_armv7h=("$_source_base/$_pkgname-linux-arm/jf")
source_aarch64=("$_source_base/$_pkgname-linux-arm64/jf")

noextract=("$_artifact_name")

sha256sums_x86_64=('b3c92f70b75e7b05948ef70f015511928b986bd04ed60d90bb2fedcc62f1ea02')
sha256sums_i686=('4272f6673717b020649265b7bf9f4adabd609d2944d0df991214cab0c324679b')
sha256sums_armv7h=('fc8f92237a2ece258b09bceb14a511e03f717dcd1c73ddea620820ab25146c8e')
sha256sums_aarch64=('e79029dcc26be5ce8fd32409a24e63d8ed5442e7fe0d375e5e5c8f17d44dd7a1')

_archive="$pkgname-$pkgver"

prepare() {
  mkdir -p "$_archive"
  mv "$_artifact_name" "$_archive/jfrog"
}

build() {
  cd "$_archive"

  chmod u+x jfrog
  ./jfrog completion bash > jfrog.bash
  ./jfrog completion fish > jfrog.fish
  ./jfrog completion zsh > jfrog.zsh
}

package() {
  cd "$_archive"

  install -Dm755 jfrog "$pkgdir/usr/bin/jfrog"
  ln -rs "$pkgdir/usr/bin/jfrog" "$pkgdir/usr/bin/jf"

  install -Dm644 jfrog.bash "$pkgdir/usr/share/bash-completion/completions/jfrog"
  install -Dm644 jfrog.fish "$pkgdir/usr/share/fish/vendor_completions.d/jfrog.fish"
  install -Dm644 jfrog.zsh "$pkgdir/usr/share/zsh/site-functions/_jfrog"
  install -Dm644 jfrog.bash "$pkgdir/usr/share/bash-completion/completions/jf"
  install -Dm644 jfrog.fish "$pkgdir/usr/share/fish/vendor_completions.d/jf.fish"
  install -Dm644 jfrog.zsh "$pkgdir/usr/share/zsh/site-functions/_jf"
}
