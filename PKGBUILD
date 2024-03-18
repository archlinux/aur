# Maintainer: Cass Midkiff <cass.midkiff.kde@gmail.com>
pkgname=devtunnel-cli-bin

_bin_name=devtunnel

# there's no url versioning, so this will install the latest published version
# regardless what the `pkgver` is set to
pkgver='1.0.1249+67b1cd300c'
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

_source_x86=devtunnel_${pkgver}_x86
_source_arm=devtunnel_${pkgver}_arm64

source=()
source_x86_64=($_source_x86::https://tunnelsassets$_env.blob.core.windows.net/cli/linux-x64-devtunnel)
source_aarch64=($_source_arm::https://tunnelsassets$_env.blob.core.windows.net/cli/linux-arm64-devtunnel)
noextract=($_source_x86 $_source_arm)

sha256sums_aarch64=('d856fee510120e7014ad05af8e37041ff3da6e4dc7533b966a30328a849c69c1')
sha256sums_x86_64=('1a104a1a166205c1214278326db5a688f811015aaa513c492347c0814cbee6da')
validpgpkeys=()

# stripping symbols causes an error on execution:
# > Failure processing application bundle; possible file corruption.
# > Arithmetic overflow while reading bundle.
# > A fatal error occured while processing application bundle
options=(!strip)

package() {

    _pkg=$_source_x86
    if [ "${CARCH}" = "aarch64" ]; then
        _pkg=$_source_arm
    fi

    install -d "${pkgdir}/usr/bin"

    install -m755 "${srcdir}/${_pkg}" "${pkgdir}/usr/bin/${_bin_name}"
}
