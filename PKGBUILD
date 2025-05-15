# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: tri1976 <trile7@gmail.com>
# Contributor: snoopy33 <snoopy33@no-log.org>
# Contributor: ssfdust@gmail.com <ssfdust@gmail.com>

pkgname=cairo-dock-plug-ins-wayland-git
pkgver=3.5.99.rc2.20250501.d41b3c27f
pkgrel=1
pkgdesc='Plugins for Cairo-Dock with wayland support'
arch=('x86_64')
url='https://github.com/Cairo-Dock/cairo-dock-plug-ins'
license=('GPL')
depends=('cairo-dock-core-wayland-git')
makedepends=('alsa-lib'
             'ayatana-ido'
             'cmake'
             'dbus-sharp-glib'
             'fftw'
             'git'
             'gnome-menus'
             'gtk-sharp-2'
             'gtk-sharp-3'
             'gvfs'
             'libayatana-indicator'
             'libdbusmenu-gtk3'
             'libetpan'
             'libexif'
             'libical'
             'libpulse'
             'libxklavier'
             'lm_sensors'
             'python'
             'ruby'
             'upower'
             'vala'
             'vte3'
             'zeitgeist')
optdepends=('alsa-lib: Sound Control, Sound Effects applets'
            'dbus-sharp-glib: Mono API'
            'fftw: Impulse applet'
            'gnome-menus: Applications Menu applet'
            'gtk-sharp-3: Mono API'
            'gvfs: GVFS integration'
            'libetpan: Mail applet'
            'libexif: Slider applet'
            'libical: Clock applet'
            'libpulse: Impulse applet'
            'libxklavier: Keyboard Indicator applet'
            'lm_sensors: System Monitor applet'
            'python: Python 3 API'
            'ruby: Ruby API'
            'upower: Power Manager applet'
            'vte3: Terminal applet'
            'wireless_tools: Wifi applet'
            'zeitgeist: Recent Events applet')
replaces=('cairo-dock-plugins')
provides=("${pkgname%-git}" 'cairo-dock-plug-ins')
conflicts=("${pkgname%-git}" 'cairo-dock-plug-ins')
options=(debug)
source=("${pkgname}::git+https://github.com/Cairo-Dock/cairo-dock-plug-ins.git")
sha256sums=('SKIP')

_builddir="build"

pkgver () {
    cd "${srcdir}/${pkgname}"
    eval echo -n `grep -oP 'set\s*\(VERSION\s+\K(.*)(?=\))' CMakeLists.txt`
    printf ".%s.%s" "$(TZ=UTC git log -1 --pretty='%cd' --date=format-local:%Y%m%d)" "$(git rev-parse --short HEAD)"
}

prepare() {
    cd "${srcdir}/${pkgname}"

    sed 's/gmcs/mcs/' -i CMakeLists.txt

    if [[ -d "${srcdir}/${pkgname}/${_builddir}" ]];
    then
        rm -rf "${srcdir}/${pkgname}/${_builddir}"
    fi
    mkdir "${srcdir}/${pkgname}/${_builddir}"
}

build() {
    cd "${srcdir}/${pkgname}/${_builddir}"

    cmake .. \
        -DCMAKE_BUILD_TYPE='Release' \
        -DCMAKE_INSTALL_PREFIX='/usr'
    make -j$(nproc)
}

package() {
    cd "${srcdir}/${pkgname}/${_builddir}"

    make DESTDIR="${pkgdir}" install
}

# vim: ts=4 sw=4 et:
