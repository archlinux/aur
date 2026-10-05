# Maintainer: Iyán Méndez Veiga <me (at) iyanmv (dot) com>
_pkgname=http-relay
pkgname=drand-$_pkgname
pkgver=2.2.2
pkgrel=1
pkgdesc="An HTTP relay for drand nodes"
arch=(x86_64)
url=https://github.com/drand/http-relay
license=('Apache-2.0 OR MIT')
depends=(glibc)
makedepends=(
    git
    go
)
backup=(etc/conf.d/drand-http-relay)
source=(
    $_pkgname::git+https://github.com/drand/http-relay.git#tag=v$pkgver
    drand-http-relay.conf
    drand-http-relay.service
    drand-http-relay.sysusers
)
b2sums=('bee309c5be390b3a78ac9712c659d0c7103fb876ead32be4b7bfaa7b0e7c9770415eff4444f299c22c2563d7716d9b7524f939f3004b5a7d876c6d7d150db852'
        '47f9ad93ef58dd37d07831aa6e52147cd330d006ad8d3f991528ab2cb4a832d870c739175fd0ad5a3920d48fdef18c13ebe01c690834cefc46eb07d7eef42ead'
        'df2985eb14da9a7b69bc28c5745567ce24597a134423d0d20f80dbdf655a3cb9f95427aae5063d57dbee7807291aaa9c8482ceee338f6c96a728bc81d6f32e09'
        'c675c47cebc73f81210a1d430405337e47464ced8a46aca16dc8f0e3aca158f2cd742a715da0511118635db1348ab47b5f6ad0bf9d3dedea0075f4f1a3de356f')

build() {
    cd $_pkgname
    mkdir -p build
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    go build -o build
}

package() {
    install -Dm644 drand-http-relay.conf "$pkgdir"/etc/conf.d/drand-http-relay
    install -Dm644 drand-http-relay.service "$pkgdir"/usr/lib/systemd/system/drand-http-relay.service
    install -Dm644 drand-http-relay.sysusers "$pkgdir"/usr/lib/sysusers.d/drand-http-relay.conf

    cd $_pkgname
    install -Dm755 build/$_pkgname "$pkgdir"/usr/bin/$pkgname
    install -Dm644 LICENSE-MIT "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}
