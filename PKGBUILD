# Maintainer: Mathieu Bacou <mathieu at bacou dot me>
# Contributor: Joey Pabalinas <alyptik at protonmail dot com>
# Contributor: Allan McRae <allan at archlinux dot org>
# Committer: dorphell <dorphell at gmx dot net>

pkgname=screen-git
# screen will report its version as 4.99.0.
pkgver=5.0.0.r1324.9d8b0ff
pkgrel=1
pkgdesc='Full-screen window manager that multiplexes a physical terminal'
url='https://www.gnu.org/software/screen/'
arch=('x86_64' 'aarch64' 'armv7l' 'armv7h' 'armv6h' 'armv5')
license=('GPL')
depends=('ncurses' 'pam')
source=("${pkgname}::git+https://git.savannah.gnu.org/git/screen.git"
        'tmpfiles.d'
        'pam.d')
sha256sums=('SKIP'
            '1f33ce4faca7bd05dd80403411af31e682d5d23e79558e884ae5a35f1dd96223'
            '971c25929ea97422c09e10679ab98e9e6c59295aae1a4a9970909d2206e23090')
makedepends=('git')
backup=('etc/screenrc' 'etc/pam.d/screen')
options=('!makeflags')
conflicts=('screen')
provides=('screen')

_ptygroup=5 #the UID of our PTY/TTY group

pkgver() {
    cd "${srcdir}/${pkgname}" || exit 2

    set -o pipefail
    # Tag without the `.v` prefix
    tag=$(git tag --list --sort -v:refname | head -n1 | sed 's/^v.//')
    rev=$(git rev-list --count HEAD)
    hash=$(git rev-parse --short HEAD)
    printf "%s.r%s.%s" "$tag" "$rev" "$hash"
}

prepare() {
    cd "${srcdir}/${pkgname}/src" || exit 2

    NOCONFIGURE=1 ./autogen.sh
}

build() {
    cd "${srcdir}/${pkgname}/src" || exit 2

    ./configure \
        --prefix=/usr \
        --mandir=/usr/share/man \
        --infodir=/usr/share/info \
        --enable-colors256 \
        --enable-pam \
        --enable-rxvt_osc \
        --enable-telnet \
        --with-pty-group=$_ptygroup \
        --with-socket-dir=/run/screens \
        --with-sys-screenrc=/etc/screenrc

    make
}

package() {
    cd "${srcdir}/${pkgname}/src" || exit 2

    make DESTDIR="${pkgdir}" install

    install -Dm644 etc/etcscreenrc "${pkgdir}"/etc/screenrc
    install -Dm644 etc/screenrc "${pkgdir}"/etc/skel/.screenrc

    cd "${srcdir}"

    install -Dm644 pam.d "${pkgdir}"/etc/pam.d/screen
    install -Dm644 tmpfiles.d "${pkgdir}"/usr/lib/tmpfiles.d/screen.conf
}
