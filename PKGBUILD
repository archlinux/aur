# Maintainer: Phillip Schichtel <phillip@schich.tel>

pkgname=nomad-pack
pkgver=v0.4.0
pkgrel=1
pkgdesc="A templating and packaging tool used with HashiCorp Nomad."
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/hashicorp/nomad-pack"
license=('MPL-2.0')
depends=(openssl git)
makedepends=(git go)
optdepends=(bash-completion)
provides=(nomad-pack)
conflicts=(nomad-pack)
validpgpkeys=(5DE3E0509C47EA3CF04A42D34AEE18F83AFDEB23)
source=("git+https://github.com/hashicorp/nomad-pack.git#commit=5159a777162ff7481aa54c6519a245413b0fc558"
        "bash-completion.sh")
sha256sums=('d5f660d8ca902f1f2e0692ebeb337cadfda8bd5878aa5274bafd428dda0d2a61'
            'ac6a0c1f54833f4706ec7366c570b3088a06ca21128642f21435a7f464b98129')

build() {
  cd "$srcdir/nomad-pack"
  export CGO_ENABLED=0
  go build -ldflags "-X '$(go list -m)/internal/pkg/version.GitDescribe=${pkgver}'" -trimpath
}

package() {
  install -D -m755 "$srcdir/nomad-pack/nomad-pack" "$pkgdir/usr/bin/nomad-pack"
  local bash_completions_dir="$pkgdir/usr/share/bash-completion/completions"
  install -D -d -m755 "$bash_completions_dir" 
  install -m644 "$srcdir/bash-completion.sh" "$bash_completions_dir/nomad-pack" 
}

