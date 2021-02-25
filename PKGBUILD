# Maintainer: GiacoLenzo2109 <GiacoLenzo2109@gmail.com>
# Contributor: Philip Müller <philm@garuda.org>
# Contributor: Bernhard Landauer <oberon@garuda.org>
# Contributor: Frede Hundewadt <fhatgarudarg>

_pkgbase=croco-tools
_ver=0.15.6
#_branch=stable-0.15.x
_branch=master

pkgbase=croco-tools-git
pkgname=('croco-tools-base-git'
        'croco-tools-pkg-git'
        'croco-tools-iso-git'
        'croco-tools-yaml-git')
pkgver=r18.38b258e
pkgrel=1
arch=('x86_64' 'i686')
pkgdesc='Development tools for croco Linux'
license=('GPL')
groups=('croco-tools')
url='https://gitlab.com/croco-os/tools/croco-tools'
makedepends=('git' 'docbook2x')
source=("croco-tools::git+$url.git#branch=$_branch")
sha256sums=('SKIP')

prepare() {
    cd ${srcdir}/${_pkgbase}
    # patches here
    sed -e "s/^Version=.*/Version=$_ver/" -i Makefile
    #sed -e "s/^Version=.*/Version=$pkgver/" -i Makefile
        if [ "${CARCH}" = "i686" ]; then
        patch -p2 -i ${srcdir}/croco-32.patch
    fi
}

pkgver() {
    cd ${srcdir}/${_pkgbase}
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd ${srcdir}/${_pkgbase}
    make SYSCONFDIR=/etc PREFIX=/usr
}

package_croco-tools-base-git() {
    pkgdesc='Development tools for croco Linux (base tools)'
    provides=("croco-tools-base=$_ver")
    depends=('openssh' 'rsync' 'haveged' 'os-prober' 'gnupg' 'pacman-mirrorlist>=20160301')
    optdepends=('croco-tools-pkg: croco Linux package tools'
                'croco-tools-iso: croco Linux iso tools'
                'croco-tools-yaml: croco Linux yaml tools')
    conflicts=('croco-tools-base')
    backup=('etc/croco-tools/croco-tools.conf')

    cd ${srcdir}/${_pkgbase}
    make SYSCONFDIR=/etc PREFIX=/usr DESTDIR=${pkgdir} install_base
}

package_croco-tools-pkg-git() {
    pkgdesc='Development tools for croco Linux (packaging tools)'
    provides=("croco-tools-pkg=$_ver")
    depends=('namcap' 'croco-tools-base-git')
    conflicts=('croco-tools-pkg' 'devtools')

    cd ${srcdir}/${_pkgbase}
    make SYSCONFDIR=/etc PREFIX=/usr DESTDIR=${pkgdir} install_pkg
}

package_croco-tools-yaml-git() {
    pkgdesc='Development tools for croco Linux (yaml tools)'
    provides=("croco-tools-yaml=$_ver")
    conflicts=('croco-tools-yaml')
    depends=('croco-tools-base-git' 'calamares-tools' 'ruby-kwalify')

    cd ${srcdir}/${_pkgbase}
    make SYSCONFDIR=/etc PREFIX=/usr DESTDIR=${pkgdir} install_yaml
}

package_croco-tools-iso-git() {
    pkgdesc='Development tools for croco Linux (ISO tools)'
	provides=("croco-tools-iso=$_ver")
    depends=('dosfstools' 'libisoburn' 'squashfs-tools' 'croco-tools-yaml-git'
            'mkinitcpio' 'mktorrent' 'grub' 'git')
	conflicts=('croco-tools-iso')
    optdepends=('virtualbox: quickly test isos'
                'snapd: for snapd support')

	cd ${srcdir}/${_pkgbase}
	make SYSCONFDIR=/etc PREFIX=/usr DESTDIR=${pkgdir} install_iso
}

