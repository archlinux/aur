# Maintainer: SlimShadyIAm me[at]slim[dot]ovh
pkgname=premid-git
pkgver=r525.0cc0ec6
pkgrel=1
pkgdesc="PreMiD adds Discord Rich Presence support to a lot of services you use and love."
url='https://github.com/PreMiD/PreMiD'
arch=('i686' 'x86_64')
license=('MIT')
depends=('nodejs>=10.0.0' 'npm>=6.0.0')
makedepens=('git')
source=("git+${url}.git")

md5sums=('SKIP')

pkgver() {
 cd "${pkgname}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

	# Set up file structure
	mkdir -p "${pkgdir}/usr/lib/${pkgname}/"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"

	# Get a path of fetched source directory
	_git_rev=`ls ${srcdir}/|grep --regexp="[^-]*$" --only-matching --max-count=1`
	_git_srcdir="${srcdir}"

	# Add launcher script to /usr/bin/
	echo "#!/bin/bash
	cd /usr/lib/premid/
	./PreMiD" > "${pkgdir}/usr/bin/${pkgname}"
	chmod +x "${pkgdir}/usr/bin/${pkgname}"

	# Create application menu shortcut
	echo "[Desktop Entry]
	Name=PreMiD
	GenericName=PreMiD
	Comment=PreMiD adds Discord Rich Presence support to a lot of services you use and love.
	Exec=/usr/bin/PreMiD
	Terminal=false
	Type=Application
	Icon=premid.png" > "${pkgdir}/usr/share/applications/premid.desktop"
	
	# Install dependency modules
	cd "${pkgname}"
	npm install

	cd "${pkgname}"/src 
	npm install 

	cd "${pkgname}"
	npm run pkglinux

	# Copy the app files & dependency modules to package directory
	mkdir -p "${pkgdir}/usr/lib/${pkgname}/"
	cd "${pkgname}"/out
	cp -r ./* "${pkgdir}/usr/lib/${pkgname}/"

	cp assets/images/logo.png "${pkgdir}/usr/share/pixmaps/premid.png"

	# Copy a license file to package directory
	install -Dm644 ../LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	# Remove references to $srcdir of node_modules directory
	grep -l "${srcdir}" -r "${pkgdir}" | xargs sed -i "s#${_git_srcdir}#/usr/lib/${pkgname}#g"

}
