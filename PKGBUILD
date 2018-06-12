# Maintainer: Jeong Arm <kjwonmail@gmail.com>
pkgname=ibus-hangul-3beol
_pkgname=ibus-hangul
pkgrel=1
pkgdesc="ibus-hangul from createsc/3beol PPA"
arch=('x86_64')
url="https://launchpad.net/~createsc/3beol"
license=('unknown')
groups=()
depends=('libhangul')
makedepends=('intltool' 'automake' 'autoconf' 'libhangul' 'gnome-common')
provides=('ibus-hangul')
conflicts=('ibus-hangul')
replaces=()
backup=()
options=()
install=
noextract=()

# XXX Disable this because new lines are joined into space
# INFO="$(
# 	curl -qs http://ppa.launchpad.net/createsc/3beol/ubuntu/dists/bionic/main/source/Sources.gz |\
# 	gunzip |\
# 	awk -v RS= '{ if ($2 == "ibus-hangul") { print $0 } }'
# 	)"


source_basedir=$(
    curl -qs http://ppa.launchpad.net/createsc/3beol/ubuntu/dists/bionic/main/source/Sources.gz |\
    gunzip |\
    awk -v RS= '{ if ($2 == "ibus-hangul") { print $0 } }' |\
    grep -e '^Directory' |\
    awk '{print $2}'
    )

source_info=($(
    curl -qs http://ppa.launchpad.net/createsc/3beol/ubuntu/dists/bionic/main/source/Sources.gz |\
    gunzip |\
    awk -v RS= '{ if ($2 == "ibus-hangul") { print $0 } }' |\
    sed -ne '/^ [0-9a-f]\{64\} [0-9]\+ .*/p' |\
    grep tar.xz
    ))

sha256sums=(
    ${source_info[0]}
    )

source_url="http://ppa.launchpad.net/createsc/3beol/ubuntu/${source_basedir}/${source_info[2]}"

source=("$source_url")

pkgver=$(
    curl -qs http://ppa.launchpad.net/createsc/3beol/ubuntu/dists/bionic/main/source/Sources.gz |\
    gunzip |\
    awk -v RS= '{ if ($2 == "ibus-hangul") { print $0 } }' |\
    grep -e '^Version' | awk '{print $2}' |\
    tr '-' '_'
    )

prepare() {
	cd "$srcdir/$_pkgname"
}

build() {
	cd "$srcdir/$_pkgname"
    # touch config.rpath
	./autogen.sh
	./configure --prefix=/usr
	make
}

check() {
	cd "$srcdir/$_pkgname"
	make -k check
}

package() {
	cd "$srcdir/$_pkgname"
	make DESTDIR="$pkgdir/" install
}
