# Maintainer: h_cheung <mail@h-cheung.cf>
pkgname=clash-tun
pkgver=20200319.r402.2100ef7
pkgrel=2
pkgdesc="Clash Tun Scripts for Linux"
arch=('any')
url="https://github.com/h0cheung/kr328-clash-setup-scripts"
license=('custom')
groups=()
provides=("clash")
conflicts=("clash-bin" "clash" "clash-dev-git")
makedepends=('go' 'git')
depends=('glibc')
backup=(etc/clash/env)
options=()
source=("git+https://github.com/comzyh/clash#branch=add-water"
		"git+https://github.com/h0cheung/kr328-clash-setup-scripts"
		"https://raw.githubusercontent.com/comzyh/clash/master/LICENSE")
md5sums=('SKIP'
         'SKIP'
         '7462fda797df0a48961ab34179d8793e')
validpgpkeys=()

pkgver() {
    cd "${srcdir}/clash"
    local date=$(git log -1 --format="%cd" --date=short | sed s/-//g)
    local count=$(git rev-list --count HEAD)
    local commit=$(git rev-parse --short HEAD)
    echo "$date.r${count}.$commit"
}

build() {
    cd "${srcdir}/clash"
    go build .
}

package() {
    cd "${srcdir}/clash"
    install -m 755 -D "clash" "${pkgdir}/usr/bin/clash"
    install -m 644 -D "${srcdir}/LICENSE" "${pkgdir}/usr/share/licenses/clash/LICENSE"
    cd "${srcdir}/kr328-clash-setup-scripts"
    install -m 755 -D "bypass-proxy" "${pkgdir}/usr/bin/bypass-proxy"
    install -m 755 -D "bypass-proxy-pid" "${pkgdir}/usr/bin/bypass-proxy-pid"
    install -m 744 -D "setup-clash-tun.sh" "${pkgdir}/opt/script/setup-clash-tun.sh"
    install -m 744 -D "setup-clash-cgroup.sh" "${pkgdir}/opt/script/setup-clash-cgroup.sh"
    install -m 744 -D "clean-clash-tun.sh" "${pkgdir}/opt/script/clean-clash-tun.sh"
    install -m 644 -D "clash.service" "${pkgdir}/usr/lib/systemd/system/clash-tun.service"
    install -m 644 -D "env" "${pkgdir}/etc/clash-tun/env"
    install -m 775 -d -o 65534 -g 1000 "${pkgdir}/srv/clash"
}
