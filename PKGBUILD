# Maintainer: Victor A. Santos  <victoraur.santos@gmail.com>
pkgname=waf-git
pkgver=r3170.177bd3b0
pkgrel=2
pkgdesc="General-purpose build system modelled after Scons"
arch=('any')
url="http://waf.io"
license=('GPL3')
depends=('python')
makedepends=('python' 'perl')
conflicts=('waf')
provides=('waf')
source=("$pkgname::git+https://gitlab.com/ita1024/waf.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/${pkgname}"

	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/${pkgname}"

    python3 ./waf-light \
        configure --prefix=/usr \
        build --make-waf --tools='compat,compat15,ocaml,go,cython,scala,erlang,cuda,gcj,boost,pep8,eclipse,xcode6'
}

package() {
	cd "$srcdir/${pkgname}"

    install -Dm755 waf "$pkgdir/usr/bin/waf"

    local wafversion=$(./waf-light --version | perl -p -e 's/waf ([0-9.]+) .*/$1/g')
    local wafrevision=$(grep -aPom1 '(?<=^REVISION=")[[:xdigit:]]*(?="$)' "$pkgdir/usr/bin/waf")
    local waflib="$pkgdir/usr/lib/waf3-$wafversion-$wafrevision"

    install -dm755 "$waflib"
    unzip -d "$waflib" zip/waflib.zip

    # compile all python sources for once to be used after installation.
    python -m compileall "$waflib"
}
