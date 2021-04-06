# Maintainer: Andrea Denisse Gómez-Martínez <aur at denisse dot dev>

pkgname=shhgit
pkgdesc='Secrets detection for your GitHub, GitLab and Bitbucket repositories'
arch=(x86_64 i686 armv7h)
url='https://github.com/eth0izzle/shhgit'
_branch='master'
pkgver=0.2
pkgrel=1
license=('MIT')
makedepends=(go)
source=("${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz")
sha256sums=('0cce46f6474f1885b3bce057b8370017248cf3d7a4e16ddb91a6d2c626163680')
sha512sums=('eb28f297e40c0dd437cad561bc3f877d9e9a7261553394c8b649ec2aa009574a2ec66d5ccefd82dfd461f92aec75324a723f6de332c9d23cb785d3cc0d959320')
b2sums=('79ee37cea7ec7c5eb45847548135bf51e9c956803a03d5ee37af1c501aed88e55d1a0822d464b1a6f20040c113127ab01c909bdcafef205226fd0a87d12868aa')
provides=($pkgname)
conflicts=($pkgname)

prepare() {
  mkdir -p "${pkgname}-${pkgver}/build"
}

build() {
  cd "${pkgname}-${pkgver}"

  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"

  go build -o build/ .
}

check() {
  cd "${pkgname}-${pkgver}"
  go test ./...
}

package() {
  cd "${pkgname}-${pkgver}"
  install -Dm755 build/$pkgname "$pkgdir"/usr/bin/$pkgname
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
