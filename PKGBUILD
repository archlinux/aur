# Maintainer: kyndair
# kf5 group or kde-development-environment-meta will include all required dependencies

pkgname='gitklient-git'
_pkgname='gitklient'
pkgver=0.4.0.r451.59896eb
pkgrel=1
pkgdesc='KDE git gui'
arch=('i686' 'x86_64')
url='https://apps.kde.org/gitklient/'
license=('GPL3')
provides=('gitklient')
conflicts=('gitklient')
makedepends=('cmake' 'extra-cmake-modules' 'gettext' 'git' 'kdoctools' 'ktexteditor')
depends=('fontconfig' 'freetype2' 'hicolor-icon-theme' 'kauth' 'kcodecs' 'kcompletion' 'kconfigwidgets' 'kconfig' 'kcoreaddons' 'kcrash' 'kdbusaddons' 'kio' 'kitemviews' 'ki18n' 'kjobwidgets' 'kparts' 'kservice' 'ktextwidgets' 'kwidgetsaddons' 'kxmlgui' 'qt5-base' 'solid' 'sonnet' 'syntax-highlighting')
source=("git+https://invent.kde.org/sdk/gitklient.git")
sha256sums=('SKIP')

# update the package version to the current git version if no git version exists fallback to version set in cmake + rev count
pkgver() {
        cd "${srcdir}/${_pkgname}"
        if [ -e no-version ]; then
                rm no-version
        fi
        git describe --long --tags 2> no-version | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
        if [ -e no-version ]; then
                _major=$(grep -Po '(?<=set\(PROJECT_VERSION_MAJOR\ )[^)]+' CMakeLists.txt)
                _minor=$(grep -Po '(?<=set\(PROJECT_VERSION_MINOR\ )[^)]+' CMakeLists.txt)
                _patch=$(grep -Po '(?<=set\(PROJECT_VERSION_PATCH\ )[^)]+' CMakeLists.txt)
                _revcount=$(printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)")
                echo ${_major}.${_minor}.${_patch}.${_revcount}
        fi
}

build() {
        cd "${srcdir}/${_pkgname}"
        mkdir -p build
        cd build
        cmake ..
        make -j 8
}

package() {
        cd "${srcdir}/${_pkgname}/build"
        make DESTDIR="$pkgdir/" install
}
