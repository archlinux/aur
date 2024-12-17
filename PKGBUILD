# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Mike Hicklen <mike@xfs.repair>
# Contributor: David Birks <david@birks.dev>

pkgname=aws-iam-authenticator
pkgver=0.6.29
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache-2.0')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('276efbbf44228b7ef6fe45e80c19443b134664d940706f2634e7478c4e8a3d2499bd0cbe70e1b7916af47dbc66ca1b5419f4738ad1f94ef82fe88f3a06f27d65')

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
