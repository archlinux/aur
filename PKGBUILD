# Maintainer: Alexander Bauer <sasha@linux.com>
pkgname=deschedule-git

orig_pkgname="${pkgname%-git}"

pkgver=r136.c092b4b
pkgrel=1
pkgdesc="Webapp for generating ICalendar files from collaborative class schedules"
arch=('any')
url="https://github.com/alexander-bauer/deschedule"
license=('GPL3')
groups=()
depends=('python')
makedepends=('git' 'python')
provides=("$orig_pkgname")
conflicts=("$orig_pkgname")
replaces=()
backup=('etc/deschedule/config.py')
options=()
install=
source=("$orig_pkgname::git+https://github.com/alexander-bauer/deschedule.git#branch=master")
noextract=()
md5sums=('SKIP')



pkgver() {
	cd "$srcdir/$orig_pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd "$srcdir/$orig_pkgname"
    make requirements
}

package() {
	cd "$srcdir/$orig_pkgname"
    gitver="$(git describe --always --dirty=+)"

    mkdir -p "$pkgdir/opt/$orig_pkgname/"
    cp -r "app" "flask" "Makefile" "run.py" "$pkgdir/opt/$orig_pkgname/"
    echo "$gitver" > "$pkgdir/opt/$orig_pkgname/VERSION"

    install -p -D -m640 "config.py" "$pkgdir/etc/$orig_pkgname/config.py"
    ln --symbolic "/etc/$orig_pkgname/config.py" "$pkgdir/opt/$orig_pkgname/config.py"

    install -p -D -m644 "contrib/$orig_pkgname.service" \
        "$pkgdir/usr/lib/systemd/system/$orig_pkgname.service"
}
