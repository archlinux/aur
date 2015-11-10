# Maintainer: Caleb Maclennan <caleb@alerque.com>

pkgname=kanban-bin
pkgver=1.4.1
pkgrel=2
pkgdesc="Self hosted Kanban board for GitLab issues (precompiled binary)"
arch=('x86_64')
url="http://kanban.leanlabs.io/"
license=('MIT')
depends=('redis')
conflicts=('kanban')
source=("kanban::https://github.com/leanlabsio/kanban/releases/download/${pkgver}/kanban_x86_64_linux"
        "kanban.service")
sha256sums=('6c4f9e3a48d29a16689fc825b34ff7e4705bea70dddb84cd4831a90397b0a455'
            '40273cb5169a462b609b852b40e18eeb1cb742ebd6ced1181831e5eae108407e')

post_install() {
    groupadd kanban &>/dev/null
    useradd -d "${_homedir}" -g kanban -s "/bin/false" kanban
}

post_remove() {
	getent passwd kanban >/dev/null 2>&1 && userdel -r kanban
	getent group kanban >/dev/null 2>&1 && groupdel kanban
}
package() {
    install -Dm755 "kanban" "${pkgdir}/usr/bin/kanban"
    install -Dm0644 kanban.service "${pkgdir}/usr/lib/systemd/system/kanban.service"
}
