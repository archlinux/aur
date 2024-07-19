pkgname=convos-git
pkgver=8.07
pkgrel=1
pkgdesc="simplest way to use IRC in your browser."
arch=('x86_64')
url="https://convos.chat/"
license=('Artistic-2.0')
depends=('perl' 'openssl' 'perl-crypt-passphrase' 'perl-crypt-passphrase-argon2' 'perl-crypt-passphrase-bcrypt'
		'perl-file-homedir' 'perl-file-readbackwards' 'perl-http-acceptlanguage' 'perl-syntax-keyword-try' 'perl-future-asyncawait'
		'perl-io-socket-ssl' 'perl-irc-utils' 'perl-json-validator' 'perl-link-embedder' 'perl-module-install'
		'perl-mojolicious' 'perl-mojolicious-plugin-openapi' 'perl-mojolicious-plugin-syslog' 'perl-parse-irc'
		'perl-text-markdown-hoedown' 'perl-time-piece' 'perl-unicode-utf8' 'perl-cpanel-json-xs' 'perl-ev' 'perl-yaml-libyaml' 'perl-mojolicious')
makedepends=('git' 'cpanminus')
checkdepends=('perl-test-deep')
source=("git+https://github.com/convos-chat/convos.git"
		"convos.service")
sha256sums=('SKIP' '453f0e3404114d97c3b4ddc9f9ae3de559d827c63e2710170735d3317973ccca')
build() {
    cd "$srcdir/convos"
    ./script/convos install
}
package() {
    cd "$srcdir/convos"
    install -d "$pkgdir/usr/bin"
    install -d "$pkgdir/usr/share/convos"
    install -Dm755 script/convos "$pkgdir/usr/bin/convos"
    cp -r . "$pkgdir/usr/share/convos"
    install -Dm644 "$srcdir/convos.service" "$pkgdir/usr/lib/systemd/system/convos.service"
    find "$srcdir/convos" -name '*.pm' -exec install -Dm644 {} "$pkgdir/usr/share/convos/lib/perl5/{}" \;
    sed -i 's|Environment=PERL5LIB=.*|Environment=PERL5LIB=/usr/share/convos/lib/perl5|g' "$pkgdir/usr/lib/systemd/system/convos.service"
}

