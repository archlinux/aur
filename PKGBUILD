# Maintainer: Wuxxin <wuxxin@gmail.com>
# Based on arch:extra:pulumi; original contributors:
# Contributor: Andrew Crerar <crerar@archlinux.org>
# Contributor: Christian Rebischke <chris.rebischke@archlinux.org>
# Contributor: Christoph Gysin <christoph.gysin@gmail.com>

pkgname=pulumi-git
_pkgname=pulumi
pkgrel=1
pkgdesc='Modern Infrastructure as Code (git tag build with python and nodejs dynamic resource provider)'
arch=('x86_64')
url="https://github.com/pulumi/pulumi"
license=('Apache')

_get_latest_tag() {
    git ls-remote --tags --sort=-v:refname "$url" |
        head -n 1 | awk '{print $2}' | sed 's|refs/tags/||; s/^v//'
}
_latest_tag=$(_get_latest_tag)
pkgver=$_latest_tag

conflicts=('pulumi')
provides=('pulumi' "pulumi=${pkgver}")
depends=('glibc' 'nodejs' 'python')
makedepends=('go' 'git')
source=("${pkgname}::git+${url}.git")
sha256sums=('SKIP')

_plugin_dirs=(
    "go/pulumi-language-go"
    "python/cmd/pulumi-language-python"
    "nodejs/cmd/pulumi-language-nodejs"
)

prepare() {
    cd "${srcdir}/${pkgname}"
    git fetch --tags
    git checkout "v$_latest_tag"
}

build() {
    cd "${srcdir}/${pkgname}"

    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    export GOFLAGS="-buildmode=pie -trimpath -mod=readonly -modcacherw"

    local _full_ver="v${_latest_tag}"
    local _major_ver="${_full_ver%%.*}"
    local _build_bin="${srcdir}/${pkgname}/bin"
    local _plugin_dir _plugin_name

    # Build the main executable
    cd "${srcdir}/${pkgname}/pkg"
    go build \
        -ldflags "-linkmode external -X github.com/pulumi/pulumi/sdk/${_major_ver}/go/common/version.Version=${_full_ver}" \
        -o "${_build_bin}/${_pkgname}" "./cmd/${_pkgname}"

    # Build the plugins
    for _plugin_dir in "${_plugin_dirs[@]}"; do
        _plugin_name="${plugin_dir##*/}"
        cd "${srcdir}/${pkgname}/sdk/${_plugin_dir}"
        go build \
            -ldflags "-linkmode external -X github.com/pulumi/pulumi/sdk/${_major_ver}/go/common/version.Version=${_full_ver}" \
            -o "${_build_bin}/${plugin_name}" .
    done

    # Copy additional files of plugins
    cd "${srcdir}/${pkgname}/sdk"
    cp python/cmd/pulumi-language-python-exec ${_build_bin}
    cp python/dist/pulumi-resource-pulumi-python ${_build_bin}
    cp nodejs/dist/pulumi-resource-pulumi-nodejs ${_build_bin}
}

package() {
    cd "${srcdir}/${pkgname}"

    # Install all executables
    install -Dm755 ${srcdir}/${pkgname}/bin/* -t "${pkgdir}/usr/bin/"

    # Generate Bash completion
    install -D -m 644 \
        <("${pkgdir}/usr/bin/${_pkgname}" gen-completion bash) \
        "${pkgdir}/etc/bash_completion.d/${_pkgname}"

    # Generate ZSH completion
    install -D -m 644 \
        <("${pkgdir}/usr/bin/${_pkgname}" gen-completion zsh) \
        "${pkgdir}/usr/share/zsh/site-functions/_${_pkgname}"

    # Generate Fish completion
    install -D -m 644 \
        <("${pkgdir}/usr/bin/${_pkgname}" gen-completion fish) \
        "${pkgdir}/usr/share/fish/completions/${_pkgname}.fish"
}
