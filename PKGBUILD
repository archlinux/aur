# Maintainer: Aleksandr Boiko <contact at via dot aur>
pkgname=bgerp-git
pkgver=r200.98ca5ef
pkgrel=1
pkgdesc="Open ERP system, git version"
arch=('any')
url="https://github.com/Pingvin235/bgerp"
license=('GPL')
groups=(bitel)
depends=('pwgen' 'jdk11-openjdk')
makedepends=('ant' 'git' 'jdk11-openjdk' 'unzip')
optdepends=('libmariadbclient' 'mariadb' 'nginx')
provides=("bgerp")
conflicts=("bgerp")
install=install
source=("${pkgname%-git}::git+$url.git"
        'environment'
        'sysusers')

# Please refer to the 'USING VCS SOURCES' section of the PKGBUILD man page for
# a description of each element in the source array.

pkgver() {
	cd "$srcdir/${pkgname%-git}"

# Git, tags available
#	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"

# Git, no tags available
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"

}

prepare() {
	cd "$srcdir/${pkgname%-git}"
    sed -i 's|#JAVA_HOME=|. /etc/conf.d/bgerp|' build/bgerp/files/setenv.sh
    chmod +x gradlew 
}

build() {
	cd "$srcdir/${pkgname%-git}"
	env JAVA_HOME=/usr/lib/jvm/java-11-openjdk ./gradlew buildUpdate
}

package() {
	cd "$srcdir/${pkgname%-git}"

    install -d -m0755 ${pkgdir}/opt
    mv build/bgerp/bgerp ${pkgdir}/opt/
 
    install -D -m0644 ../environment "${pkgdir}/etc/conf.d/${pkgname%-git}"
    install -D -m0644 ../sysusers "${pkgdir}/usr/lib/sysusers.d/${pkgname%-git}.conf"
    install -D -m 0644 ${pkgdir}/opt/${pkgname%-git}/scripts/${pkgname%-git}.service "$pkgdir/usr/lib/systemd/system/${pkgname%-git}.service"
    
    # delete unnecessary files
    rm -fr "$pkgdir/opt/${pkgname%-git}/scripts"
    # fix permission
    chmod 774 ${pkgdir}/opt/${pkgname%-git}/*.sh
}
md5sums=('SKIP'
         '670af068ebeb6d9e0e4278560b123254'
         '5654ced10dad0ba7dbd9da466bb4426c')
