# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.14.0
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

sha256sums_x86_64=('9c723a465a07f69f856518bb860e1aed1998a67e44264d8518a3cadd3816fe35')
sha256sums_i686=('9a92c5e317733d6d621eb3337a3759c3826b61cdb6d65215b0669f0336ae173c')
sha256sums_armv7h=('e170bc6e026a769382fdea1f8e6b77cbf62586b612a80cf1580dcef92d08d3ee')
sha256sums_aarch64=('b14c5ee0003b9d60b5ec4fc93f8c1f69b0220f77e917ee6c3da088c277aacc24')

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
