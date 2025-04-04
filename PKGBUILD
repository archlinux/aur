# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Mike Hicklen <mike@xfs.repair>
# Contributor: David Birks <david@birks.dev>

pkgname=aws-iam-authenticator
pkgver=0.6.31
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache-2.0')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('709bf295abe3acc1aa69e6314c48f2a17872d15c34af78350820b5e1f4c5b7ca76ccee535b94446ca4537ff6c79c868e7bcc1bcbda7c05b9ef463035e3c710d9')

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
