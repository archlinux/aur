# Maintainer: JP Roemer <jp+aur@roemer.im>
# Contributor: Mike Hicklen <mike@xfs.repair>
# Contributor: David Birks <david@birks.dev>

pkgname=aws-iam-authenticator
pkgver=0.7.13
pkgrel=1
pkgdesc='A tool to use AWS IAM credentials to authenticate to a Kubernetes cluster'
arch=('x86_64' 'aarch64')
url='https://github.com/kubernetes-sigs/aws-iam-authenticator'
license=('Apache-2.0')
makedepends=('go')
provides=("${pkgname}")
conflicts=("${pkgname}-bin" "${pkgname}-git")
source=("${pkgname}_${pkgver}.tar.gz::https://github.com/kubernetes-sigs/aws-iam-authenticator/archive/v$pkgver.tar.gz")
sha512sums=('c22f38a5f6af04b06535e8d1b551065f04689c0125637105965c57b7eacf23b266dc8f76593e433c41fa0139e4480994c8e76c1c25ae1f7e48822c1f4c7b581b')

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
