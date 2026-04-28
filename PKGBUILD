# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Mike Hicklen <mike@xfs.repair>
# Contributor: David Birks <david@birks.dev>

pkgname=aws-iam-authenticator
pkgver=0.7.14
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache-2.0')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('0c87d3ea94d5023b744fba53676651a743e3ea892dcc51ed779cda9b7b749c945aa90fc3e37c246fe96ea9f15a369ed6aa48059e5e4e1e7b3e73c86ebdfef358')

export GGO_ENABLED="0"
export CGO_CPPFLAGS="${CPPFLAGS}"
export CGO_CFLAGS="${CFLAGS}"
export CGO_CXXFLAGS="${CXXFLAGS}"
export CGO_LDFLAGS="${LDFLAGS}"
export GOFLAGS="-trimpath -mod=readonly -modcacherw"

build() {
    local _commit _flags
    _commit=$(bsdcat "${pkgname}_${pkgver}.tar.gz" | git get-tar-commit-id)
    _flags=(
        -X=sigs.k8s.io/aws-iam-authenticator/pkg.Version="v${pkgver}"
        -X=sigs.k8s.io/aws-iam-authenticator/pkg.CommitID="${_commit}"
        -X=sigs.k8s.io/aws-iam-authenticator/pkg.BuildDate="$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
    )
    cd "${pkgname}-${pkgver}"
    go build -o "${pkgname}" -ldflags="-s -w ${_flags[*]}" "./cmd/${pkgname}"
}

package() {
    cd "${pkgname}-${pkgver}"
    install -Dm 755 "${pkgname}" -t "${pkgdir}/usr/bin"
}
