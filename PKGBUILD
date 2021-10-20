# Maintainer: theguy147 <yakamoz147 (at) protonmail (dot) com>
pkgname=osintdb-git
pkgver=0.1.0.r0.g61e455c
pkgrel=1
pkgdesc='An OSINT ressource collection manager'
arch=('x86_64')
url="https://github.com/theosintguy/osintdb"
license=('MIT')
makedepends=('go>=1.14' 'npm')
depends=('libobjectbox')
source=("${pkgname}::git+${url}.git" "osintdb.desktop")
sha256sums=('SKIP' 'cfee7e4dba6b574877a3f3ca5adad94a5895d60b7043231d27fd1530e6e34666')

prepare() {
    # currently, there is no wails package in AUR so this hack is used until the package is published
    wails version &>/dev/null || (echo -e \
	    "\n==============================================================="\
	    "\n[ERROR] make sure Wails is installed and can be found in \$PATH"\
	    "\n===============================================================\n" && false)
}

pkgver() {
    cd "$pkgname"
    git describe --long --tags | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
    cd "$pkgname"
    wails build
}

package() {
    install -Dm644 osintdb.desktop "${pkgdir}/usr/share/applications/osintdb.desktop"

    cd "$pkgname"
    install -Dm755 build/osintdb "${pkgdir}/opt/osintdb/osintdb"
    install -Dm644 tools.min.json "${pkgdir}/opt/osintdb/tools.min.json"

    mkdir -p "${pkgdir}/usr/bin"
    ln -s /opt/osintdb/osintdb "${pkgdir}/usr/bin/osintdb"
}
