# vim: set ft=sh ts=4 sw=4 et:
# Maintainer: Dan Fuhry <dan@fuhry.com>

pkgbase=coder
pkgver=2.26.0
pkgrel=1
pkgdesc="Provision remote development environments via Terraform"
arch=('i386' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/coder/coder"
# If this is changed to "Proprietary", enterprise binaries will be built.
# Those binaries may not be legally redistributed.
license=('AGPL-3.0-only')
depends=('glibc')
makedepends=('go>=1.22.0' 'pnpm' 'nodejs-lts-iron' 'protobuf')

# Set to 1 to build the "coder-agent"/"coder-oss-agent" package.
# This package is really only useful for instances managed by Coder,
# and isn't needed by most users.
_package_agent=0
_oss_tag=""

source=("${pkgbase}-${pkgver}.tar.gz::https://github.com/coder/coder/archive/refs/tags/v${pkgver}.tar.gz"
        "coder-oss.install")

determine_goarch() {
    case "${CARCH}" in
        amd64|x86_64)
            build_arch="amd64" ;;
        arm64|aarch64)
            build_arch="arm64" ;;
        *)
            build_arch="$(go env GOARCH)"
    esac

    echo "${build_arch}"
}

is_agpl_build() {
    # in shell scripts, "0" is success, so "if is_agpl_build" true result is zero
    case "${license[0]}" in
        AGPL-3.0|AGPL-3.0-only|AGPL-3.0-or-later)
            return 0
            ;;
        Proprietary)
            return 1
            ;;
        *)
            error "License must be 'AGPL-3.0' or 'Proprietary'."
            exit 2
            ;;
    esac
}

if is_agpl_build; then
    _oss_tag="-oss"
fi
pkgname=("${pkgbase}${_oss_tag}")
if test $_package_agent -eq 1 ; then
    pkgname+=("${pkgbase}${_oss_tag}-agent")
fi

prepare() {
    if is_agpl_build; then
        msg "NOTE: Building OSS (AGPLv3) binaries. These are not guaranteed to work with"
        msg "enterprise servers. Change license to ('Proprietary') to build"
        msg "non-redistributable enterprise binaries."
    fi
    cd "${srcdir}/${pkgbase}-${pkgver}"
    for f in "${source[@]}"; do
        if [ "${f##*.}" = "patch" ]; then
            msg "Aplying patch: ${f}"
            patch -Np1 -i "${srcdir}/${f}"
        fi
    done
}

build() {
    cd "${srcdir}/${pkgbase}-${pkgver}"

    export GOPATH="${srcdir}/go"
    export GOCACHE="${srcdir}/go-cache"

    # See: https://wiki.archlinux.org/index.php/Go_package_guidelines
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"
    export CGO_LDFLAGS="${LDFLAGS}"
    CODER_BUILD_AGPL=0
    if is_agpl_build; then
        CODER_BUILD_AGPL=1
    fi
    export CODER_BUILD_AGPL
    GOFLAGS_NO_CGO="-trimpath -ldflags=-linkmode=external -mod=readonly -modcacherw"
    GOFLAGS_WITH_CGO="${GOFLAGS_NO_CGO} -buildmode=pie"

    build_arch="$(determine_goarch)"

    # Generating these mocks tends to fail, but the generated files are committed.
    # Touching them prevents make from trying to recreate them.
    touch coderd/database/dbmock/dbmock.go \
        coderd/database/pubsub/psmock/psmock.go

    export CODER_FORCE_VERSION="${pkgver}"

    # "src" env var is used to override coder source directory, because their build
    # scripts look for .git which is usually the AUR packaging scripts (since we are
    # using release tarballs)

    # first build slim binary for the current arch w/PIE
    env src="$(pwd)" \
        GOFLAGS="${GOFLAGS_WITH_CGO}" \
        make build/coder-slim_${pkgver}_linux_${build_arch}

    # next, build slim binaries for other archs w/o PIE - required for the
    # "coder.sha1" target which is a dependency of the fat binary
    env src="$(pwd)" \
        GOFLAGS="${GOFLAGS_NO_CGO}" \
        make site/out/bin/coder.sha1

    # finally, build the fat binary
    env src="$(pwd)" \
        GOFLAGS="${GOFLAGS_WITH_CGO}" \
        make build/coder_${pkgver}_linux_${build_arch}

    # Make sure go path is writable so it can be cleaned up
    chmod -R u+w "${srcdir}/go"
    chmod -R u+w "${srcdir}/go-cache"
}

_package() {
    local _bintag="${1:-}"

    cd "${srcdir}/${pkgbase}-${pkgver}"
    build_arch="$(determine_goarch)"

    install -d -m755 "${pkgdir}/usr/bin"
    install -m755 "build/coder${_bintag}_${pkgver}_linux_${build_arch}" "${pkgdir}/usr/bin/coder"

    install -d -m755 "${pkgdir}/usr/share/licenses/coder"
    if is_agpl_build; then
        install -m644 "LICENSE" "${pkgdir}/usr/share/licenses/coder/LICENSE"
    else
        install -m644 "LICENSE.enterprise" "${pkgdir}/usr/share/licenses/coder/LICENSE"
    fi
}

package_coder-oss() {
    pkgdesc+=" - OSS build - server and client unified binary"
    conflicts=("${pkgbase}" "${pkgbase}-agent" "${pkgbase}-oss-agent" "${pkgbase}-bin")
    provides=('coder' 'coder-agent')
    install="coder-oss.install"

    _package
}

package_coder-oss-agent() {
    conflicts=("${pkgbase}" "${pkgbase}-oss" "${pkgbase}-agent" "${pkgbase}-bin")
    provides=('coder-agent')
    pkgdesc+=" - OSS build - slim (client-only) binary"
    install="coder-oss.install"

    _package "-slim"
}

package_coder() {
    conflicts=("${pkgbase}-oss" "${pkgbase}-agent" "${pkgbase}-oss-agent" "${pkgbase}-bin")
    pkgdesc+=" - server and client unified binary"
    provides=('coder-agent')

    _package
}

package_coder-agent() {
    conflicts=("${pkgbase}" "${pkgbase}-oss" "${pkgbase}-oss-agent" "${pkgbase}-bin")
    pkgdesc+=" - slim (client-only) binary"

    _package "-slim"
}

# The package functions are set even if wrapped inside an if/else, but unset
# is a valid workaround.
if is_agpl_build; then
    unset package_coder package_coder-agent
else
    unset package_coder-oss package_coder-oss-agent
fi

if test $_package_agent -eq 0 ; then
    unset package_coder-agent package_coder-oss-agent
fi


sha512sums=('26fb007ebe913547e2114cfc8608d406bec3fb5f37e97bbd3d0fb03c5f8ab4f837588167cd84a8692103013a34c88327fcd108ea0803a34508776ebf31fe2a96'
            '2882e905971ace0722f4e28dcabaacab8f9ab0eb555fd71448a71725dbc8d397f52467c522aa982e50239bd2486c6448cc8bb5a2b23891312520a425038e14f4')
