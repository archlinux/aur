# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.58.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=(x86_64 i686 armv7h aarch64)
url="https://github.com/jfrog/jfrog-cli"
license=(Apache)
conflicts=(jfrog-cli)
provides=(jfrog-cli)

_artifact_name="$pkgname-$pkgver-$pkgrel.jfrog"
_source_base="$_artifact_name::https://releases.jfrog.io/artifactory/$_pkgname/v2-jf/$pkgver"

source_x86_64=("$_source_base/$_pkgname-linux-amd64/jf")
source_i686=("$_source_base/$_pkgname-linux-386/jf")
source_armv7h=("$_source_base/$_pkgname-linux-arm/jf")
source_aarch64=("$_source_base/$_pkgname-linux-arm64/jf")

noextract=("$_artifact_name")

sha256sums_x86_64=('ebd5bb11e8bfc5a83cb682925f52ec8b840c1e33e7fc93b9eaa52819664b5a79')
sha256sums_i686=('86a538c5d4f68052df89e1451c8b89b3b6d3aba8d65b6d063507d17e631ad362')
sha256sums_armv7h=('8f1373d2d74d35f64d3e68863d8577b2d421b5f63f748fc32305f5230d9b8cce')
sha256sums_aarch64=('57b37e269aecaa8981aaa237eb15be0b2aa113f597339c0c7311c65bac0491c7')

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
