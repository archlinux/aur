# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=drone-runner-exec
_pkgver=1.0.0-beta.9
pkgver="${_pkgver/-/}"
pkgrel=3
pkgdesc="Drone pipeline runner that executes builds directly on the host machine"
arch=('x86_64')
url="https://github.com/drone-runners/drone-runner-exec"
license=('custom:Polyform-Small-Business-1.0.0' 'custom:Polyform-Free-Trial-1.0.0' 'custom:Polyform-Noncommercial-1.0.0')
depends=('glibc')
makedepends=('go' 'git')
optdepends=('drone: for a local Drone instance')
source=(
  "$pkgname-$pkgver.tar.gz::$url/archive/v$_pkgver.tar.gz"
  'systemd.service'
  'sysusers.conf'
  'tmpfiles.conf'
)
sha512sums=('42df17954a888fc397b884a25a76477fd897ecf4173e875b224701c01cbf4206594368db337e4cfdc793251af3c70851e50fa3f49ae4f1d6d1bc1ad95ac0fc71'
            '65102869afb04c64297c28078ba826a019935cc9b7063d758d19ff92fc2efe04ee3f377453fce11c9e1912765e2857d8380e81fae9e412921beffb757c91d3a4'
            'f64b194edc695028e4140800b24aa35bc04673c27738552d0d5e9e04ef5381a740063dad7835cbf71efea9acc71c889b396deb497289c95cfda40e273f5ce0b1'
            'b093531f17ae9f92c55ab55a613923b8276873abf6b608bf95cec8fa1f174d30756ab81ac80294d97fd3aac536bb7144423fae8862ccbfd65c77b6dbe785e4f1')
b2sums=('93004282c7956cbf4b8683170001029504e8c1c21415b0cf06a80d46b572685a12c493adfb832b5d531c60fdab4246997de1efdd88a255e0be31edbf134f0d08'
        '178d82980e869dc5a282649ce4988c632ade74f411bf3077341804a972f3569dd07af3710fd21dcb7bf2aa2c6b3654e85d207f0da15e8b500bca2c10455da04f'
        '18f301ee30c65a650d2287fe07a0604eea8c12acbe4d526c1d8b64eaccab3e36372e3b7d6b08b4ab00273e1677b9ee9aedf8c1321438bdb5b5532d8b87e6b023'
        '27835b580a3d4124f688a955f82f35639579c7aaf222aad5ab70f674dad290eb20875f3e36d67d5f8193b91f044ca6f81db0f3a91034a27d7faa24e53b4f15f4')

prepare() {
  cd "$pkgname-$_pkgver"

  # create directory for build output
  mkdir -p build

  # download dependencies
  go mod download
}

build() {
  cd "$pkgname-$_pkgver"

  # set Go flags
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"

  go build -v \
    -trimpath \
    -buildmode=pie \
    -mod=readonly \
    -modcacherw \
    -ldflags "-linkmode external -extldflags \"${LDFLAGS}\"" \
    -o build \
    .
}

check() {
  cd "$pkgname-$_pkgver"
  go test -v ./...
}

package() {
  # systemd integration
  install -vDm644 systemd.service "$pkgdir/usr/lib/systemd/system/$pkgname.service"
  install -vDm644 sysusers.conf "$pkgdir/usr/lib/sysusers.d/$pkgname.conf"
  install -vDm644 tmpfiles.conf "$pkgdir/usr/lib/tmpfiles.d/$pkgname.conf"

  cd "$pkgname-$_pkgver"

  # binary
  install -vDm755 -t "$pkgdir/usr/bin" build/*

  # licenses
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" licenses/* LICENSE.md

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md CHANGELOG.md
}
