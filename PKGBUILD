# Contributor: Francesco Colista <fcolista@alpinelinux.org>
# Maintainer: Francesco Colista <fcolista@alpinelinux.org>
pkgname=patchwork
pkgver=20150608
pkgrel=0
pkgdesc="Web-based patch tracking system"
url="http://jk.ozlabs.org/projects/patchwork/"
arch=('x86' 'x86_64')
license=('GPL')
depends=('python-django' 'git' 'django-registration')
makedepends=('git')
install=""
_gitroot="git://ozlabs.org/home/jk/git/patchwork"
_gitname="patchwork"

build() {
    cd "$srcdir"
	msg "Connecting to GIT server...."
	if [ -d $_gitname ] ; then
		cd $_gitname && git pull origin
		msg "The local files are updated."
	else
		git clone $_gitroot $_gitname
	fi
}

package() {
        cd "$srcdir/$_gitname"
        mkdir -p "$pkgdir"/etc/$pkgname
        mkdir -p "$pkgdir"/usr/share/webapps/$pkgname
        for file in patchwork docs htdocs lib templates tools; do
                cp -r $file "$pkgdir"/usr/share/webapps/$pkgname
        done
        cp patchwork/settings/production.example.py "$pkgdir"/etc/$pkgname/local_settings.py
        ln -sf /etc/patchwork/local_settings.py "$pkgdir"/usr/share/webapps/patchwork/patchwork/settings/production.example.py
}
