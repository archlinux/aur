# Maintainer: Cass Midkiff <cass.midkiff.kde@gmail.com>
pkgname=devtunnel-cli-bin

_bin_name=devtunnel

# there's no url versioning, so this will install the latest published version
# regardless what the `pkgver` is set to
pkgver='1.0.1217+9b9f4aa22d'
pkgrel=1
pkgdesc="Microsoft Dev Tunnels cli client"

# dev, ppe, prod
_env=dev
arch=('aarch64' 'x86_64')
url="https://learn.microsoft.com/en-us/azure/developer/dev-tunnels/"
license=('unknown')

depends=(
    # this is an explicit dependency from the install script
    # https://aka.ms/DevTunnelCliInstall
    'libsecret'

    # these are dependencies identified from find-deps and 'pacman -Fx <lib file name>\.so'
    'glibc' 'zlib' 'gcc-libs'

)
provides=($_bin_name)
conflicts=($_bin_name)

source=()
source_x86_64=(devtunnel_x86::https://tunnelsassets$_env.blob.core.windows.net/cli/linux-x64-devtunnel)
source_aarch64=(devtunnel_arm64::https://tunnelsassets$_env.blob.core.windows.net/cli/linux-arm64-devtunnel)
noextract=(devtunnel_x86 devtunnel_arm64)

sha256sums_x86_64=('d6e63b330b788556ef3aea8b301f5b446742f9ad4c98e821d52dddf13eda9829')
sha256sums_aarch64=('e2a6d1dbeb9d1af343a2c5251cf49d30820380a82ae46699471b716c8b54c523')
validpgpkeys=()

# stripping symbols causes an error on execution:
# > Failure processing application bundle; possible file corruption.
# > Arithmetic overflow while reading bundle.
# > A fatal error occured while processing application bundle
options=(!strip)

package() {

    _pkg=devtunnel_x86
    if [ "${CARCH}" = "aarch64" ]; then
        _pkg=devtunnel_arm64
    fi

    install -d "${pkgdir}/usr/bin"

    install -m755 "${srcdir}/${_pkg}" "${pkgdir}/usr/bin/${_bin_name}"
}
