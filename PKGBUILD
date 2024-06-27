# Maintainer: Rohan Ferris <zjrohan at gmail dot com>

pkgname="kaze-icon-theme-git"
pkgver=r4.9b352cf
pkgrel=1
arch=("any")
pkgdesc="Kaze icon theme for KDE"
url="https://github.com/2O48/Kaze.git"
_reponame='Kaze'
_kazedark="${_reponame}/Kaze-dark"
_kazelight="${_reponame}/Kaze-light"
makedepends=('git')
depends=(
        "breeze"
)
provides=("kaze-icon-theme")
source=(
	"git+$url"
	"index.patch")
b2sums=('SKIP'
        '55b4c11b0902e4aeb7f121c1ec11dfdd8220663f7bff969bed6952b0bb4975edff29d15a28d685e482bf2c3b4ff2d024728c917d97d975250cd97266685928de')

pkgver() {
  cd "${_reponame}"
  ( set -o pipefail
    git describe --long --abbrev=7 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
  )
}

prepare() {
	#sed -i 's/Name=Kaze/Name=Kaze-dark/g' ${_kazedark}/index.theme
	#sed -i 's/Name=Kaze/Name=Kaze-light/g' ${_kazelight}/index.theme
	mv ${_kazedark}/64x64/apps/wacom\ tablet\ finder.svg ${_kazedark}/64x64/wacom-tablet-finder.svg
	mv ${_kazedark}/64x64/apps/kde\ partition\ manager.svg ${_kazedark}/64x64/kde-partition-manager.svg
	mv ${_kazelight}/64x64/apps/wacom\ tablet\ finder.svg ${_kazelight}/64x64/wacom-tablet-finder.svg
	mv ${_kazelight}/64x64/apps/kde\ partition\ manager.svg ${_kazelight}/64x64/kde-partition-manager.svg
	patch --directory=${_reponame} --forward --strip=1 --input=../index.patch
}

package() (
        install -d "$pkgdir/usr/share/icons"
	cp -r ${_kazedark} ${pkgdir}/usr/share/icons/
	cp -r ${_kazelight} ${pkgdir}/usr/share/icons/
	find ${pkgdir}/usr -type f -exec chmod 644 {} \;
        find ${pkgdir}/usr -type d -exec chmod 755 {} \;
)
