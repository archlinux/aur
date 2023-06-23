# Maintainer: Fernando Seoane <fseoane@hotmail.com>
mypackagename=pyNotify
pkgname=pynotify-git
pkgbase=pynotify-git
pkgver=0.5
pkgrel=1
epoch=
pkgdesc="A Gnome (wayland) shell notifier for Gotify server."
arch=('x86_64')
url="https://github.com/fseoane/pyNotify.git"
license=('MIT')
groups=()
depends=('libappindicator-gtk3' 'gnome-shell-extension-appindicator')
makedepends=('git' 'python3' 'python-pip')
checkdepends=()
optdepends=()
provides=(pyNotify)
conflicts=(pyNotify)
replaces=(pyNotify)
backup=()
options=()
install=
changelog=
source=("$mypackagename::$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()



pkgver() {
	#cd "${pkgname}"
	cd "$mypackagename"
	printf "0.5.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

prepare() {
	cd "$mypackagename"
 	echo "$pkgver" > pyNotify.ver
}

build() {

	cd "$mypackagename"
	mkdir .env 
	python -m venv .env
	source .env/bin/activate
	
	python  -m pip install --upgrade pip setuptools wheel

	python -m pip cache purge

	python -m pip install gotify[stream]
	python -m pip install pyinstaller
	python -m pip install pygame
	python -m pip install pygobject
	python -m pip install asyncio
	python -m pip install pystray
	python -m pip install pillow
	python -m pip install psutil

	pyinstaller --onefile --windowed pyNotify.py

	deactivate
	rm -rf .env
}


package() {
	cd "$mypackagename"

	sudo mkdir -p /opt/${mypackagename}
	
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/dist/${mypackagename} /opt/${mypackagename}/${mypackagename}
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${mypackagename}.desktop /opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.ogg /opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.png /opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/*.svg /opt/${mypackagename}/
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${mypackagename}.ver /opt/${mypackagename}/${mypackagename}.ver
	sudo install -Dm755 --owner=root --group=users ${srcdir}/${pkgname}/${mypackagename}.conf /opt/${mypackagename}/${mypackagename}.conf.sample

	desktop-file-install --dir=$HOME/.local/share/applications /opt/${mypackagename}/${mypackagename}.desktop
	sudo install -Dm644 LICENSE "/usr/share/licenses/${pkgname}/LICENSE"
	sudo install -Dm644 README.md "/usr/share/doc/${pkgname}/README.md"
}
