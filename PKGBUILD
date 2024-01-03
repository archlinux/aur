# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: Tofe <chris.chapuis@gmail.com>
# Contributor: zhuqin <zhuqin83@gmail.com>
# Contributor: tri1976 <trile7@gmail.com>
# Contributor: snoopy33 <snoopy33@no-log.org>
# Contributor: ssfdust@gmail.com <ssfdust@gmail.com>

pkgname=cairo-dock-plug-ins-wayland-git
pkgver=3.4.99.alpha1.20231110.f7e1711bf
pkgrel=1
pkgdesc='Plugins for Cairo-Dock'
arch=('x86_64')
url='https://github.com/dkondor/cairo-dock-plug-ins'
license=('GPL')
depends=('cairo-dock')
makedepends=('alsa-lib' 'cmake' 'dbus-sharp-glib' 'fftw' 'gnome-menus'
             'gtk-sharp-3' 'gvfs' 'libetpan' 'libexif' 'libical' 'libpulse'
             'libxklavier' 'lm_sensors' 'python' 'ruby' 'upower'
             'vala' 'vte3' 'zeitgeist')
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
source=("${pkgname}::git+https://github.com/dkondor/cairo-dock-plug-ins#branch=egl_scale")
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
