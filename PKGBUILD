# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=nomad-pack-git
pkgver=v0.0.1.techpreview2.r101.ge633fd0
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
source=("git+https://github.com/hashicorp/nomad-pack.git#branch=main"
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

