# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.15.1
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

_artifact_name="$pkgname-$pkgver-$pkgrel.jfrog"
_source_base="$_artifact_name::https://releases.jfrog.io/artifactory/$_pkgname/v2/$pkgver"

source_x86_64=("$_source_base/$_pkgname-linux-amd64/jfrog")
source_i686=("$_source_base/$_pkgname-linux-386/jfrog")
source_armv7h=("$_source_base/$_pkgname-linux-arm/jfrog")
source_aarch64=("$_source_base/$_pkgname-linux-arm64/jfrog")

noextract=("$_artifact_name")

sha256sums_x86_64=('6f111b4ea6e5bf710e7aac552334415d22553eb64ecaa498464f46573e5c0ee0')
sha256sums_i686=('e48f766adf1e4cb4e42b431dcc2fa22fab664c72421d7b63caa9e0a027a51a57')
sha256sums_armv7h=('69e86f3015565f3459b1b83719626173723bb5983fa5a92560152dffc3de07be')
sha256sums_aarch64=('1a61511bf607fd1c3b5ac43579a251cf4f65af97a8fcc5d0e36e24ac5b22def0')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  mv "$_artifact_name" "$pkgname-$pkgver/jfrog"
}

build() {
  cd "$pkgname-$pkgver"

  chmod u+x jfrog
  ./jfrog completion bash > jfrog.bash
  ./jfrog completion fish > jfrog.fish
  ./jfrog completion zsh > jfrog.zsh
}

package() {
  cd "$pkgname-$pkgver"

  install -Dm755 jfrog "$pkgdir/usr/bin/jfrog"
  ln -rs "$pkgdir/usr/bin/jfrog" "$pkgdir/usr/bin/jf"

  install -Dm644 jfrog.bash "$pkgdir/usr/share/bash-completion/completions/jfrog"
  install -Dm644 jfrog.fish "$pkgdir/usr/share/fish/vendor_completions.d/jfrog.fish"
  install -Dm644 jfrog.zsh "$pkgdir/usr/share/zsh/site-functions/_jfrog"
}
