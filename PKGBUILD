# Maintainer: Ingo Meyer <i.meyer@fz-juelich.de>

pkgname="sidedoor"
pkgver="0.2.1"
pkgrel="1"
pkgdesc="An SSH connection daemon which maintains a reverse tunnel"
arch=("any")
url="https://github.com/daradib/sidedoor"
license=("GPL3")
depends=("openssh")
makedepends=()
optdepends=()
source=("https://github.com/daradib/sidedoor/releases/download/debian%2F${pkgver}-1/sidedoor_${pkgver}-1_all.deb")
sha256sums=("51857705134e4cc83d6cfb786b15097d084273554b62fe21f5168d48848825b7")

package() {
    bsdtar -xf data.tar.xz -C "${pkgdir}" && \
    cd "${pkgdir}" || return

    # Remove init scripts from the package since Arch uses systemd
    rm -rf etc/init.d || return

    # Move `/lib` to `/usr/lib` since `/lib` is only a sym-link to `/usr/lib`
    # on Arch; otherwise the package installation will throw an error because
    # it would overwrite the `/lib` symlink
    mv lib usr/ || return

    # Translate the package post-install script; use sysuser and tmpfiles config
    # files to create a user account and needed (empty) files
    install -d \
        "usr/lib/sysusers.d" \
        "usr/lib/tmpfiles.d" && \
    cat <<-'EOF' >"usr/lib/sysusers.d/${pkgname}.conf" || return
		u sidedoor - "sidedoor daemon user" /var/lib/sidedoor /bin/sh
	EOF
    cat <<-'EOF' >"usr/lib/tmpfiles.d/${pkgname}.conf" || return
		f /etc/sidedoor/id_rsa 0640 root sidedoor -
		f /etc/sidedoor/known_hosts 0644 root root -
		f /var/lib/sidedoor/.ssh/authorized_keys 0644 root root -
	EOF
}
