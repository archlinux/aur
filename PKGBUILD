# Maintainer: mammo0 <marc.ammon@hotmail.de>
pkgname=owncloud-client-desktop-shell-integration-nautilus
_resources_pkgname=client-desktop-shell-integration-resources
pkgver=6.0.0
_resources_pgkver=1.0.0
pkgrel=4
pkgdesc="A Python extension for Nautilus and its forks Nemo and Caja to provide shell integration for the ownCloud desktop client for the GNOME, Cinnamon and MATE desktop environments."
arch=('any')
url="https://github.com/owncloud/client-desktop-shell-integration-nautilus"
license=('GPL-2.0')
depends=('owncloud-client>=6')
makedepends=('cmake' 'ninja' 'extra-cmake-modules')
source=(
    "extension.tar.gz::https://github.com/owncloud/${pkgname#*-}/archive/refs/tags/v${pkgver}.tar.gz"
    "resources.tar.gz::https://github.com/owncloud/${_resources_pkgname}/archive/refs/tags/v${_resources_pgkver}.tar.gz"
)
sha256sums=(
    '7d37b484b117be3ac69f6cdd650e648765b6960ae4a4308ca43c05b16ee09748'
    'dcd5821d422fe9923e774978e93ffe3ba8825094f9f77c596b5b0dba65641da8'
)

_cmake_build_dir="build"
_archivedir="${pkgname#*-}-${pkgver}"
_resources_archivedir="${_resources_pkgname}-${_resources_pgkver}"

build() {
    # from https://github.com/owncloud/client-desktop-shell-integration-nautilus/blob/master/.github/workflows/main.yml
    # first build resources
    cd "${srcdir}/${_resources_archivedir}"

    mkdir -p "${_cmake_build_dir}"
    cmake -B "${_cmake_build_dir}" \
          -DCMAKE_BUILD_TYPE=Release \
          --install-prefix "${pkgdir}/usr"

    # then build the extension
    cd "${srcdir}/${_archivedir}"

    mkdir -p "${_cmake_build_dir}"
    cmake -B "${_cmake_build_dir}" \
          -DownCloudShellResources_DIR="${srcdir}/${_resources_archivedir}/${_cmake_build_dir}" \
          -DCMAKE_BUILD_TYPE=Release \
          -G Ninja \
          --install-prefix "${pkgdir}/usr"
}

package() {
    # resources
    # do not install *.cmake files; they are marked as component "Devel"
    cmake --install "${srcdir}/${_resources_archivedir}/${_cmake_build_dir}" --component Unspecified

    # extension
    ninja install -C "${srcdir}/${_archivedir}/${_cmake_build_dir}"
}
