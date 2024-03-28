# Maintainer: Matt M <numbernine dot archlinux at complexnumber dot net>

pkgname=jfrog-cli-bin
_pkgname=jfrog-cli
pkgver=2.55.0
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

sha256sums_x86_64=('ff917df0dabed970f7fb9ea60b5d991c306854888463d65fdc940c00bd4807d7')
sha256sums_i686=('7489a082e59be586bc2f41670cef8530a253a9e718161b1aba357066b7ad6085')
sha256sums_armv7h=('bc57c766b206d07a3b8a906ffd8f5687846ca7f818c32b6f6325ab5bfc1b340d')
sha256sums_aarch64=('6f2d0a0dea30f7cefd253f54918d83c00e55e8bef5ef35dd33cb9d4b3920103c')

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
