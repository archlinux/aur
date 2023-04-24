# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="msmtp-git"
pkgver="1.8.23.r3.gaf851aa"
pkgrel="1"
pkgdesc="A mini smtp client"
arch=("x86_64")
url="https://marlam.de/msmtp/"
license=("GPL3")
depends=("libsecret" "gsasl")
makedepends=("git" "texlive-plainextra" "libsecret" "gsasl")
provides=("${pkgname%-*}=${pkgver}")
conflicts=("${pkgname%-*}")
source=("${pkgname%-*}::git+https://git.marlam.de/git/${pkgname%-*}.git#branch=master")
sha256sums=("SKIP")

pkgver() {
    cd "${srcdir}/${pkgname%-*}" || return
    git describe --long --tags | sed 's/^msmtp.//;s/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "${srcdir}/${pkgname%-*}" || return
    aclocal && \
    autoconf && \
    automake --add-missing && \
    ./configure --prefix=/usr --sysconfdir=/etc --with-libgsasl && \
    make && \
    make -C doc html pdf
}

package() {
    cd "${srcdir}/${pkgname%-*}" || return
    make DESTDIR="${pkgdir}" install && \
    make DESTDIR="${pkgdir}" -C doc install-html install-pdf || return

    # Installing example configs and scripts to /usr/share/doc/msmtp
    # as they are not installed by default (Debian and Gentoo do it this way)
    install -d "${pkgdir}/usr/share/doc/msmtp" && \
    cp -r scripts/{find_alias,msmtpqueue,msmtpq,set_sendmail} "${pkgdir}/usr/share/doc/msmtp/" && \
    install -D -m644 doc/*.example "${pkgdir}/usr/share/doc/msmtp/" && \

    install -D -m644 scripts/vim/msmtp.vim "${pkgdir}/usr/share/vim/vimfiles/syntax/msmtp.vim" && \

    chmod 755 "${pkgdir}"/usr/share/doc/msmtp/{find_alias,msmtpqueue,set_sendmail}/*.sh && \
    chmod 755 "${pkgdir}"/usr/share/doc/msmtp/msmtpq/msmtp*
}
