# Maintainer: Alex Indigo <iam@alexindigo.com>

pkgname=aerial-lock-git
_project=aerial-lock
pkgver=0.3.0.r0.g2884b89
pkgrel=6
pkgdesc='Wayland video session lock with idle integration and automatic content service'
arch=('x86_64')
url='https://github.com/atmosphera-dev/aerial-lock'
license=('GPL-3.0-or-later')
depends=('quickshell>=0.3' 'quickshell<0.4' 'qt6-mpvqml>=0.2.0'
         'qt6-5compat' 'qt6-base' 'qt6-declarative' 'pam' 'wayland'
         'bash' 'glibc' 'libgcc' 'libstdc++' 'libxkbcommon' 'xkeyboard-config'
         'dbus' 'libarchive' 'ffmpeg')
makedepends=('git' 'wayland-protocols')
optdepends=('procps-ng: signal-unlock examples'
            'systemd: content user service, optional aerial-idle and logind integration'
            'elogind: logind integration without systemd (unverified)')
provides=('aerial-lock')
conflicts=('aerial-lock')
backup=('etc/pam.d/aerial-lock')
install=aerial-lock-git.install
source=("${_project}::git+https://github.com/atmosphera-dev/aerial-lock.git")
sha256sums=('SKIP')

pkgver() {
    cd "${srcdir}/${_project}"
    local description
    description=$(git describe --long --tags) || return
    printf '%s\n' "$description" | sed 's/\([^-]*-g\)/r\1/;s/-/./g;s/^v//'
}

build() {
    cd "${srcdir}/${_project}"
    make PREFIX=/usr LIBEXECDIR=/usr/lib/aerial-lock DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}

package() {
    cd "${srcdir}/${_project}"
    make install DESTDIR="$pkgdir" PREFIX=/usr LIBEXECDIR=/usr/lib/aerial-lock DEBUG_DISMISS=0 DEBUG_VERBOSE=0
}
