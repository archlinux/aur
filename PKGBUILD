# Maintainer: onedwide <one-d-wide@protonmail.com>
pkgname=systemd-hosts.d
pkgver=0.3
pkgrel=1
pkgdesc='Keep your hosts records in logically separated files'
url='https://github.com/one-d-wide/systemd-hosts.d'
arch=('any')
license=(GPL3)
depends=('filesystem' 'systemd')
makedepends=('git')

source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
  cd $pkgname
  printf "0.%s" "$(git rev-list --count HEAD)"
}

prepare() {
	cd "$pkgname"
	cat > systemd-hosts.d.hook <<EOF
[Trigger]
Operation = Install
Operation = Upgrade
Type = Package
Target = systemd-hosts.d

[Action]
Description = Saving /etc/hosts to /etc/hosts.d/hosts
When = PostTransaction
Depends = filesystem
Exec = /bin/sh -c '[[ ! -L /etc/hosts ]] && mv -b /etc/hosts /etc/hosts.d/hosts.conf; ln -sf /run/hosts /etc/hosts'
EOF
	cat > systemd-hosts.d-cleanup.hook <<EOF
[Trigger]
Operation = Remove
Type = Package
Target = systemd-hosts.d

[Action]
Description = Returning normal /etc/hosts file
When = PreTransaction
Depends = filesystem
Exec = /bin/sh -c '[[ -L /etc/hosts ]] && rm /etc/hosts; mv /etc/hosts.d/hosts.conf /etc/hosts || mv /run/hosts /etc/hosts || cat >/etc/hosts'
EOF
}

package() {
	cd "$pkgname"
    mkdir -pm755 "$pkgdir/etc/hosts.d"
    install -Dm644 systemd-hosts.d{,-cleanup}.hook -t "$pkgdir"/usr/share/libalpm/hooks
    install -Dm644 systemd-hosts.d.{path,service} -t "$pkgdir"/usr/lib/systemd/system

    install -d -m755 "$pkgdir"/usr/lib/systemd/system/network-pre.target.wants
    ln -s ../systemd-hosts.d.path "$pkgdir"/usr/lib/systemd/system/network-pre.target.wants/systemd-hosts.d.path
    install -d -m755 "$pkgdir"/usr/lib/systemd/system/network-pre.target.requires
    ln -s ../systemd-hosts.d.service "$pkgdir"/usr/lib/systemd/system/network-pre.target.requires/systemd-hosts.d.service
}
