# Maintainer: Markus Richter <mqus at disroot dot org>

pkgname=drone-runner-exec-git
_pkgbase=drone-runner-exec
pkgver=v1.0.0.beta.9.r2.gc0a612e
pkgrel=1
pkgdesc="A CI/CD runner for drone, which runs its tasks locally on the machine without any virtualization."
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
url="https://github.com/drone-runners/drone-runner-exec"
license=('custom')
depends=()
optdepends=()
makedepends=('go' 'git')
provides=("$_pkgbase") 
conflicts=("$_pkgbase-bin")
backup=('etc/drone-runner-exec.env')
install=drone-runner-exec.install
source=('git+https://github.com/drone-runners/drone-runner-exec.git'
        "https://polyformproject.org/wp-content/uploads/2020/05/PolyForm-Small-Business-1.0.0.txt"
        "https://polyformproject.org/wp-content/uploads/2020/05/PolyForm-Free-Trial-1.0.0.txt"
	"config.template"
	"${_pkgbase}.install"
	"${_pkgbase}.service"
	"${_pkgbase}.sysusers.conf"
	"${_pkgbase}.tmpfiles.conf")
sha512sums=('SKIP'
            '34514288fd78afcc21b86ff5d23dc0e4ccc8dc67d2db032480a3cfb89de5ad9bb19370cad8049a104fa3d44b5e03c208dc8425aa24bcd7e763c3673c7514beb6'
            '66e97a91ce27f2711a102f47660fc407b0fdde35564c64ab3c2fae55cbdb3fadf957cafcb0b19c6be94d6a2336cbfb92ee2d8ecf58c8ef627ba601e7bfadcee0'
            'eb074efe356c22849b457c8e53c8ffb2eed968660cad0acc28836abda9c16259442a1df7c0660356e42ff53bfe59542028319fe1e55f0eea994b97a316f982e1'
            '02f872df18308e5dd13003adac9f17aabe70506870603672031838a1e0263e6b118fce9a91e10300a864a16697301144f498123d277a022db41aea1c00c80072'
            'ce53a620c6277e531734ff0807e66ac918495b337c7763d51a94587bacaea247d1d4c61e506ecb6816aa8e5676312698ed2f2116ee38e031135003ebf6cfcb4e'
            '34e3ee581f4415aec7e98c11f4bfb9f225aec05de068da1c858806a3148ec72102a156c934499091f31e42b4e50fa9fab9f2e8ce62707463b727e3735fd4719d'
            'b093531f17ae9f92c55ab55a613923b8276873abf6b608bf95cec8fa1f174d30756ab81ac80294d97fd3aac536bb7144423fae8862ccbfd65c77b6dbe785e4f1')


pkgver() {
	cd "$srcdir/$_pkgbase"
	( set -o pipefail
	    git describe --long --tags 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
	    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
	)
}

build() {
	#build drone-runner-exec
	cd "$srcdir/$_pkgbase"
	
	go build \
		-trimpath \
		-buildmode=pie \
		-mod=readonly \
		-modcacherw \
		-ldflags "-linkmode external -extldflags \"${LDFLAGS}\""
}

package() {
	# setup systemd service
	install -D -m 0644 "$srcdir/drone-runner-exec.service" "$pkgdir/usr/lib/systemd/system/drone-runner-exec.service"
	
	# declarative setup of user and directory
	install -D -m 0644 "$srcdir/drone-runner-exec.sysusers.conf" "$pkgdir/usr/lib/sysusers.d/drone-runner-exec.conf"
	install -D -m 0644 "$srcdir/drone-runner-exec.tmpfiles.conf" "$pkgdir/usr/lib/tmpfiles.d/drone-runner-exec.conf"
	
	# copy license files
	install -D -m 0644 "$srcdir/PolyForm-Small-Business-1.0.0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -D -m 0644 "$srcdir/PolyForm-Free-Trial-1.0.0.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	
	# copy default config file
	install -D -m 0644 "$srcdir/config.template" "$pkgdir/etc/drone-runner-exec.env"
	
	# copy binary
	install -D -m 0755 "$srcdir/$_pkgbase/drone-runner-exec" "$pkgdir/usr/bin/drone-runner-exec"
}
