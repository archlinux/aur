# Maintainer: rmb122 https://github.com/rmb122

_pkgname=xsecurelock
pkgname=xsecurelock-no-mouse-motion
pkgver=1.8.0
pkgrel=1
pkgdesc="X11 screen lock utility with security in mind, patched with ignore mouse motion option"
arch=('x86_64')
url="https://github.com/google/xsecurelock"
license=('APACHE')
depends=('pam' 'libxcomposite' 'libxmu' 'libxft' 'libxrandr' 'libxss')
makedepends=('xorg-xset')
optdepends=('xorg-xset: for the saver_blank module')
optdepends=('mplayer: for the saver_mplayer module'\
            'mpv: for the saver_mpv module'\
            'imagemagick: for the auth_pamtester module'\
            'pamtester: for the auth_pamtester module'\
            'xorg-xset: for the saver_blank module'\
            'xscreensaver: for the saver_xscreensaver module')
provides=('xsecurelock')
conflicts=('xsecurelock')
source=("https://github.com/google/xsecurelock/archive/v${pkgver}.tar.gz")
sha512sums=('c98aa9e5a5574a90a8b0cb8d41b67489c34689b489b9a079aa16493435d9dafdc090ac2e8ba5fa766d6ce2b3ee8ff12c09caa9eb851359be315f9d14563c8556')
install=$pkgname.install

prepare() {
    cd "$_pkgname-$pkgver"
    patch --forward --strip=1 --input="${startdir}/disable_motion.patch"
}

build() {
    cd "${_pkgname}-${pkgver}"
    sh autogen.sh
    ./configure --prefix=/usr \
                --libexecdir=/usr/lib \
                --with-pam-service-name=system-auth
    make GIT_VERSION="${pkgver}"
}

package() {
    cd "${_pkgname}-${pkgver}"
    make DESTDIR="${pkgdir}" install
}

# vim:set ts=4 sw=4 et:
