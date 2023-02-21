_name=plasma-workspace
pkgname=${_name}-light
pkgver=5.27.1
pkgrel=1
pkgdesc='KDE Plasma Workspace (stripped from unnecessary dependencies)'
arch=('x86_64')
url='https://kde.org/plasma-desktop/'
license=('LGPL')
groups=('plasma')
conflicts=("${_name}")
provides=("${_name}")

depends=(
    'xorg-xrdb' 'xorg-xsetroot' 'xorg-xmessage'
    'knotifyconfig' 'ksystemstats' 'ktexteditor'
    'kactivitymanagerd' 'kactivities-stats' 'kquickcharts'
    'kwin' 'kpipewire' 'prison' 'accountsservice'
)

makedepends=(
    'extra-cmake-modules' 'qt5-tools'
    'plasma-wayland-protocols' 'wayland-protocols'
    'kunitconversion' 'kpeople' 'libqalculate'
)

optdepends=(
    'plasma-workspace-wallpapers: additional wallpapers'
    'kdepim-addons: displaying PIM events in the calendar'
    'appmenu-gtk-module: global menu support for GTK2 and some GTK3 applications'
    'kio-extras: show thumbnails in wallpaper selection'
    'kio-fuse: provide KIO support to legacy applications'
    'iso-codes: translation of country names in digital clock applet'
    'libqalculate: calculator for search/KRunner'
    'kpeople: access to contacts'
)

backup=('etc/pam.d/kde')
_snapshot="${_name}-${pkgver}"

source=(
    "https://download.kde.org/stable/plasma/${pkgver}/${_snapshot}.tar.xz"{,.sig}
    "https://raw.githubusercontent.com/archlinux/svntogit-packages/0628834a3baa9e1446e43d4f90fa8091243dd23d/trunk/kde.pam"
)

sha256sums=(
    '67883cd78115c4b71710ba79dc7986adc929d3bd04227f62b84a3129c275fe01'
    'SKIP'
    '00090291204baabe9d6857d3b1419832376dd2e279087d718b64792691e86739'
)

validpgpkeys=(
    'E0A3EB202F8E57528E13E72FD7574483BB57B18D' # Jonathan Esk-Riddell <jr@jriddell.org>
    '0AAC775BB6437A8D9AF7A3ACFE0784117FBCE11D' # Bhushan Shah <bshah@kde.org>
    'D07BD8662C56CB291B316EB2F5675605C74E02CF' # David Edmundson <davidedmundson@kde.org>
    '1FA881591C26B276D7A5518EEAAF29B42A678C20' # Marco Martin <notmart@gmail.com>
)

options=('!docs')

_disable=(
    'KF5DocTools'
    'KF5NetworkManagerQt'
    'KUserFeedback'
    'KF5Baloo'
    'KF5Holidays'
    'AppStreamQt'
    'KF5KExiv2'
)

_disable=("${_disable[@]/#/"-DCMAKE_DISABLE_FIND_PACKAGE_"}")
_disable=("${_disable[@]/%/"=ON"}")

build() {
    cmake -B "build" -S "${_snapshot}" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_INSTALL_LIBEXECDIR=lib \
        -DGLIBC_LOCALE_GEN=OFF \
        -DBUILD_TESTING=OFF \
        "${_disable[@]}"

    cmake --build "build"
}

package() {
    DESTDIR="${pkgdir}" cmake --install "build"
    install -Dm644 "kde.pam" "${pkgdir}/etc/pam.d/kde"

    # Split plasma-wayland scripts
    rm -r "${pkgdir}/usr/share/wayland-sessions"
}
