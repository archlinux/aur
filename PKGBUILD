# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-git
_pkgname=kubeshark
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=41.3.r12.g470ab3d7e
pkgrel=1
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')
makedepends=(
    'go'
    'git'
)

_branch=master

pkgver() {
    cd "$srcdir/$_pkgname"
    git describe --long --tags | sed 's/^v//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

source=(
    "$_pkgname::git+https://github.com/kubeshark/kubeshark#branch=$_branch"
)

sha256sums=(
    "SKIP"
)

build() {
    export GOPATH="$srcdir"/gopath
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export CGO_ENABLED=1

    cd "$srcdir/$_pkgname"

    platform=$(go version | sed -r 's/go version go.+\s(.+)/\1/' | sed -e 's/\//-/g')
    commit_hash=$(git rev-parse HEAD)
    version=$(git describe --tags | cut -d'-' -f1)

    # -X 'github.com/kubeshark/kubeshark/misc.BuildTimestamp=$(BUILD_TIMESTAMP)' \

    go build ${GCLFAGS} \
      -ldflags="\
        -X 'github.com/kubeshark/kubeshark/misc.GitCommitHash=${commit_hash}' \
        -X 'github.com/kubeshark/kubeshark/misc.Branch=${_branch}' \
        -X 'github.com/kubeshark/kubeshark/misc.Platform=${platform}' \
        -X 'github.com/kubeshark/kubeshark/misc.Ver=${version}' \
        -s -w" \
      -o bin/kubeshark kubeshark.go
}

package() {
    install -D -m0755 "$srcdir/$_pkgname/bin/kubeshark" "$pkgdir/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
