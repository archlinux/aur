# Maintainer: Luis Bañuelos <luiscarlos.banuelos@gmail.com>
# Contributor: Cass Midkiff <cass.midkiff.kde@gmail.com>
pkgname=devtunnel-cli-bin

_bin_name=devtunnel

# there's no url versioning, so this will install the latest published version
# regardless what the `pkgver` is set to
pkgver=1.0.1401+3d725ee539
pkgrel=1
pkgdesc="Microsoft Dev Tunnels CLI client"

# dev, ppe, prod
_env=prod
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

_source_x86_64=devtunnel_x86_64
_source_aarch64=devtunnel_arm64

source=()
source_x86_64=($_source_x86_64::https://tunnelsassets$_env.blob.core.windows.net/cli/linux-x64-devtunnel)
source_aarch64=($_source_aarch64::https://tunnelsassets$_env.blob.core.windows.net/cli/linux-arm64-devtunnel)
noextract=($_source_x86_64 $_source_aarch64)

sha256sums_aarch64=('4d3e60f81da97ed3b941d444f86ee2170742560d78c157d1d6f6afeb9bad041e')
sha256sums_x86_64=('7dcc7e060be6eb3dde0c724b16436b86071d41b1700647a1f1190b2c130a62f9')

validpgpkeys=()

# stripping symbols causes an error on execution:
# > Failure processing application bundle; possible file corruption.
# > Arithmetic overflow while reading bundle.
# > A fatal error occured while processing application bundle
options=(!strip)

pkgver() {
    cd "${srcdir}"

    _pkg=$_source_x86_64
    if [ "${CARCH}" = "aarch64" ]; then
        _pkg=$_source_aarch64
    fi

    chmod +x ${_pkg}
    ./${_pkg} --version | sed -n 's/Tunnel CLI version: \(.*\)/\1/p'
}

package() {

    _pkg=$_source_x86_64
    if [ "${CARCH}" = "aarch64" ]; then
        _pkg=$_source_aarch64
    fi

    install -d "${pkgdir}/usr/bin"

    install -m755 "${srcdir}/${_pkg}" "${pkgdir}/usr/bin/${_bin_name}"
}
