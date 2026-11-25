# Maintainer: Marek Samec <samec.marek@gmail.com>
#
# Prebuilt package: repackages the Arch package that the release workflow
# (.github/workflows/release.yml, build-arch job) attaches to each GitHub
# release, so nothing is compiled here. The release workflow's publish-aur-bin
# job sets pkgver and the checksum for each stable release and pushes the
# result to the AUR; see packaging/aur/README.md.
pkgname=nvbeam-bin
_pkgname=nvbeam
pkgver=0.3.1
pkgrel=1
pkgdesc="Fast, native Neovim GUI client built with Qt6 and C++ (prebuilt)"
arch=('x86_64')
url="https://github.com/mareksamec/nvbeam"
license=('MIT')
depends=(
    'qt6-base'
    'qtermwidget'
    'syntax-highlighting'
    'neovim>=0.10'
    'hicolor-icon-theme'
)
provides=("${_pkgname}=${pkgver}")
conflicts=("${_pkgname}" "${_pkgname}-git")
# The upstream package is already stripped and its debug symbols ship as the
# separate nvbeam-debug release asset.
options=('!strip' '!debug')

# makepkg forbids hyphens in pkgver, so a pre-release tag is carried as
# "0.2.0_rc1" here while the tag itself reads "v0.2.0-rc1". _tag maps it back.
# _upstream_pkgrel is the pkgrel the release workflow builds with.
_tag="v${pkgver//_/-}"
_upstream_pkgrel=1
_asset="${_pkgname}-${pkgver}-${_upstream_pkgrel}-${arch[0]}.pkg.tar.zst"

# makepkg extracts the .pkg.tar.zst into $srcdir: usr/ plus the package
# metadata files (.PKGINFO, .MTREE, ...), of which only usr/ is used.
source=("${_asset}::${url}/releases/download/${_tag}/${_asset}")
sha256sums=('ebb08518f19dcdaeed0ca5bc4d2992428c4ce11f1f529dbe5da62db09d663f70')

package() {
    cp -a "${srcdir}/usr" "${pkgdir}/"

    # The upstream package installs its license under its own name; move it to
    # this package's name where AUR/namcap expect it.
    mv "${pkgdir}/usr/share/licenses/${_pkgname}" \
       "${pkgdir}/usr/share/licenses/${pkgname}"
}
