# Maintainer: Carl Smedstad <carl.smedstad at protonmail dot com>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.34.3
pkgrel=1
pkgdesc="Simple interface to Artifactory, Bintray and Mission Control"
arch=('x86_64' 'i686' 'armv7h' 'aarch64')
url="https://github.com/jfrog/jfrog-cli"
license=('Apache')
depends=('glibc')
conflicts=('jfrog-cli' 'jfrog-cli-go')
provides=('jfrog-cli')

_artifact_name="$pkgname-$pkgver-$pkgrel.jfrog"
_source_base="$_artifact_name::https://releases.jfrog.io/artifactory/$_pkgname/v2-jf/$pkgver"

source_x86_64=("$_source_base/$_pkgname-linux-amd64/jf")
source_i686=("$_source_base/$_pkgname-linux-386/jf")
source_armv7h=("$_source_base/$_pkgname-linux-arm/jf")
source_aarch64=("$_source_base/$_pkgname-linux-arm64/jf")

noextract=("$_artifact_name")

sha256sums_x86_64=('931c7d081d1f852377c3a21ca153a91c225d0d1ba7fa7596c51e50f47d2f671f')
sha256sums_i686=('11c772b12f2de0c07f3e07fcc7a6837ca838e31d91acaf942c92f008f0f7fa8f')
sha256sums_armv7h=('b9c2d83ac344b08042fd2cedd9f48076315de5d14f61c913b7ad4d90dbcf2d8a')
sha256sums_aarch64=('4fae116d92685120f0d29e5a538d64f499bfcec883c64ff6b665f67d35adbd34')

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
