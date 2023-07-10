# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=nomad-pack-nightly
pkgver=v0.0.1.techpreview2.r80.g50d84d0
pkgrel=1
pkgdesc="A templating and packaging tool used with HashiCorp Nomad."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/hashicorp/nomad-pack"
license=('MPL2')
depends=(openssl git)
makedepends=(git go)
optdepends=(bash-completion)
provides=(nomad-pack)
conflicts=(nomad-pack)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/hashicorp/nomad-pack.git#tag=nightly"
        "bash-completion.sh")
sha256sums=('SKIP'
            'ac6a0c1f54833f4706ec7366c570b3088a06ca21128642f21435a7f464b98129')

pkgver() {
  cd "$srcdir/nomad-pack"
  git describe --long --abbrev=7 | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
  local version="$(pkgver)"
  cd "$srcdir/nomad-pack"
  export CGO_ENABLED=0
  go build -ldflags "-X '$(go list -m)/internal/pkg/version.GitDescribe=${version}'" -trimpath
}

package() {
  install -D -m755 "$srcdir/nomad-pack/nomad-pack" "$pkgdir/usr/bin/nomad-pack"
  local bash_completions_dir="$pkgdir/usr/share/bash-completion/completions"
  install -D -d -m755 "$bash_completions_dir" 
  install -m644 "$srcdir/bash-completion.sh" "$bash_completions_dir/nomad-pack" 
}

