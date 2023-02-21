_name=plasma-desktop
pkgname=${_name}-light
pkgver=5.27.1
pkgrel=1
pkgdesc='KDE Plasma Desktop (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://kde.org/plasma-desktop/'
license=('LGPL')
groups=('plasma')
conflicts=("${_name}")
provides=("${_name}")

depends=(
    'plasma-workspace' 'plasma-integration'
    'knewstuff' 'knotifications' 'kdeclarative'
    'kded' 'kdelibs4support' 'kde-cli-tools'
)

makedepends=(
    'extra-cmake-modules' 'xorg-server-devel'
    'xf86-input-evdev' 'xf86-input-synaptics' 'xf86-input-libinput'
    'kdoctools' 'kdesignerplugin' 'kaccounts-integration' 'kinit' 'krunner'
    'intltool' 'wayland-protocols'
)

optdepends=(
    'plasma-nm: Network manager applet'
    'plasma-pa: applet for audio volume management using PulseAudio'
    'powerdevil: power management, suspend and hibernate support'
    'kscreen: screen management'
    'krunner: launch and search applications'
    'kinit: process launcher to speed up launching KDE applications'
    'kaccounts-integration: online account management system'
)

_snapshot="${_name}-${pkgver}"
source=("https://download.kde.org/stable/plasma/${pkgver}/${_snapshot}.tar.xz"{,.sig})

sha256sums=(
    '2e7b705297fd35d7938518338c6cfc75550910334fa6802b654e940421ffc05d'
    'SKIP'
)

validpgpkeys=(
    'E0A3EB202F8E57528E13E72FD7574483BB57B18D' # Jonathan Esk-Riddell <jr@jriddell.org>
    '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D' # Bhushan Shah <bshah@kde.org>
    'D07BD8662C56CB291B316EB2F5675605C74E02CF' # David Edmundson <davidedmundson@kde.org>
    '1FA881591C26B276D7A5518EEAAF29B42A678C20' # Marco Martin <notmart@gmail.com>
)

options=('!docs')

_disable=(
    'KAccounts'
    'KF5Baloo'
    'PackageKitQt5'
    'GLIB2'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DBUILD_TESTING=OFF \
        -DDISABLE_ALL_OPTIONAL_SUBDIRECTORIES=ON \
        -DSCIM_FOUND=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
}
