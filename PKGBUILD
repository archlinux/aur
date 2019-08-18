# Maintainer: SlimShadyIAm me[at]slim[dot]ovh
pkgname=premid-git
pkgver=r525.0cc0ec6
pkgrel=1
pkgdesc="PreMiD adds Discord Rich Presence support to a lot of services you use and love."
url='https://github.com/PreMiD/PreMiD'
arch=('i686' 'x86_64')
license=('MIT')
depends=('nodejs>=10.11.0' 'npm>=6.4.1')
makedepens=('git')
source=("git+${url}.git")
md5sums=('SKIP')

foldername=PreMiD

pkgver() {
 cd "${foldername}"
 printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {

	# Set up file structure
	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/"
	mkdir -p "${pkgdir}/usr/bin/"
	mkdir -p "${pkgdir}/usr/share/applications"
	mkdir -p "${pkgdir}/usr/share/pixmaps"

	# Get a path of fetched source directory
	_git_rev=`ls ${srcdir}/|grep --regexp="[^-]*$" --only-matching --max-count=1`
	_git_srcdir="${srcdir}"

	# Add launcher script to /usr/bin/
	echo "#!/bin/bash
	cd /usr/lib/premid/
	./PreMiD" > "${pkgdir}/usr/bin/${pkgname%-git}"
	chmod +x "${pkgdir}/usr/bin/${pkgname%-git}"

	# Create application menu shortcut
	echo "[Desktop Entry]
	Name=PreMiD
	GenericName=PreMiD
	Comment=PreMiD adds Discord Rich Presence support to a lot of services you use and love.
	Exec=/usr/bin/premid
	Terminal=false
	Type=Application
	Icon=premid.png" > "${pkgdir}/usr/share/applications/premid.desktop"
	
	# Install dependency modules
	cd "${foldername}"
	npm install

	cd src
	npm install 

	cd ..
	npm run pkglinux

	# Copy the app files & dependency modules to package directory
	mkdir -p "${pkgdir}/usr/lib/${pkgname%-git}/"
	cd out/PreMiD-linux-x64
	cp -r ./* "${pkgdir}/usr/lib/${pkgname%-git}/"

	cd ../../

	cp src/assets/images/logo.png "${pkgdir}/usr/share/pixmaps/premid.png"

	# Copy a license file to package directory
	install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname%-git}/LICENSE"
}
