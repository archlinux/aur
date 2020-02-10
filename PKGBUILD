# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=kanban-bin
pkgver=1.7.1
pkgrel=1
pkgdesc='Self hosted Kanban board for GitLab issues (precompiled binary)'
arch=('x86_64')
url='https://kanban.leanlabs.io/'
license=('MIT')
depends=('redis')
conflicts=('kanban')
source=("kanban::https://github.com/leanlabsio/kanban/releases/download/$pkgver/kanban_x86_64_linux"
        "kanban.service"
        "apache2.4.conf.example"
        "apache2.4-ssl.conf.example"
        )
sha256sums=('7c143c359766040550d87b5d597a73ab7e0c4547c7dad94cfc7c71b27b4028a6'
            '40273cb5169a462b609b852b40e18eeb1cb742ebd6ced1181831e5eae108407e'
            'a9d1cb56a566cdc5ced67e8d783b683fd8a4bf27f14a2e876c965d4c2ffc99fc'
            '86f5a034ad456b786a0d809297a5451dc48443f9e2e2f92147477818bd552170')
_homedir='/var/lib/kanban'
_etcdir="/etc/webapps/kanban"

post_install() {
    groupadd kanban &>/dev/null
    useradd -d "$_homedir" -g kanban -s "/bin/false" kanban
}

post_remove() {
	getent passwd kanban >/dev/null 2>&1 && userdel -r kanban
	getent group kanban >/dev/null 2>&1 && groupdel kanban
}
package() {
    install -Dm0755 "kanban" "$pkgdir/usr/bin/kanban"
    install -Dm0644 kanban.service "$pkgdir/usr/lib/systemd/system/kanban.service"
    for __cfg in apache2.4 apache2.4-ssl; do
        install -Dm0644 "$srcdir/$__cfg.conf.example" "$pkgdir$_etcdir/$__cfg.conf.example"
    done
}
