# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.58.2
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

sha256sums_x86_64=('2fe15177cd1dbae865d6939609a0344d9a8d9a97b18c868feeae2b7be474eca6')
sha256sums_i686=('5f929b693a139a883c674ce6037c13ed3814a6a1ba83293632dd96d9a4cfe6b5')
sha256sums_armv7h=('d05ca1e9960ff8c5eac0442d57df5a933bf3ceb6435485447ffe6c627e9f15cc')
sha256sums_aarch64=('1f7e8a44b0896e6104131e69638e2d888b3a52cae010a65fa36995e16acf9860')

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
