# Maintainer: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Florian Bruhin (The Compiler) <archlinux.org@the-compiler.org>
# Contributor: Samuli Thomasson <samuli.thomasson@paivola.fi>

pkgname=agendav
pkgver=2.6.0
pkgrel=1
pkgdesc="A CalDAV web client similar to Google Calendar."
arch=(any)
url="https://github.com/agendav/agendav"
license=('GPL')
depends=('php')
backup=("etc/webapps/agendav/settings.php")
options=('!strip')
source=(https://github.com/adobo/agendav/releases/download/$pkgver/agendav-$pkgver.tar.gz
        agendav.tmpfiles
        php.ini)
install=$pkgname.install
sha1sums=('6668524b1780f0aec375307c2bccb0f0a2b42c87'
          '7f9d5ea5921c446395b2b35b03ae3522b094a283'
          '33192382063a3b2474e33657e50d0a56ecf42d72')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    sed -i 's|\$app\['\''log\.path'\''\] = .*|$app['\''log.path'\''] = '\''/var/log/agendav/'\'';|' \
        web/config/default.settings.php
    sed -i 's|__DIR__\.'\''/\.\./var/cache/twig'\''|'\''/var/cache/agendav/twig'\''|' \
        web/config/prod.php
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    mkdir -p "${pkgdir}/usr/share/webapps/agendav/web/config"
    mkdir -p "${pkgdir}/etc/webapps/agendav"

    install -Dm644 web/config/default.settings.php \
        "${pkgdir}/etc/webapps/agendav/settings.php"

    ln -s /etc/webapps/agendav/settings.php \
        "${pkgdir}/usr/share/webapps/agendav/web/config/settings.php"

    install -dm755 -o http -g http "${pkgdir}/var/log/agendav"

    find . -type f -exec \
        install -D -m644 {,"${pkgdir}/usr/share/webapps/agendav/"}{} \;

    chmod +x "${pkgdir}/usr/share/webapps/agendav/agendavcli"

    install -Dm644 "$srcdir/agendav.tmpfiles" \
        "$pkgdir/usr/lib/tmpfiles.d/agendav.conf"
    rm -r "${pkgdir}/usr/share/webapps/agendav/web/var"

    install -Dm644 "$srcdir/php.ini" "$pkgdir/etc/php/conf.d/agendav.ini"
}
