# Maintainer: pescepalla <pescepalla@posteo.me>

pkgname='ibus-typing-booster-git'
pkgdesc='A completion input method for faster typing, git version.'
pkgver=git
pkgrel=1
url='https://mike-fabian.github.io/ibus-typing-booster/'
arch=('any')
license=('GNU3')
makedepends=('git')

depends=(
		'ibus'
        'm17n-lib'
        'python-dbus'
        'python-gobject'
        'sqlite'
	)
	
optdepends=(
		'python-pyenchant'
	)

provides=("ibus-typing-booster-git")
conflicts=("ibus-typing-booster")
source=("${pkgname}::git+https://github.com/mike-fabian/ibus-typing-booster.git")
sha256sums=('SKIP')

pkgver() {
  cd "${pkgname}"

  git describe --long --tags \
    | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}

build() {
	cd "${pkgname}"
	./autogen.sh --prefix=/usr --libexecdir=/usr/lib/ibus
	./configure --prefix=/usr --libexecdir=/usr/lib/ibus
	make
}

#check() {
#	cd "${pkgname}"
#	make check
# }

package() {
	cd "${pkgname}"
	#remove local schema if it exists because it may conflict with /usr/share/glib-2.0/schemas/org.freedesktop.ibus.engine.typing-booster.gschema.xml
	SCHEMA="/usr/local/share/glib-2.0/schemas/org.freedesktop.ibus.engine.typing-booster.gschema.xml"
	if [ -f $SCHEMA ]
	then
		rm $SCHEMA
	fi
	#install
	make DESTDIR="$pkgdir/" install
}
